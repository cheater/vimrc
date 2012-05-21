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
"        #000000000000U00Yr^ ' U002 . "U00N>=vJ0UNn>=JU00\
"        #0000000U000U?*^ .<` JU02 .' J00^.-- J00~   .U00'
"        #0000U0000%*^`-=!!` JU02 .  J00F-`  J00(    d%02 
"        #0000002Y'` -^!!!" J002    J002    JU02    J002  
"        YPYYYY='     `'===......<=                       
"                        `==!!+!=``   Config File         
"                           `-'`            by cheater    
"                                                         
"
" Main changes to how normal Vim operates:
" - s and c are swapped
" - c is used for surround.vim, it is like what surround.vim normally uses s for
" - you enter command mode with ; instead of :
" - repeat-quick-move is : instead of ;
" - <F3> and <F4> scroll through tabs, <S-F3> and <S-F4> move them

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
set      nomodeline
set      modelines=0       " no remote code execution, thank you
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
set title             " show the title!
set titlestring=%<%f\ [%M%Y%R]\ -\ VIM
if has("extra_search")
  setlocal hlsearch        " highlight search matches
  nohlsearch               " but not initially
  endif
setlocal suffixes+=
        \.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,
        \.idx,.ilg,.inx,.out,.toc,.pyc,.pyo,
        \.jpg,.bmp,.gif,.png,.tif,.tiff,
        \.wmv,.avi,.mpg,.mpeg,.asf,.flv,.mov,
        \.wav,.aif,.aiff,.mp3,.flac,.mp4
" ^the suffixes are what files Vim should normally ignore when autocompleting
" file names, for :e :w and so on

if has("linebreak")
  setlocal showbreak=↪\           " right hook arrow for wrapped chars
  endif
setlocal list                   " show chars using listchars.
setlocal listchars=             " but don't use the default of showing newlines
                                " with $.
setlocal listchars+=tab:▸\      " make tabs show up
setlocal listchars+=nbsp:·      " middle dot for non-breaking spaces
"setlocal listchars+=eol:¬

autocmd FileType *
\    setlocal
\        tabstop=8
\        shiftwidth=4
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

" Python tracebacks (unittest + doctest output)
setlocal errorformat&
setlocal errorformat+=
            \File\ \"%f\"\\,\ line\ %l%.%#,
            \%C\ %.%#,
            \%-A\ \ File\ \"unittest%.py\"\\,\ line\ %.%#,
            \%-A\ \ File\ \"%f\"\\,\ line\ 0%.%#,
            \%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,
            \%Z%[%^\ ]%\\@=%m

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

" compat mapping for gnome-terminal:
map O1;2R <S-F3>
map O1;2S <S-F4>

nmap <silent> <S-F3> ;MoveTabLeft<CR>
vmap <silent> <S-F3> ;MoveTabLeft<CR>
imap <silent> <S-F3> <C-o>;MoveTabLeft<CR>
nmap <silent> <S-F4> ;MoveTabRight<CR>
vmap <silent> <S-F4> ;MoveTabRight<CR>
imap <silent> <S-F4> <C-o>;MoveTabRight<CR>

" Outline Python code:
function OutlinePy()
  " the below regex searches for a string which starts at the beginning of the
  " line, then perhaps has some whitespace, then either has the keyword def or
  " class, and then has one whitespace character. The command g/re/p then
  " prints all such strings.
  execute "g/^\\s*\\(def\\|class\\)\\s/p"
  endfunction
command OutlinePy ;call OutlinePy()

" Backup files:
setlocal backup                      " make backups
setlocal backupdir=~/tmp/vim-backup  " but don't clutter $PWD with them
if $USER == "root"
  " 'sudo vi' on certain machines cannot write to ~/tmp (NFS root-squash)
  setlocal backupdir=/root/tmp/vim-backup
endif
if !isdirectory(&backupdir)
  " create the backup directory if it doesn't already exist
  exec "silent !mkdir -p " . &backupdir
endif

