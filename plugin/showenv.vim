" TODO: fix this to use g:cmdleader
" List env vars that Vim sees:
function! ShowEnv()
  let evars = environ()
  for var in evars->keys()->sort()
      echo var . '=' . evars[var]
  endfor
endfunction
command! ShowEnv ;call ShowEnv()
