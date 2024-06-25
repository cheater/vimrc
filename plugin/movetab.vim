" TODO: fix this to use g:cmdleader
" Move tabs in Vim:
function! MoveTabLeft()
  " Moves the current tab to the left, wrapping around to the last tab if tab
  " is currently the first one.
  if tabpagenr() > 1
    execute "-tabmove"
  elseif tabpagenr() == 1
    execute "$tabmove"
    endif
  endfunction
command! MoveTabLeft ;call MoveTabLeft()

function! MoveTabRight()
  " Moves the current tab to the right, wrapping around to the first tab if
  " tab is currently the last one.
  if tabpagenr() < tabpagenr('$')
    execute "+tabmove"
  elseif tabpagenr() == tabpagenr('$')
    execute "0tabmove"
    endif
  endfunction
command! MoveTabRight ;call MoveTabRight()
