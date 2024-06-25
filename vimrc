" If you like this vimrc, star my repo on GitHub!
"           <https://github.com/cheater/vimrc/>
"
"
"  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
"  .                                                                         .
"  .                                                                         .
"  .                                 ,ji,                                    .
"  .          ,@HHHHHHHHHHHHHHHHHHH "!:!!Y*,  ,HHHHHHHHHHHHHHHHHHHt          .
"  .          'QYY?00000000000VYYYT ;!!!!!!<= <2YYV00000000000002Yr          .
"  .              #000000000001I ,..!!!!!!!!!=  vd80000000000PY=^            .
"  .              #00U000U000U1I ;!!!!!!!:!' vdH800000000U0YI^               .
"  .              #000000000001I ;!!!!!!'`vd9t00%0000000Y*^`                 .
"  .              #000000000001I ;!!!'`vd9S%%00000000V1^`.                   .
"  .              #0000U00U00U1I :'`,dPH%0000000002Yr^,.!=T),                .
"  .          .;` #000000000001I ,aPHJ0000000000Y/^ .=!!!!+!TT*,             .
"  .       .,VY:` #000U000000014MHJ%00000^"''''^ .=!!!!!!!!!:!!<Ts,          .
"  .       '=!:!` #000000000U0mG00000000"' hnv  +!!!!!!!:!!!!!!=:``          .
"  .          `=' #0000000U000000000000V" d%%" ;!!!!!!:!!!!!:=``             .
"  .            ` #000U0000000000000VY`'       ''``'"""'``''`                .
"  .              #000000000000U00Yr^ ' U002 . "U00N>=vJ0UNn>=JU00\          .
"  .              #0000000U000U?*^ .<` JU02 .' J00^.-- J00~   .U00'          .
"  .              #0000U0000%*^`-=!!` JU02 .  J00F-`  J00(    d%02           .
"  .              #0000002Y'` -^!!!" J002    J002    JU02    J002            .
"  .              YPYYYY='     `'===......<=                                 .
"  .                              `==!!+!=``                                 .
"  .                                 `-'`         Config File                .
"  .                                                    by cheater           .
"  .                                                                         .
"  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
"
" Main changes to how normal Vim operates:
" - you enter command mode with ; instead of :
" - repeat-quick-move is : instead of ;
" - <F3> and <F4> scroll through tabs, <S-F3> and <S-F4> move them
" - see :Commands for a list of all commands


" -- Various basic settings

scriptencoding utf-8

unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim
let skip_defaults_vim=1

set secure " no hacking allowed!!

setlocal nocompatible

" Directory which vimrc resides in, no trailing slash. Not safe for symlinks.
let s:vimrcdir = expand('<sfile>:p:h')

" Load plugins from plugged/. Can't put it in plugin/ because when files in
" there get sourced, rtp is already set, and we need vim-plug to set the rtp
" up before everything in the rtp is being sourced.
exec 'source ' . s:vimrcdir . '/vim-plug.vim'


" -- Mappings and digraphs


" -- Mappings: Basic

setlocal mouse=""

" Swap ";" and ":".  Convenient.
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
nnoremap q; q:
vnoremap q; q:
let g:cmdleader = ';' " for use in various mappings later


" -- Mappings: Search

" nnoremap <silent> <C-L> :nohls<CR><C-L> " press Ctrl-l for :nohlsearch
" TODO: broken - moves cursor one place to the right. Doesn't do it with
" vim -u NONE.

" Search mappings: These will make it so that going to the next result in a
" search will center on the line it's found in.
nmap n <Plug>(anzu-n-with-echo)zz
nmap N <Plug>(anzu-N-with-echo)zz
nmap * <Plug>(anzu-star-with-echo)zz
nmap # <Plug>(anzu-sharp-with-echo)zz

" */# search in visual mode (from www.vim.org)
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

setlocal cpoptions-=c " repeated search from cursor not from end of match


" -- Mappings: Tabs

set tabpagemax=25 " Max number of tabs to open with -p or :tab all

" Remove the <F1> help binding. I use <F1> and <F2> in my terminal emulator to
" cycle tabs.
nmap <F1> <nop>
vmap <F1> <nop>
imap <F1> <nop>

" FIXME: change all of those mappings below to <expr> to use g:cmdleader

" Cycle tabs in Vim
nmap <F3> ;tabprevious<CR>
vmap <F3> ;tabprevious<CR>
imap <F3> <C-o>;tabprevious<CR>
nmap <F4> ;tabnext<CR>
vmap <F4> ;tabnext<CR>
imap <F4> <C-o>;tabnext<CR>

" Move tabs in Vim. See plugin/movetab.vim
nmap <silent> <S-F3> ;MoveTabLeft<CR>
vmap <silent> <S-F3> ;MoveTabLeft<CR>
imap <silent> <S-F3> <C-o>;MoveTabLeft<CR>
nmap <silent> <S-F4> ;MoveTabRight<CR>
vmap <silent> <S-F4> ;MoveTabRight<CR>
imap <silent> <S-F4> <C-o>;MoveTabRight<CR>

" Go to tab containing a buffer, fuzzy search. see plugin/gobuf.vim
nmap     <expr> <Leader>t       g:cmdleader . 'Go<Space>'


" -- Mappings: Scrolling

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


" -- Digraphs

if has("digraphs")          " digraphs are entered as the html entity number
  digraph -- 8212           " em dash
  digraph `` 8220           " left double quotation mark
  digraph '' 8221           " right double quotation mark
  digraph ,, 8222           " double low-9 quotation mark
  digraph ** 8258           " asterism
  endif


" -- Various settings

" Always disable paste mode when leaving insert mode
autocmd InsertLeave * setlocal nopaste

setlocal
\    expandtab
\    tabstop=8
\    shiftwidth=4
\    ruler

syntax enable
setlocal background=dark   " dark theme

" Note: you can't use prepend-\ line continuations after "comments, or
" the continuation will also be seen as a comment!

filetype plugin on         " load ftplugin.vim
setlocal history=1000      " number of commands and search patterns to save
setlocal showcmd           " show the command in the lower right corner
setlocal wildmode=full     " default
setlocal wildmenu          " displays a menu of the completions you go through
setlocal binary            " show control characters (ignore 'fileformat')
" setlocal timeoutlen=100    " let me enter edit mode right after exiting it
"                            " FIXME: stop using esc to exit modes altogether?
set      nomodeline
set      modelines=0       " no remote code execution, thank you
setlocal shiftround        " round alignment to nearest indent when shifting
                           " with < and >
setlocal formatoptions+=r  " continue comment on next line
setlocal formatoptions+=2  " continue indent from second line of paragraph,
                           " not first
setlocal formatoptions+=j  " delete comment character when joining comments
setlocal nojoinspaces      " no double space after . when joining lines with J
setlocal incsearch         " incremental search
setlocal ignorecase        " ignore case when searching (see smartcase)
setlocal smartcase         " do not ignore case if pattern has mixed case
                           " (see ignorecase)
setlocal showmatch         " show matching brackets by flickering cursor
setlocal matchtime=1       " show matching brackets quicker than default
setlocal hidden            " so that you don't save when doing g] in ctags, and
                           " as a side effect: undo list is not lost on C-^
setlocal noautowrite       " don't save buffers when abandoning (going out of)
                           " them, e.g. with g]
setlocal switchbuf=useopen " quickfix reuses open windows when switching buffer
setlocal scrolloff=0       " allow the cursor to go to the edge of the window
setlocal titleold=""       " disable the 'Thanks for flying VIM' message stuck
                           " in the terminal title after exiting vim.
setlocal browsedir=buffer  " :browse e starts in %:h (file's dir), not $PWD
setlocal splitright        " new window in a visual split is on the right
setlocal backspace=indent,eol,start  " sane backspacing
setlocal wrap              " wrap long lines
" setlocal clipboard=        " I hate when visual selections are underlined
                           " instead of a solid background

" setlocal t_Co=16           " In case you need less colors
setlocal t_Co=256          " Much more beautiful than the standard of using
" just 8 colors! You can do:
"
" :so $VIMRUNTIME/syntax/hitest.vim
" ^ in order to see all the highlight groups that you you can access. You can
" just use :HighlightTest with this vimrc.
" Additionally, you can do :ColorTest to just see all the supported colors.
"
" Then, you can also do things such as:
" :mat DiffAdd /[^=<>]=[^=]/
" ^ to show all assignments
"
" :2mat SpellLocal /\<some_word\>/
" ^ to search for some_word
"
" :call matchadd("DiffText", "\\<word\\>")
" ^ to match another word, if you need more highlight groups. you can do
" matchadd() over and over for infinite groups! then do
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
setlocal termguicolors " use 24-bit colors.
" Test if you have 24-bit color support with extra/true-color-test.sh

setlocal laststatus=2      " always show status.
set title             " show the title!
set titlestring=%<%f\ [%M%Y%R]\ -\ VIM
if has("extra_search")
  setlocal hlsearch        " highlight search matches
  nohlsearch               " but not initially
  endif
setlocal suffixes+=
        \.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,
        \.idx,.ilg,.inx,.out,.toc,.pyc,.pyo,.hi,
        \.jpg,.bmp,.gif,.png,.tif,.tiff,
        \.wmv,.avi,.mpg,.mpeg,.asf,.flv,.mov,
        \.wav,.aif,.aiff,.mp3,.flac,.mp4
" ^the suffixes are what files Vim should normally ignore when autocompleting
" file names, for :e :w and so on

setlocal tags=./tags;,./TAGS;,./codex.tags;,tags;,TAGS;,codex.tags;
" Find tags either in the directory the file is in, or in the pwd that vim was
" started from.

set showfulltag " display the full tag in the completion menu.

" tagbar#currenttag() comes from the tagbar plugin
set statusline=\ %n\ %f\ %<[%M%Y%R]%h%w\ %<%{tagbar#currenttag('[%s]\ ','')}%=\ [L%l\ C%v\ %p%%%{AnzuStatusLine()}]

" creates a brighter-colored column at 80 characters in, and all text going
" over that gets a red background.
if !exists('g:pager_mode')
  if exists('+colorcolumn')
    set colorcolumn=80
    highlight ColorColumn ctermbg=black guibg=black
  else
    autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>79v.\+', -1)
    endif
  endif

if has("linebreak")
  let &l:showbreak=nr2char(8618) . ' ' " right hook arrow for wrapped chars
  " see :help :let-&
  endif
setlocal list                   " show chars using listchars.
setlocal listchars=             " but don't use the default of showing
                                " newlines with $.
" FIXME: build listchars with += instead setting it just like that. I do this
" because listchars seems to be cast to a string somehow, so you can't use +=
" anymore. Figure out how to keep it in the correct data type instead of
" making it a string.
let &l:listchars='tab:'.nr2char(9656).' ,nbsp:'.nr2char(183)
" ^ Don't use the default of showing newlines with $; make tabs show up;
" middle dot for non-breaking spaces.
" setlocal listchars+=eol:¬ " XXX: you can't use this directly because it'll
" mess up; you need to find the number of the character with the ga command
" and then use nr2char(). see :help :let-&

" Highlight long lines
" old version
"command LongLinesShow let w:m1=matchadd('Search', '\%<81v.\%>77v', -1) | let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
"command LongLinesHide call matchdelete(w:m1) | call matchdelete(w:m2)
" new and improved
command! LongLinesShow if !exists('w:ll_exists') | let w:ll_exists=0 | endif | if w:ll_exists==0 | let w:ll_match=matchadd('ErrorMsg', '\%>79v.\+', -1) | let w:ll_exists=1 | endif
command! LongLinesHide call matchdelete(w:ll_match) | let w:ll_exists=0


" -- Settings related to files that belong to vim and commands for complex
"    file related operations

" Backup files
setlocal backup                       " make backups
let &backupdir=s:vimrcdir . '/backup' " but don't clutter $PWD
if !isdirectory(&backupdir)
  " create the backup directory if it doesn't already exist
  exec "silent !mkdir -p " . &backupdir
  endif

setlocal updatetime=100    " write .swp file after 100 ms of no activity

setlocal undolevels=1000   " maximum number of changes that can be undone
" Persistent undo
if exists('+undodir')      " set undodir stuff, which saves the undo history
                           " in an external file, across saves. New in Vim 7.3
  let &undodir=s:vimrcdir . "/undodir" " but don't clutter $PWD
  if !isdirectory(&undodir)
    " create the undo directory if it doesn't already exist
    call mkdir(&undodir, "p")
    endif
  setlocal undofile
  setlocal undoreload=10000 " max lines to save for undo on buffer reload
  endif

" When recovering, diff opened file against its recovered swap (.swp) file.
" This assumes that, when prompted about the existance of a .swp file, you
" told vim to recover it.
command! DiffSwpAgainstFileOnDisk call DiffSwpAgainstFileOnDisk()
function! DiffSwpAgainstFileOnDisk()
  :w! /tmp/recovered_swp
  exec "!diff /tmp/recovered_swp \"%\""
  endfunction

" If you haven't saved yet, you can diff against the original file.
" Code taken from `:help :DiffOrig`.
if exists(":DiffOrig") != 2
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_
        \ | diffthis | wincmd p | diffthis
endif


" use :w!! to write to a file using sudo if you forgot to "sudo vim file"
command! SudoWrite %!sudo tee > /dev/null %


" -- Color test

" Show the Syntax Highlight Groups
command! HighlightTest source $VIMRUNTIME/syntax/hitest.vim

" Show all the colors that Vim supports!
command! ColorTest source $VIMRUNTIME/syntax/colortest.vim