" Persistent undo (vim 7.3+)
if has("persistent_undo")
  setlocal undofile                     " enable persistent undo
  let &undodir=&backupdir . "/.vimundo" " but don't clutter $PWD
  if !isdirectory(&undodir)
    " create the undo directory if it doesn't already exist
    exec "silent !mkdir -p " . &undodir
    endif
  endif


" Various stuff:
setlocal hidden             " side effect: undo list is not lost on C-^
setlocal browsedir=buffer   " :browse e starts in %:h (file's dir), not $PWD
setlocal switchbuf=useopen  " quickfix reuses open windows
if v:version >= 600
  setlocal splitright       " new window in a visual split is on the right
  endif
setlocal backspace=indent,eol,start  " sane backspacing
setlocal wrap                        " wrap long lines"

" Digraphs:
if has("digraphs")          " digraphs are entered as the html entity number
  digraph -- 8212           " em dash
  digraph `` 8220           " left double quotation mark
  digraph '' 8221           " right double quotation mark
  digraph ,, 8222           " double low-9 quotation mark
  digraph ** 8258           " asterism
  endif

" */# search in visual mode (from www.vim.org):
" Atom \V sets following pattern to "very nomagic", i.e. only the backslash
" has special meaning.
" As a search pattern we insert an expression (= register) that
" calls the 'escape()' function on the unnamed register content '@@',
" and escapes the backslash and the character that still has a special
" meaning in the search command (/|?, respectively).
" This works well even with <Tab> (no need to change ^I into \t),
" but not with a linebreak, which must be changed from ^M to \n.
" This is done with the substitute() function.
" See http://vim.wikia.com/wiki/Search_for_visually_selected_text
vnoremap * y/\V<C-R>=substitute(escape(@@,"/\\"),"\n","\\\\n","ge")<CR><CR>
vnoremap # y?\V<C-R>=substitute(escape(@@,"?\\"),"\n","\\\\n","ge")<CR><CR>

" Scrolling with Ctrl+Up/Down
map             <C-Up>          1<C-U>
map             <C-Down>        1<C-D>
imap            <C-Up>          <C-O><C-Up>
imap            <C-Down>        <C-O><C-Down>

" Scrolling with Ctrl+Shift+Up/Down
map             <C-S-Up>        1<C-U><Down>
map             <C-S-Down>      1<C-D><Up>
imap            <C-S-Up>        <C-O><C-S-Up>
imap            <C-S-Down>      <C-O><C-S-Down>

" Readline-like Ctrl-A and Ctrl-E in command line
cnoremap        <C-A>           <Home>

" Do not lose "complete all", see :h c_CTRL-A
cnoremap        <C-S-A>         <C-A>

" Keyboard workarounds

" xterm keys

