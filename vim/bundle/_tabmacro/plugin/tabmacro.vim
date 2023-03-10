
function! TabMacro(key, value)
  if !exists("b:tabmacros")
    let b:tabmacros = {}
  endif
  let b:tabmacros[a:key] = a:value
endfunction
command -nargs=* TabMacro :call TabMacro(<args>)

function! TabMacroify()
  if !exists("b:tabmacros")
    return
  endif
  let line = getline('.')
  for [key, value] in items(b:tabmacros)
    if match(line, key) != -1
      execute "normal! " . b:tabmacros[key]
      return
    endif
  endfor
endfunction

" would allow to execute current line
"nnoremap <TAB> :call TabMacroify()<CR>

