" If you like this vimrc, Follow my repo on BitBucket!
"           <https://bitbucket.org/cheater/vimrc/>
"
"                                                         
"                           ,ji,                          
"    ,@HHHHHHHHHHHHHHHHHHH "!:!!Y*,  ,HHHHHHHHHHHHHHHHHHHt
"    'QYY?00000000000VYYYT ;!!!!!!<= <2YYV00000000000002Yr
"        #000000000001I ,..!!!!!!!!!=  vd80000000000PY=^  
"        #00U000U000U1I ;!!!!!!!:!' vdH800000000U0YI^     
"        #000000000001I ;!!!!!!'`vd9t00%0000000Y*^`       
"        #000000000001I ;!!!'`vd9S%%00000000V1^`.         
"        #0000U00U00U1I :'`,dPH%0000000002Yr^,.!=T),      
"    .;` #000000000001I ,aPHJ0000000000Y/^ .=!!!!+!TT*,   
" .,VY:` #000U000000014MHJ%00000^"''''^ .=!!!!!!!!!:!!<Ts,
" '=!:!` #000000000U0mG00000000"' hnv  +!!!!!!!:!!!!!!=:``
"    `=' #0000000U000000000000V" d%%" ;!!!!!!:!!!!!:=``   
"      ` #000U0000000000000VY`'       ''``'"""'``''`      
"        #000000000000U00Yr^ ' U002 ! "U00N>=vJ0UNn>=JU00\
"        #0000000U000U?*^ .<` JU02 :; J00^.-- J00~   .U00'
"        #0000U0000%*^`-=!!` JU02 :: J00F-`  J00(    d%02 
"        #0000002Y'` -^!!!" J002  : J002    JU02    J002  
"        YPYYYY='     `'===......<=                       
"                        `==!!+!=``   Config File         
"                           `-'`            by cheater    
"                                                         

setlocal nocompatible
setlocal
\    expandtab
\    tabstop=8
\    shiftwidth=4
\    ruler
"\    cindent
syntax on
setlocal bg=dark


":colorscheme railscasts

" Note: you can't use prepend-\ line continuations after "comments, or
" the continuation will also be seen as a comment!

filetype plugin on         " load ftplugin.vim
setlocal history=1000      " number of commands and search patterns to save
setlocal showcmd           " show the command in the lower right corner
setlocal binary            " show control characters (ignore 'fileformat')
setlocal undolevels=1000   " maximum number of changes that can be undone
if exists('+undodir')      " set undodir stuff, which saves the undo history in an
                           " external file, across saves. New in Vim 7.3
  setlocal undodir=~/.vim/undodir
  setlocal undofile
  setlocal undoreload=10000 " maximum number lines to save for undo on a buffer reload
endif
setlocal modelines=0       " no remote code execution, thank you
setlocal shiftround        " round alignment to nearest indent when shifting
                           " with < and >
setlocal formatoptions+=r  " continue comment on next line
setlocal formatoptions+=2  " continue indent from second line of paragraph,
                           " not first
setlocal nojoinspaces      " no double spaces after . when joining lines with J
setlocal incsearch         " incremental search
setlocal ignorecase        " ignore case when searching (see smartcase)
setlocal smartcase         " do not ignore case if pattern has mixed case
                           " (see ignorecase)
setlocal showmatch         " show matching brackets by flickering cursor
setlocal matchtime=1       " show matching brackets quicker than default
setlocal hidden            " so that when doing g] in ctags you don't save out
setlocal noautowrite       " don't save buffers when abandoning (going out of)
                           " them, e.g. with g]
setlocal switchbuf=useopen " prefer already open windows when switching buffers

setlocal t_Co=256          " Much more beautiful than the standard of using
                           " just 8 colors! You can do:
                           "
                           " :so $VIMRUNTIME/syntax/hitest.vim
                           " ^ in order to see all the highlight groups that you
                           " can access. Called :HighlightTest in this vimrc.
                           " Additionally, you can do :ColorTest to just see
                           " all the supported colors.
                           "
                           " Then, you can also do things such as:
                           " :mat DiffAdd /[^=<>]=[^=]/
                           " ^ to show all assignments
                           "
                           " :2mat SpellLocal /\<some_word\>/
                           " ^ to search for some_word
                           "
                           " :call matchadd("DiffText", "\\<word\\>")
                           " ^ to match another word, if you need more
                           " highlight groups. you can do matchadd() over and
                           " over for infinite groups! then do
                           "
                           " :call matchlist()
                           " ^ to see a list of matches
                           "
                           " :call matchdelete(7)
                           " ^ to delete the 7th match group
                           "
                           " :call clearmatches()
                           " ^ to clear all matches.
                           "
                           " Note: don't use :3mat, that's pretty much
                           " reserved for highlighting matching parentheses.

setlocal laststatus=2      " always show status.
" the following two status lines that are commented out were ripped off someone
" else... :)
" setlocal statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]
" setlocal statusline=%<%f%y\ \ %h%m%r%=%-14.(%l/%L,%c%V%)\ %P
setlocal statusline=\ %n\ %<%f\ [%M%Y%R]%h%w%=\ [L%l\ C%v\ %p%%]
setlocal title             " show the title!
setlocal titlestring=%<%f\ [%M%Y%R]\ -\ VIM
\    hlsearch
\    suffixes+=
        \.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,
        \.idx,.ilg,.inx,.out,.toc,.pyc,
        \.jpg,.bmp,.gif,.png,.tif,.tiff,
        \.wmv,.avi,.mpg,.mpeg,.asf,.flv,.mov,
        \.wav,.aif,.aiff,.mp3,.flac,.mp4
" ^the suffixes are what files Vim should normally ignore when autocompleting
" file names, for :e :w and so on

setlocal showbreak=↪\           " right hook arrow for wrapped chars
setlocal list                   " show chars using listchars.
setlocal listchars=             " but don't use the default of showing newlines
                                " with $.
setlocal listchars+=tab:▸\      " make tabs show up
setlocal listchars+=nbsp:·      " middle dot for non-breaking spaces
"setlocal listchars+=eol:¬

autocmd FileType *
\    setlocal
\        tabstop=8
\        shiftwidth=2
\        noexpandtab

autocmd BufRead,BufNewFile *.md
\   setlocal filetype=markdown

autocmd FileType markdown
\   setlocal syntax=markdown
\        fileformat=unix
\        encoding=utf-8
\        tabstop=8
\        shiftwidth=8
\        smarttab
\        softtabstop=4
\        noshiftround

autocmd BufRead,BufNewFile *.sh,*.bash
\       setlocal filetype=sh

autocmd FileType sh
\    syntax on
\   |setlocal
\        syntax=sh
\        smartindent
\        fileformat=unix
\        encoding=utf-8
\        tabstop=8
\        shiftwidth=4
\        smarttab
\        expandtab
\        softtabstop=4
\        autoindent
\        cinwords=elif,else,for,if,while,then,else,fi,until,do,done
\   |inoremap # X#
"the ctrl-H has to be entered specially


autocmd BufRead,BufNewFile *.py
\    setlocal filetype=python

autocmd FileType python
\    syntax on
\   |setlocal
\        tabstop=8
\        shiftwidth=4
\        smarttab
\        expandtab
\        softtabstop=4
\        autoindent
\        syntax=python
\        smartindent
\        fileformat=unix
\        encoding=utf-8
\        cinwords=class,def,elif,else,except,finally,for,if,try,while
\   |highlight BadWhitespace ctermbg=red guibg=red
\   |match BadWhitespace /^\t\+/
\   |let python_highlight_all=1
\   |inoremap # # X
"the ctrl-H has to be entered specially
"consider using cindent instead of smartindent.
autocmd FileType python :LongLinesShow

autocmd BufRead,BufNewFile *.hs
\    setlocal filetype=haskell
autocmd FileType haskell
\    syntax on
\   |setlocal
\        tabstop=8
\        shiftwidth=4
\        smarttab
\        expandtab
\        softtabstop=4
\        autoindent
\        syntax=haskell
\        smartindent
\        fileformat=unix
\        encoding=utf-8
\   |highlight BadWhitespace ctermbg=red guibg=red
\   |match BadWhitespace /^\t\+/
\   |let python_highlight_all=1
\   |inoremap # # X
"the ctrl-H has to be entered specially
autocmd FileType haskell :LongLinesShow


autocmd BufRead,BufNewFile *.php,*.ihtml
\    setlocal filetype=php

autocmd FileType php
\    syntax on
\   |setlocal
\        autoindent
\        syntax=php
\        smartindent
\        fileformat=unix
\        encoding=utf-8
\        tabstop=8
\        shiftwidth=4
\        smarttab
\        expandtab
\        softtabstop=4
"       \foldmethod=indent

" Highlight long lines
"command LongLinesShow let w:m1=matchadd('Search', '\%<81v.\%>77v', -1) | let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
"command LongLinesHide call matchdelete(w:m1) | call matchdelete(w:m2)
command LongLinesShow let w:m2=matchadd('ErrorMsg', '\%>79v.\+', -1)
command LongLinesHide call matchdelete(w:m2)

if exists('+colorcolumn')
  set colorcolumn=79
else
  "au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>79v.\+', -1)
  "autocmd BufRead,BufNewFile *.bash,*.php,*.ihtml,*.txt,*.py,*.cgi :LongLinesShow
endif

" Show the Syntax Highlight Groups
command HighlightTest source $VIMRUNTIME/syntax/hitest.vim

" Show all the colors that Vim supports!
command ColorTest source $VIMRUNTIME/syntax/colortest.vim

" Swap ";" and ":".  Convenient.
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Search mappings: These will make it so that going to the next result in a
" search will center on the line it's found in.
map N Nzz
map n nzz

" use :w!! to write to a file using sudo if you forgot to "sudo vim file"
command SudoWrite %!sudo tee > /dev/null %

" Always disable paste mode when leaving insert mode
au InsertLeave * setlocal nopaste

" Makes Caps Lock work as Esc
command EscToCapsLock !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'

setlocal tags=./tags;,./TAGS;,tags;,TAGS; " Find tags directory by going
                                          " up from file and from cwd

" Remove the <F1> help binding. I use <F1> and <F2> in my terminal emulator to
" cycle tabs.
nmap <F1> <nop>
vmap <F1> <nop>
imap <F1> <nop>

" Cycle tabs in Vim:
nmap <F3> ;tabprevious<CR>
vmap <F3> ;tabprevious<CR>
imap <F3> <C-o>;tabprevious<CR>
nmap <F4> ;tabnext<CR>
vmap <F4> ;tabnext<CR>
imap <F4> <C-o>;tabnext<CR>

" Move tabs in Vim:
function MoveTabLeft()
  " Moves the current tab to the left, wrapping around to the last tab if tab
  " is currently the first one.
  if tabpagenr() > 1
    execute "tabmove ".(tabpagenr()-2)
  elseif tabpagenr() == 1
    execute "tabmove ".tabpagenr('$')
    endif
  endfunction
command MoveTabLeft ;call MoveTabLeft()

function MoveTabRight()
  " Moves the current tab to the right, wrapping around to the first tab if
  " tab is currently the last one.
  if tabpagenr() < tabpagenr('$')
    execute "tabmove ".(tabpagenr())
  elseif tabpagenr() == tabpagenr('$')
    execute "tabmove 0"
    endif
  endfunction
command MoveTabRight ;call MoveTabRight()

" I have also tried <S-F3> and <S-F4> but they didn't work, and just put
" garbled text into the file being edited... wonder why? Might have to do with
" this crappy Mac I'm working on right now, running GNU/Linux via Parallels.
nmap <silent> <F5> ;MoveTabLeft<CR>
vmap <silent> <F5> ;MoveTabLeft<CR>
imap <silent> <F5> <C-o>;MoveTabLeft<CR>
nmap <silent> <F6> ;MoveTabRight<CR>
vmap <silent> <F6> ;MoveTabRight<CR>
imap <silent> <F6> <C-o>;MoveTabRight<CR>


" -------------- begin automatic vim-addon-manager setup.
" This was copied directly from the documentation for VAM; the indentation may
" differ from the rest of this vimrc. Then I modified the code below by doing
" the following:
" 1. add a line that says:
" let g:vim_addon_manager = {'auto_install' : 1 }
" 2. modify
" call vam#ActivateAddons([], {'auto_install' : 0})
" to:
" call vam#ActivateAddons([], {'auto_install' : 1})

let g:vim_addon_manager = {'auto_install' : 1 }

fun SetupVAM()
  let g:vim_addon_manager = {'auto_install' : 1 }
  " YES, you can customize this vam_install_path path and everything still works!
  let vam_install_path = expand('$HOME') . '/.vim/vim-addons'
  exec 'set runtimepath+='.vam_install_path.'/vim-addon-manager'

  " * unix based os users may want to use this code checking out VAM
  " * windows users want to use http://mawercer.de/~marc/vam/index.php
  "   to fetch VAM, VAM-known-repositories and the listed plugins
  "   without having to install curl, unzip, git tool chain first
  " -> BUG [4] (git-less installation)
  if !filereadable(vam_install_path.'/vim-addon-manager/.git/config') && 1 == confirm("git clone VAM into ".vam_install_path."?","&Y\n&N")
    " I'm sorry having to add this reminder. Eventually it'll pay off.
    call confirm("Remind yourself that most plugins ship with documentation (README*, doc/*.txt). Its your first source of knowledge. If you can't find the info you're looking for in reasonable time ask maintainers to improve documentation")
    exec '!p='.shellescape(vam_install_path).'; mkdir -p "$p" && cd "$p" && git clone --depth 1 git://github.com/MarcWeber/vim-addon-manager.git'
    " VAM run helptags automatically if you install or update plugins
    exec 'helptags '.fnameescape(vam_install_path.'/vim-addon-manager/doc')
  endif

  " Example drop git sources unless git is in PATH. Same plugins can
  " be installed form www.vim.org. Lookup MergeSources to get more control
  " let g:vim_addon_manager['drop_git_sources'] = !executable('git')

  call vam#ActivateAddons([], {'auto_install' : 1})
  " sample: call vam#ActivateAddons(['pluginA','pluginB', ...], {'auto_install' : 0})
  " where 'pluginA' could be "git://" "github:YourName" or "snipmate-snippets" see vam#install#RewriteName()
  " also see section "5. Installing plugins" in VAM's documentation
  " which will tell you how to find the plugin names of a plugin
endf
call SetupVAM()
" experimental: run after gui has been started (gvim) [3]
" option1:  au VimEnter * call SetupVAM()
" option2:  au GUIEnter * call SetupVAM()
" See BUGS sections below [*]
" Vim 7.0 users see BUGS section [3]

" -------------- end automatic vim-addon-manager setup.

" Install some addons using VAM.

call vam#ActivateAddons(['Indent_Guides']) " lets you use :IndentGuidesToggle
"silent! UpdateActivatedAddons