"   keypad
map             <Esc>[5A        <C-Up>
map             <Esc>[5B        <C-Down>
map             <Esc>[5D        <C-Left>
map             <Esc>[5C        <C-Right>
map!            <Esc>[5A        <C-Up>
map!            <Esc>[5B        <C-Down>
map!            <Esc>[5D        <C-Left>
map!            <Esc>[5C        <C-Right>

map             <Esc>[2D        <S-Left>
map             <Esc>[2C        <S-Right>
map!            <Esc>[2D        <S-Left>
map!            <Esc>[2C        <S-Right>

map             <Esc>O6A        <C-S-Up>
map             <Esc>O6B        <C-S-Down>
map             <Esc>O6D        <C-S-Left>
map             <Esc>O6C        <C-S-Right>
map!            <Esc>O6A        <C-S-Up>
map!            <Esc>O6B        <C-S-Down>
map!            <Esc>O6D        <C-S-Left>
map!            <Esc>O6C        <C-S-Right>

map             <Esc>[5H        <C-Home>
map             <Esc>[5F        <C-End>
map             <Esc>[5;5~      <C-PageUp>
map             <Esc>[6;5~      <C-PageDown>
map!            <Esc>[5H        <C-Home>
map!            <Esc>[5F        <C-End>
map!            <Esc>[5;5~      <C-PageUp>
map!            <Esc>[6;5~      <C-PageDown>

"   keypad in screen
map             <Esc>O5A        <C-Up>
map             <Esc>O5B        <C-Down>
map             <Esc>O5D        <C-Left>
map             <Esc>O5C        <C-Right>
map!            <Esc>O5A        <C-Up>
map!            <Esc>O5B        <C-Down>
map!            <Esc>O5D        <C-Left>
map!            <Esc>O5C        <C-Right>

map             <Esc>O2D        <S-Left>
map             <Esc>O2C        <S-Right>
map!            <Esc>O2D        <S-Left>
map!            <Esc>O2C        <S-Right>

map             <Esc>O5H        <C-Home>
map             <Esc>O5F        <C-End>
map!            <Esc>O5H        <C-Home>
map!            <Esc>O5F        <C-End>

"   function keys
map             <Esc>O5P        <C-F1>
map             <Esc>O5Q        <C-F2>
map             <Esc>O5R        <C-F3>
map             <Esc>O5S        <C-F4>
map             <Esc>[15;5~     <C-F5>
map             <Esc>[17;5~     <C-F6>
map             <Esc>[18;5~     <C-F7>
map             <Esc>[19;5~     <C-F8>
map             <Esc>[20;5~     <C-F9>
map             <Esc>[21;5~     <C-F10>
map             <Esc>[23;5~     <C-F11>
map             <Esc>[24;5~     <C-F12>
map!            <Esc>O5P        <C-F1>
map!            <Esc>O5Q        <C-F2>
map!            <Esc>O5R        <C-F3>
map!            <Esc>O5S        <C-F4>
map!            <Esc>[15;5~     <C-F5>
map!            <Esc>[17;5~     <C-F6>
map!            <Esc>[18;5~     <C-F7>
map!            <Esc>[19;5~     <C-F8>
map!            <Esc>[20;5~     <C-F9>
map!            <Esc>[21;5~     <C-F10>
map!            <Esc>[23;5~     <C-F11>
map!            <Esc>[24;5~     <C-F12>
" rxvt keys

"   keypad
map             <Esc>[a         <S-Up>
map             <Esc>[b         <S-Down>
map             <Esc>[d         <S-Left>
map             <Esc>[c         <S-Right>
map!            <Esc>[a         <S-Up>
map!            <Esc>[b         <S-Down>
map!            <Esc>[d         <S-Left>
map!            <Esc>[c         <S-Right>

map             <Esc>[2$        <S-Insert>
map             <Esc>[3$        <S-Del>
map!            <Esc>[2$        <S-Insert>
map!            <Esc>[3$        <S-Del>
" Other shifted keypad keys are used for scrollback and pasting

map             <Esc>Oa         <C-Up>
map             <Esc>Ob         <C-Down>
map             <Esc>Od         <C-Left>
map             <Esc>Oc         <C-Right>
map!            <Esc>Oa         <C-Up>
map!            <Esc>Ob         <C-Down>
map!            <Esc>Od         <C-Left>
map!            <Esc>Oc         <C-Right>

map             <Esc>[2^        <C-Insert>
map             <Esc>[3^        <C-Del>
map!            <Esc>[2^        <C-Insert>
map!            <Esc>[3^        <C-Del>
map             <Esc>[3;5~      <C-Del>
map!            <Esc>[3;5~      <C-Del>

map             <Esc>[5^        <C-PageUp>
map             <Esc>[6^        <C-Pagedown>
map             <Esc>[7^        <C-Home>
map             <Esc>[8^        <C-End>
map!            <Esc>[5^        <C-PageUp>
map!            <Esc>[6^        <C-Pagedown>
map!            <Esc>[7^        <C-Home>
map!            <Esc>[8^        <C-End>

"   numeric keypad
map             <Esc>Ox         <S-Up>
map             <Esc>Or         <S-Down>
map             <Esc>Ot         <S-Left>
map             <Esc>Ov         <S-Right>
map!            <Esc>Ox         <S-Up>
map!            <Esc>Or         <S-Down>
map!            <Esc>Ot         <S-Left>
map!            <Esc>Ov         <S-Right>

map             <Esc>Op         <S-Insert>
map             <Esc>On         <S-Del>
map!            <Esc>Op         <S-Insert>
map!            <Esc>On         <S-Del>

map             <Esc>Ow         <S-kHome>
map             <Esc>Oq         <S-kEnd>
map             <Esc>Oy         <S-kPageUp>
map             <Esc>Os         <S-kPageDown>
map!            <Esc>Ow         <S-kHome>
map!            <Esc>Oq         <S-kEnd>
map!            <Esc>Oy         <S-kPageUp>
map!            <Esc>Os         <S-kPageDown>

" Ignore KP_CENTER
map             <Esc>Ou         <Nop>
map!            <Esc>Ou         <Nop>

"   function keys
map             <Esc>[25~       <S-F3>
map             <Esc>[26~       <S-F4>
map             <Esc>[28~       <S-F5>
map             <Esc>[29~       <S-F6>
map             <Esc>[31~       <S-F7>
map             <Esc>[32~       <S-F8>
map             <Esc>[33~       <S-F9>
map             <Esc>[34~       <S-F10>
map             <Esc>[23$       <S-F11>
map             <Esc>[24$       <S-F12>
map!            <Esc>[25~       <S-F3>
map!            <Esc>[26~       <S-F4>
map!            <Esc>[28~       <S-F5>
map!            <Esc>[29~       <S-F6>
map!            <Esc>[31~       <S-F7>
map!            <Esc>[32~       <S-F8>
map!            <Esc>[33~       <S-F9>
map!            <Esc>[34~       <S-F10>
map!            <Esc>[23$       <S-F11>
map!            <Esc>[24$       <S-F12>

map             <Esc>[11^       <C-F1>
map             <Esc>[12^       <C-F2>
map             <Esc>[13^       <C-F3>
map             <Esc>[14^       <C-F4>
map             <Esc>[15^       <C-F5>
map             <Esc>[17^       <C-F6>
map             <Esc>[18^       <C-F7>
map             <Esc>[19^       <C-F8>
map             <Esc>[20^       <C-F9>
map             <Esc>[21^       <C-F10>
map             <Esc>[23^       <C-F11>
map             <Esc>[24^       <C-F12>
map!            <Esc>[11^       <C-F1>
map!            <Esc>[12^       <C-F2>
map!            <Esc>[13^       <C-F3>
map!            <Esc>[14^       <C-F4>
map!            <Esc>[15^       <C-F5>
map!            <Esc>[17^       <C-F6>
map!            <Esc>[18^       <C-F7>
map!            <Esc>[19^       <C-F8>
map!            <Esc>[20^       <C-F9>
map!            <Esc>[21^       <C-F10>
map!            <Esc>[23^       <C-F11>
map!            <Esc>[24^       <C-F12>

" gnome-terminal keys in Feisty
map             <Esc>O1;5A      <C-Up>
map             <Esc>O1;5B      <C-Down>
map             <Esc>O1;5D      <C-Left>
map             <Esc>O1;5C      <C-Right>
map!            <Esc>O1;5A      <C-Up>
map!            <Esc>O1;5B      <C-Down>
map!            <Esc>O1;5D      <C-Left>
map!            <Esc>O1;5C      <C-Right>
map             <Esc>O1;6A      <C-S-Up>
map             <Esc>O1;6B      <C-S-Down>
map             <Esc>O1;6D      <C-S-Left>
map             <Esc>O1;6C      <C-S-Right>
map!            <Esc>O1;6A      <C-S-Up>
map!            <Esc>O1;6B      <C-S-Down>
map!            <Esc>O1;6D      <C-S-Left>
map!            <Esc>O1;6C      <C-S-Right>

" gnome-terminal keys in Gutsy
map             <Esc>O1;2P      <S-F1>
map             <Esc>O1;2Q      <S-F2>
map             <Esc>O1;2R      <S-F3>
map             <Esc>O1;2S      <S-F4>
map             <Esc>[15;2~     <S-F5>
map             <Esc>[17;2~     <S-F6>
map             <Esc>[18;2~     <S-F7>
map             <Esc>[19;2~     <S-F8>
map             <Esc>[20;2~     <S-F9>
" <S-F10> is not available
map             <Esc>[23;2~     <S-F11>
map             <Esc>[24;2~     <S-F12>
map!            <Esc>O1;2P      <S-F1>
map!            <Esc>O1;2Q      <S-F2>
map!            <Esc>O1;2R      <S-F3>
map!            <Esc>O1;2S      <S-F4>
map!            <Esc>[15;2~     <S-F5>
map!            <Esc>[17;2~     <S-F6>
map!            <Esc>[18;2~     <S-F7>
map!            <Esc>[19;2~     <S-F8>
map!            <Esc>[20;2~     <S-F9>
" <S-F10> is not available
map!            <Esc>[23;2~     <S-F11>
map!            <Esc>[24;2~     <S-F12>

" <C-F1> is not available
map             <Esc>O1;5Q      <C-F2>
map             <Esc>O1;5R      <C-F3>
map             <Esc>O1;5S      <C-F4>
map             <Esc>[15;5~     <C-F5>
map             <Esc>[17;5~     <C-F6>
map             <Esc>[18;5~     <C-F7>
map             <Esc>[19;5~     <C-F8>
map             <Esc>[20;5~     <C-F9>
map             <Esc>[21;5~     <C-F10>
map             <Esc>[23;5~     <C-F11>
map             <Esc>[24;5~     <C-F12>
" <C-F1> is not available
map!            <Esc>O1;5Q      <C-F2>
map!            <Esc>O1;5R      <C-F3>
map!            <Esc>O1;5S      <C-F4>
map!            <Esc>[15;5~     <C-F5>
map!            <Esc>[17;5~     <C-F6>
map!            <Esc>[18;5~     <C-F7>
map!            <Esc>[19;5~     <C-F8>
map!            <Esc>[20;5~     <C-F9>
map!            <Esc>[21;5~     <C-F10>
map!            <Esc>[23;5~     <C-F11>
map!            <Esc>[24;5~     <C-F12>

" gnome-terminal keys in Hardy when ssh'ed into Dapper
" also, gnome-terminal keys in Intrepid
map             <Esc>[1;5A      <C-Up>
map             <Esc>[1;5B      <C-Down>
map             <Esc>[1;5D      <C-Left>
map             <Esc>[1;5C      <C-Right>
map!            <Esc>[1;5A      <C-Up>
map!            <Esc>[1;5B      <C-Down>
map!            <Esc>[1;5D      <C-Left>
map!            <Esc>[1;5C      <C-Right>
map             <Esc>[1;6A      <C-S-Up>
map             <Esc>[1;6B      <C-S-Down>
map             <Esc>[1;6D      <C-S-Left>
map             <Esc>[1;6C      <C-S-Right>
map!            <Esc>[1;6A      <C-S-Up>
map!            <Esc>[1;6B      <C-S-Down>
map!            <Esc>[1;6D      <C-S-Left>
map!            <Esc>[1;6C      <C-S-Right>

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
call vam#ActivateAddons(['vim-indent-object']) " lets you use cai and cii
call vam#ActivateAddons(['visualrepeat']) " repeat last command for all lines
" in visual selection
call vam#ActivateAddons(['simple_bookmarks']) " :Bookmark, :GotoBookmark, etc
call vam#ActivateAddons(['MatchTag']) " Highlights matching html tag
call vam#ActivateAddons(['fugitive']) " apparently needed for gitv
call vam#ActivateAddons(['gitv']) " like gitk, but in vim. Really cool. Does
" this exist for mercurial?
call vam#ActivateAddons(['todotxt']) " syntax file for [todo|TODO][.txt|]
call vam#ActivateAddons(['rainbow_parentheses']) " :RainbowParenthesesToggle
call vam#ActivateAddons(['bad-whitespace']) " highlight bad whitespace
call vam#ActivateAddons(['quickfixstatus']) " :QuickfixStatusEnable and Disable
call vam#ActivateAddons(['git:git://github.com/fs111/pydoc.vim.git'])
" K support for python and other goodies

" the surround plugin. We also make it use c and C for any surround-related
" stuff; and we make vim's s into what normally is done with c in vanilla Vim.
" Rationale:
" 1. c can do everything s can: with the new mapping press ss for what used to
" be done with S; press sl for what used to be done with s; press S for what
" used to be done with C. The only way in which I used s (on its own) in
" normal mode used to be if I went forward to a word which I wanted on a new
" line, and then I would on the first letter of that word; so I had to do
" hs<Enter> to put it on a new line.. now I have to do sh<Enter>. Almost no
" difference :)
" 2. s is easier to access (home row)
" 3. I use the action more often than I use anything related to surround, so
" it's a great idea to have that at the home row
let g:surround_no_mappings=1
call vam#ActivateAddons(['git:git://github.com/tpope/vim-surround.git'])
" surround.vim for things like sc"' etc. FIXME: consider whether you really
" need this plugin.
noremap s c
nnoremap ss cc
onoremap ss cc
" ss makes no sense in visual mode, and makes visual-s wait for 1 second
" before proceeding with the action.
nmap dc  <Plug>Dsurround
nmap sc  <Plug>Csurround
nmap yc  <Plug>Ysurround
nmap yC  <Plug>YSurround
nmap ycc <Plug>Yssurround
nmap yCc <Plug>YSsurround
nmap yCC <Plug>YSsurround
xmap C   <Plug>VSurround
xmap gC  <Plug>VgSurround


call vam#ActivateAddons(['Conque_Shell']) " :ConqueTerm
call vam#ActivateAddons(['Source_Explorer_srcexpl.vim']) " :SrcExplToggle
call vam#ActivateAddons(['YankRing']) " you can do \"2p (without the backslash)
" to paste the 2nd to last content of the " buffer, 3 for 3rd, up to 9. Note
" that there is some bug which I hadn't yet looked into which means yy does
" not add stuff to the yank ring, whereas dd does.
call vam#ActivateAddons(['git:git://github.com/tpope/vim-repeat.git'])
" allows you to use . to repeat plugin commands which don't work otherwise.
" E.g. for surround.vim and speed dating.
call vam#ActivateAddons(['git:git://github.com/tpope/vim-markdown.git'])
" markdown filetype script.
call vam#ActivateAddons(['git:git://github.com/tpope/vim-speeddating.git'])
" use C-a/C-x to increment and decrement dates. Smart about leap years etc.
call vam#ActivateAddons(['git:git://github.com/tpope/vim-pastie.git'])
" vim interface for pastie.org; use :Pastie to paste all files or a range,
" :%Pastie to paste the current file. Ranges are allowed
call vam#ActivateAddons(['paster']) " configurable pastebin client
call vam#ActivateAddons(['Dpaste.com_Plugin']) " Dpaste.com client
call vam#ActivateAddons(['lodgeit']) " :Lodgeit (paste.pocoo.org)
call vam#ActivateAddons(['Gist']) " :Gist

"call vam#ActivateAddons(['hg:https://bitbucket.org/sjl/gundo.vim'])
" :Gundo - displays undo tree. Unfortunately, Gundo requires Vim 7.3.
"call vam#ActivateAddons(['git:git://github.com/chrisbra/histwin.vim.git'])
" :histwin - displays undo tree. Requires Vim 7.3 just like Gundo.

python << EOF
""" This will install pyflakes. It uses a special fork which is from the
    author of pyflakes.vim and according to him is better because it retains
    line number info.
    """
try:
  import pyflakes
except ImportError:
  import os
  # you can't use from distutils.dist import Distribution !!!!! For no
  # apparent reason!!
  from setuptools.command.easy_install import easy_install
  class easy_install_stfu(easy_install):
    """ class easy_install wouldn't shut the fuck up about the fist parameter
        not being an instance of Distribution, even though it painfully was.
        Fuck you, easy_install.
        """

    def __init__(self):
      from distutils.dist import Distribution
      dist = Distribution()
      if not isinstance(dist, Distribution):
        self.fuck() # You'd really need to want it to do it
      self.distribution = dist
      self.initialize_options()
      self._dry_run = None
      self.verbose = dist.verbose
      self.force = None
      self.help = 0
      self.finalized = 0

    def fuck(self):
      """ class easy_install goes to fuck itself.
          """
      pass

  e = easy_install_stfu()
  import distutils.errors
  try:
    e.finalize_options()
  except distutils.errors.DistutilsError:
    pass
  src_dir = os.path.realpath(os.path.join(e.install_dir, "src"))
  git_url = "git://github.com/kevinw/pyflakes.git"

  try:
    import pip
  except ImportError:
    print "Making sure pip is installed..."
    os.system("sudo easy_install pip")
  msg = "About to pip install the python pyflakes module from " + git_url
  msg += " to " + src_dir + ".\n"
  print msg

  pip = "sudo pip install "
  pip += "-e git+" + git_url + "#egg=pyflakes "
  pip += '--src="' + src_dir + '" '
  pip += '--install-option="--script-dir=/usr/local/bin" '
  os.system(pip)

EOF

let g:pyflakes_use_quickfix = 0
command PyflakesQuickfixOn  let g:pyflakes_use_quickfix = 1
command PyflakesQuickfixOff let g:pyflakes_use_quickfix = 0
call vam#ActivateAddons(['git:git://github.com/cheater/pyflakes-vim.git'])
" automatically puts pyflakes errors in the quickfix list, and updates them as
" you edit.

call vam#ActivateAddons(['matrix%1189']) " :Matrix for cool 'screensaver'
"call vam#ActivateAddons(['AutoClose%1849']) " auto-closes brackets, parens, etc
call vam#ActivateAddons(['delimitMate']) " first impression: delimitMate is
" better than AutoClose%1849.
" FIXME: if you are on top of a ) and type ) then delimitMate doesn't type it,
" it just moves right of it, even if that ) was not auto-completed by
" delimitMate (meaning, it was there before).
call vam#ActivateAddons(['sokoban']) " sokoban. Note that the installation
" with vam does not work currently, and you might need to go to
" .vim/vim-addons/sokoban, create a subdir called plugin, and move the .vim and
" .sok files in there. FIXME
let g:pythonhelper_updatetime = 20
call vam#ActivateAddons(['git:git://github.com/cheater/pythonhelper.git'])
"call vam#ActivateAddons(['pythonhelper'])
" displays the class and function name the cursor is currently on.
" FIXME: breaks on multiline comments that reduce indent level.

" the following two status lines that are commented out were ripped off someone
" else... :)
" set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]
" set statusline=%<%f%y\ \ %h%m%r%=%-14.(%l/%L,%c%V%)\ %P
" set statusline=%-f%r\ %2*%m%*\ \ \ \ %1*%{TagInStatusLine()}%*%=[%l:%c]\ \ \ \
" [buf\ %n]
"

function TagInStatusLine2()
  let s:tag = TagInStatusLineTag()
  if s:tag == ""
    return ""
  endif
  let s:tag2 = "[" . s:tag . "]"
  return s:tag2
  endfunction
set statusline=\ %n\ %f\ %<[%M%Y%R]%h%w\ %<%{TagInStatusLine2()}%=\ [L%l\ C%v\ %p%%]

call vam#ActivateAddons(['renamer']) " rename files editing their names in vim,
" use :Renamer and then :Ren

call vam#ActivateAddons(['AutoTag']) " update ctags on file save
call vam#ActivateAddons(['SourceCodeObedience'])
" create tags and cscope.out in your project root, and in the dir where they
" are, create a foo.sco file. Edit it, then do :SCO* to query the project by
" using info from tags, cscope, and so on.
" FIXME: the display is being messed up by 'long line showing'

let g:chapa_default_mappings = 1
let g:chapa_no_repeat_mappings = 1
call vam#ActivateAddons(['chapa']) " fnc, fpc to go to next/prev class, also
" works for functions. Works for Python and JavaScript. FIXME: does not think
" that old-style classes (that do not extend anything) are classes.
call vam#ActivateAddons(['opsplorer']) " :Opsplore
call vam#ActivateAddons(['browser%2227']) " :Google, :Wikipedia, :WebBrowser
call vam#ActivateAddons(['camelcasemotion']) " now you can do ci,w and ci,b
" for CamelCase and snake_case names.
call vam#ActivateAddons(['CmdlineComplete']) " press ^N/^P in command line or
" search mode. Doesn't work well in search but works well in command mode. FIXME
call vam#ActivateAddons(['Cabal']) " Haskell .cabal file syntax definition
autocmd BufRead,BufNewFile *.cabal
\   setlocal filetype=cabal
call vam#ActivateAddons(['git:git://github.com/bogado/file-line.git'])
" allows you to open file:line like from compiler or grep output
" FIXME: messes up -p, -o, and -O.
call vam#ActivateAddons(['git:git://github.com/ciaranm/detectindent.git'])
let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 4
" :DetectIndent
call vam#ActivateAddons(['Smartput']) " makes p work better inside
" (lists, of, things) and 'lists of words' by auto-adjusting where the space
" or the comma joining the words is placed.
call vam#ActivateAddons(['keepcase'])
" Usage:
"
" %s/\u\<old_word\>/\=KeepCaseSameLen(submatch(0), 'new_word')/g
"
" * KeepCase(original_word, new_word)
"   Returns the new_word maintaining the case of original_word. Uses simple
"   heuristics to work out some different common situations.
"     input       output
"     Word    ->  Newword
"     WORD    ->  NEWWORD
"     word    ->  newword
"     WoRd    ->  NewWord
"     woRd    ->  newWord
"
" * KeepCaseSameLen(original_word , new_word)
"   Returns the new word maintaining case. Keeps the case exactly the same
"   letter-for-letter. It does work if the words aren't the same length, as it
"   truncates or just copies the case of the word for the length of the
"   original word.
"
" * :SubstituteCase#\cfoo\(Bar\)bar#\1Baz#g
"     fooBarBar -> barBaz
"     FooBarBar -> BarBaz
"     foobarbar -> barbaz
"     foobarBar -> barBaz
"     FoobarBar -> BarBaz
" FIXME: put the above in a doc or help file somewhere.
call vam#ActivateAddons(['Shortcut_functions_for_KeepCase_script_'])
" Usage:
" :'<,'>call S('building','campus') will replace all occurrences of 'building'
" with 'campus', 'BUILDING_ID' with 'CAMPUS_ID', 'getBuilding' with
" 'getCampus', etc. across the currently selected range.
"
" Also included is the SS(pat,sub) function which uses KeepCaseSameLen for the
" substitutions instead of KeepCase.

call vam#ActivateAddons(['lid']) " :Lid, :Lid searchstring. :Lid -p or -v for
" pattern based filtering/rejection of lid output. You need to install lid for
" this to work: aptitude install id-utils; then you need to invoke mkid at the
" project root. Great for searching, great interface, but doesn't work for
" Python or Haskell. Currently supports C, C++, Java, Makefiles, and other
" stuff directly. You can add indirect support for Python/Haskell/Bash by
" editing /usr/share/misc/id-lang.map and adding lines for *.py, *.hs and *.sh
" using the 'text' format. Maybe one day those will get direct support. This
" tool is kind of like grep/ctags/gtatgs/etags/cscope.
" FIXME: try to extract the cool quickfix stuff from ack.vim and try to put it
" in this plugin.

call vam#ActivateAddons(['git:git://github.com/mileszs/ack.vim.git'])
" You can use :Ack, :AckAdd for quickfix, :LAck, :LAckAdd for location-list,
" use mappings like o, go, t, T, v, V to open the file in different ways.
" See :help *ack-mappings* for more mappings. The quickfix support (:AckAdd
" and the mappings) is better than lid.

call vam#ActivateAddons(['gtags'])
" alternatively you can use this to get popups instead of the location list:
" call vam#ActivateAddons(['gtags_multiwindow_browsing'])
" however, only one version of the gtags plugin should be used at a time,
" since they use the same command names.
"
" The author of gtags_multiwindow_browsing makes some bindings that can't be
" turned off. Bad!
"
" FIXME: Contacted the author on 2012-05-21 via email. If he doesn't make a
" new version within a week I'll fork his code and ask that repo to be added
" to VAM.
"
" You can use things like :Gtags tagname, :Gtags -r tagname (for reverse
" lookup), :GtagsCursor, and so on. See
" http://www.gnu.org/software/global/globaldoc.html#SEC5 for more info.
" Note that for Ubuntu 10.04 LTS you need to use the CVS version of GLOBAL,
" the packaged version is very old and crashy.
