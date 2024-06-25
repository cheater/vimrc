" Enable the :Man command shipped inside Vim's man filetype plugin.
" Renders beautiful manpages.
if exists(':Man') != 2 && !exists('g:loaded_man') && &filetype !=? 'man' && !has('nvim')
  runtime ftplugin/man.vim
endif
