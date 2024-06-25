" Jump to tab that contains an open buffer

" fixme: make this cycle to the next tab, and if you are at the last one,
" continue cycling from the first.
function! Go(buf)
  " dbg
  echo a:buf
  let tabiter = 1
  while tabiter <= tabpagenr('$')
    let bufno = 1
    for bufiter in tabpagebuflist(tabiter)
      " dbg:
      let indicator = ""
      let bufpath_escaped = expand(bufname(bufiter))
      if bufname(bufiter) == expand(a:buf)
        execute "tabnext ".tabiter
        execute bufno . "wincmd w"
        " dbg
        let indicator = " <"
        endif
      " dbg
      echo tabiter . ": " . bufpath_escaped . indicator
      let bufno += 1
      endfor
    let tabiter += 1
    endwhile
  endfunction
" Note: you can complete partial names by doing :Go *partial*name*<Tab>.
command! -complete=buffer -nargs=1 Go call Go(<f-args>)
