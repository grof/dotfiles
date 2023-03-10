
# 1. start vim
# 2. execute ESC-h
vim-() {
  vim -s <(printf '\eh')
}

# http://superuser.com/questions/210054/make-a-pipe-conditional-on-non-empty-return
pipe_if_not_empty () {
  head=$(dd bs=1 count=1 2>/dev/null; echo a)
  head=${head%a}
  if [ "x$head" != x"" ]; then
    { printf %s "$head"; cat; } | "$@"
  fi
}
export -f pipe_if_not_empty

# start vim in PAGER mode
vim_picker() {
  pipe_if_not_empty \
    vim -c "setlocal noreadonly" \
        -c "setlocal cursorline" \
        -c "setlocal number" \
        -c "nnoremap <buffer> <CR> V:w! ~/.picked<CR>:qa!<CR>" \
        -c "vnoremap <buffer> <CR>  :w! ~/.picked<CR>:qa!<CR>" \
        -R -
}
export -f vim_picker

# 1st parameter is command to generate a list
# 2nd parameter is command to run on selection
# 3rd (optional) parameter is DIRECT selection, bypassing VIM
pick_with_vim() {
  local TARGET=$HOME/.picked

  if [ -e "$TARGET" ]; then
    rm "$TARGET"
  fi

  if [ -n "$3" ]; then
    eval "$1" | sed -n $3p > "$TARGET"
  else
    eval "$1" | vim_picker
  fi

  if [ ! -e "$TARGET" ]; then
    return
  fi

  local old_IFS="$IFS"
  IFS=$'\n'
  local lines=($(eval ${FILTER:-cat} "$TARGET"))
  IFS="$old_IFS"

  # neat! add this line to the bash history
  # as if we had typed it
  history -s $2 "${lines[@]}"
  eval $2 "${lines[@]}"
}
export -f pick_with_vim

