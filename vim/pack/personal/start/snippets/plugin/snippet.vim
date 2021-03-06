
"-- the master container
let g:snippets = {}

function! SnippetG(key, value)
  let g:snippets[a:key] = a:value
endfunction
command -nargs=* SnippetG :call SnippetG(<args>)

function! Snippet(key, value)
  "echom a:key . ' -> ' . a:value
  if !exists("b:snippets")
    let b:snippets = {}
  endif
  let b:snippets[tolower(a:key)] = a:value
endfunction
command -nargs=* Snippet :call Snippet(<args>)

function! SnippetComplete(...)
  let key   = a:1
  let value = a:1
  if a:0 > 1
    let value = a:2
  endif
  let i = 3
  while i <= len(key)
     call Snippet(strpart(key, 0, i), value)
     let i = i + 1
  endwhile
endfunction
command -nargs=* SnippetComplete :call SnippetComplete(<args>)

function! SnippetMatch(text)
  let text = tolower(a:text)
  if exists("b:snippets")
    let snippets = extend(copy(g:snippets), b:snippets)
  else
    let snippets = g:snippets
  endif

  if !has_key(snippets, text)
    return ""
  endif

  if type(snippets[text]) == 2 " Funcref
    call inputsave()
    let result = snippets[text](text)
    call inputrestore()
    return result
  endif

  return snippets[text]
endfunction

function! SubstringsFromRight(text)
  let result = []
  let i = 1
  while i <= len(a:text)
     call add(result, strpart(a:text, len(a:text)-i, i))
     let i = i + 1
  endwhile
  return result
endfunction

function! SnippetReplace()
  let @y = "a"

  let line_to_cursor = strpart(getline('.'), 0, col('.'))
  let eol = col('.') == strlen(getline('.'))
  let substrings = SubstringsFromRight(line_to_cursor)

  for string in substrings
    let result = SnippetMatch(string)

    if strlen(result)
      let @" = result

      " replace text with snippet
      if len(string)-1
        execute "normal! v" . (len(string) - 1) . "hgp"
      else
        execute "normal! vgp"
      endif

      " position cursor wrt eol
      if eol
        let @y = "a"
      else
        let @y = "i"
      endif

      " if snippet contains a pipe (|), position cursor
      if match(result, "|") != -1
        call search("|", "b")
        let @y = "xi"
      endif

      return
    endif
  endfor
endfunction

"-- mappings
inoremap <TAB> <ESC>:call SnippetReplace()<CR>@y

