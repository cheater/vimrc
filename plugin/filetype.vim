autocmd FileType *
\   setlocal
\       tabstop=4
\       shiftwidth=2
\       expandtab
\       encoding=utf-8
\   | if &modifiable
\       | setlocal
\           fileformat=unix
\       | endif

" autocmd FileType javascript
" \   LongLinesShow

autocmd FileType markdown
\   setlocal
\       tabstop=8
\       softtabstop=4
\       shiftwidth=8
\       smarttab
\       noshiftround
\       autoindent

autocmd FileType clojure
\   setlocal
\       tabstop=8
\       softtabstop=4
\       shiftwidth=4
\       smarttab
\       expandtab
\       noshiftround
\       autoindent

autocmd FileType sh
\   setlocal
\       smartindent
\       tabstop=4
\       softtabstop=2
\       shiftwidth=2
\       smarttab
\       expandtab
\       autoindent
\       cinwords=elif,else,for,if,while,then,else,fi,until,do,done

autocmd FileType awk
\   setlocal
\       smartindent
\       tabstop=8
\       softtabstop=4
\       shiftwidth=4
\       smarttab
\       expandtab
\       autoindent

autocmd FileType vim
\   setlocal
\       smartindent
\       tabstop=8
\       softtabstop=2
\       shiftwidth=2
\       smarttab
\       expandtab
\       autoindent

autocmd FileType python
\   setlocal
\       tabstop=8
\       softtabstop=4
\       shiftwidth=4
\       smarttab
\       expandtab
\       autoindent
\       syntax=python
\       smartindent
\       cinwords=class,def,elif,else,except,finally,for,if,try,while
\   | highlight BadWhitespace ctermbg=red guibg=red
\   | match BadWhitespace /^\t\+/
\   | let python_highlight_all=1

autocmd FileType python setlocal errorformat& " those two can't be joined above
autocmd FileType python setlocal errorformat+=
            \File\ \"%f\"\\,\ line\ %l%.%#,
            \%C\ %.%#,
            \%-A\ \ File\ \"unittest%.py\"\\,\ line\ %.%#,
            \%-A\ \ File\ \"%f\"\\,\ line\ 0%.%#,
            \%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,
            \%Z%[%^\ ]%\\@=%m
" Python tracebacks (unittest + doctest output)

" consider using cindent instead of smartindent.

autocmd FileType haskell
\   setlocal
\       tabstop=2
\       softtabstop=2
\       shiftwidth=2
\       smarttab
\       expandtab
\       autoindent
\       smartindent
\   | highlight BadWhitespace ctermbg=red guibg=red
\   | match BadWhitespace /^\t\+/
\   | let python_highlight_all=1

" Outline Python code:
function! OutlinePy()
  " the below regex searches for a string which starts at the beginning of the
  " line, then perhaps has some whitespace, then either has the keyword def or
  " class, and then has one whitespace character. The command g/re/p then
  " prints all such strings.
  execute "g/^\\s*\\(def\\|class\\)\\s/p"
  endfunction
command! OutlinePy ;call OutlinePy()


autocmd FileType cabal
\   setlocal
\       tabstop=2
\       softtabstop=2
\       shiftwidth=2
\       smarttab
\       expandtab
\       autoindent
\       smartindent
\   | highlight BadWhitespace ctermbg=black guibg=black
\   | match BadWhitespace /^\t\+/

autocmd FileType php
\   setlocal
\       autoindent
\       smartindent
\       tabstop=4
\       softtabstop=4
\       shiftwidth=4
\       smarttab
\       expandtab

autocmd FileType text
\   if &buftype!=#"help"
\       | setlocal
\           tabstop=8
\           softtabstop=4
\           shiftwidth=4
\           smarttab
\           expandtab
\       | endif
" The pipes above are necessary because, the way Vim sees things, the whole
" autocommand is one big line. You can have if clauses in one line, but you
" need to separate the parts with the pipe.


" -- LSP integration

let lspServers = []
if executable('haskell-language-server')
  let lspServers += [#{
    \ name: 'HLS',
    \ filetype: ['haskell', 'cabal'],
    \ path: 'haskell-language-server',
    \ args: []
    \ }]
  endif
autocmd User LspSetup call LspAddServer(lspServers)
