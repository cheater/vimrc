" Load plugins using vim-plug (autoload/plug.vim)

" Note: you need to do :PlugInstall to load the plugins specified in
" vim-plug.vim, it does not install them on its own. This will result in a
" bunch of errors showing up before you install the plugins on a fresh system.


" Utility function
function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
  endfunction


call plug#begin()
Plug 'junegunn/vim-plug' " to get help tags for vim-plug


" -- Special

let g:RenamerShowHidden = 1 " show hidden files
Plug 'qpkorr/vim-renamer' " rename files in directory editing their names in
" Vim, use :Renamer to start and then apply changes with :Ren
let g:LargeFile = 100 " files above 100 MB are large and should be handled.
Plug 'vim-scripts/LargeFile'
" make opening large files easier (turn off features)


" -- Display

Plug 'ryanoasis/vim-devicons' " Makes pretty glyph icons available to other
" plugins if you have a NERD font installed
Plug 'mhinz/vim-startify' " Better startup view with quick accessors

Plug 'junegunn/limelight.vim' " :Limelight to dim everything but the current
" paragraph. also works for a visual range.
Plug 'chrisbra/NrrwRgn' " Narrow Region:
" Select the region, call :NR or do <Leader>nr and the selected part will open
" in a new split window while the rest of the buffer will be protected. Once
" you are finished, write the narrowed window (:w) and all the changes will be
" moved back to the original buffer.

Plug 'osyo-manga/vim-anzu' "現在の検索位置を画面に表示するためのプラグインです。
function! AnzuStatusLine()
  let s:anzu = anzu#search_status()
  if s:anzu == ""
    return ""
    endif
  let s:tag = " " . s:anzu
  return s:tag
  endfunction

Plug 'preservim/vim-indent-guides' " :IndentGuidesToggle for alternating
" color columns in indent
Plug 'luochen1990/rainbow' " rainbow parentheses with :RainbowToggle
let g:rainbow_active = 0
" Plug 'frazrepo/vim-rainbow' " rainbow parentheses with :RainbowToggle. This
" one is supposed to be an improved version of the luochen one, but it's been
" last updated 6 years ago, and the luochen one 2 years ago.
" highlight bad whitespace at end of lines, but only if Vim is not being used
" as a less-like pager
" Plug 'bitc/vim-bad-whitespace', Cond(!exists('g:pager_mode'))
" turned off because it interferes with :Matrix which is honestly more important

let g:peekaboo_window = 'vert bo 50new'
" Plug 'junegunn/vim-peekaboo' " Peekaboo will show you the contents of the
" registers on the sidebar when you hit " or @ in normal mode or <CTRL-R> in
" insert mode. The sidebar is automatically closed on subsequent key strokes.

let g:no_cecutil_maps = 1
Plug 'powerman/vim-plugin-AnsiEsc'
" :AnsiEsc to interpret ANSI color escape sequences, eg colored output

" Color schemes

let g:solarized_termcolors = 256
let g:solarized_termtrans  = 0        " set to 1 if you have a transparent terminal
let g:solarized_bold       = 0        " no bold,
let g:solarized_underline  = 0        " underline,
let g:solarized_italic     = 0        " or goddamned italic
let g:solarized_contrast   = "low"    " high/normal/low
let g:solarized_visibility = "normal" " high/normal/low - visibility of listchars
Plug 'altercation/vim-colors-solarized'    " Solarized for Vim
let g:zenburn_high_Contrast=1
let g:zenburn_alternate_Visual=0 " higher contrast visual mode
let g:zenburn_alternate_Error=0
let g:zenburn_alternate_Include=0
let g:zenburn_force_dark_Background=0 " bug workaround where you get a light
let g:zenburn_subdued_LineNr=0
" background instead of a dark one
Plug 'jnurmine/Zenburn'                    " Zenburn for Vim
Plug 'gruvbox-community/gruvbox'           " Gruvbox
Plug 'romainl/Apprentice'                  " Appprentice
let base16colorspace=256 " Access colors present in 256 colorspace
Plug 'chriskempson/base16'                 " Base16 for Vim
Plug 'dracula/vim', { 'as': 'dracula' }    " Dracula
Plug 'whatyouhide/vim-gotham'              " Gotham. use gotham256
Plug 'mhinz/vim-janah'                     " Janah
Plug 'jonathanfilip/vim-lucius'            " Lucius
Plug 'tomasr/molokai'                      " Molokai
Plug 'nordtheme/vim', { 'as': 'nord' }     " Nord
Plug 'mhartington/oceanic-next'            " Oceanic
Plug 'joshdick/onedark.vim'                " Onedark
Plug 'owickstrom/vim-colors-paramount'     " Paramount
Plug 'jpo/vim-railscasts-theme'            " Railscasts
" let g:seoul256_background = 236
" 233 (darkest) - 239 (lightest); default is 237
Plug 'junegunn/seoul256.vim'               " Seoul265 for Vim

" Note. If you want to modify the colors of one of those color schemes, do
" something like
" autocmd ColorScheme colorschemename highlight Normal ctermbg=235
" instead just running highlight at the top level.
" This is so that these modifications stick after you change color schemes
" or after some addons do color scheme manipulation.


" -- Move around

Plug 'andymass/vim-matchup' " lets % match a lot more stuff, supports Haskell

Plug 'AndrewRadev/simple_bookmarks.vim' " :Bookmark, :GotoBookmark, etc

Plug 'tpope/vim-rsi' " Readline keybindings in the command line and insert
" mode. C-d, C-e, and C-f are mapped such that they perform the Readline
" behavior in the middle of the line and the Vim behavior at the end. (Think
" about it.)
" <C-x><C-a>              Access Vim's built-in |i_CTRL-A| or |c_CTRL-A|.

" Plug 'haya14busa/is.vim' " In the search command line, before you press <CR>,
" you can press C-j/k to move between matches.
" does :noh for you automatically.
" currently turned off
" TODO: extract the C-j/k functionality alone

Plug 'kana/vim-smartword' " better word movements.
if exists("smartword#move")
  map w <Plug>(smartword-w)
  map b <Plug>(smartword-b)
  map e <Plug>(smartword-e)
  map ge <Plug>(smartword-ge)
  endif


" -- Do stuff

" Text Objects

" Plug 'michaeljsmith/vim-indent-object' " new text object based on indent
" lets you use cai and cii and in general <action>ai/ii/aI for actions such as
" c, d, ~, etc.
" decided to use 'kana/vim-textobj-indent' instead
Plug 'wellle/targets.vim' " a bunch of new text objects!
" See
" https://github.com/wellle/targets.vim?tab=readme-ov-file
" and
" https://github.com/wellle/targets.vim/blob/master/cheatsheet.md
Plug 'tpope/vim-jdaddy' " ij / aj for JSON. gqaj pretty-prints a JSON thing.
Plug 'kana/vim-textobj-user' " you can define your own text objects!
" See https://github.com/kana/vim-textobj-user/wiki for examples
Plug 'kana/vim-textobj-indent' " indent based text object
" ai - lines at least as indented as this one, includes empty lines
" ii - lines at least as indented as this one, stops at empty lines
" aI, iI - as above, but don't include lines more indented than this one
" requires vim-textobj-user
Plug 'kana/vim-textobj-lastpat' " i/ a/ (searches for last search pattern)
" uses vim-textobj-user.
" Plug 'lucapette/vim-textobj-underscore' " i_ / a_ for a segment_in_this.
" uses vim-textobj-user. superceded by vim-textobj-variable-segment.
Plug 'Julian/vim-textobj-variable-segment' " iv / av for a segment_in_this
" or segmentInThis. uses vim-textobj-user.
Plug 'idbrii/textobj-word-column.vim' " ic / ac / iC / aC for changing a
" column of repeating words that are exactly aligned. based off of
" iw / aw / iW / aW, just repeating on multiple lines. uses vim-textobj-user.
" Plug 'gilligan/vim-textobj-haskell', { 'do': 'sed -e \"s/python import vim/python3 import vim/\" -e \"s/pyfile /py3file /\" -i \"\" plugin/textobj/haskell.vim' } " fix python 2 import
" ih for Haskell function. uses vim-textobj-user. TODO seems broken at this time
Plug 'kana/vim-textobj-entire'
" ae - entire file, ie - excluding leading/trailing empty lines
" requires vim-textobj-user
Plug 'terryma/vim-expand-region' " _ and + to shrink/expand region after
" iw, iW, i\" (no backslash), i', i], a], ib, ab, iB, aB, il (inside line),
" ip, ie, ii, ia, iI, iA
" requires the plugins that provide those things above

" Motions

Plug 'tommcdo/vim-exchange'
" motion to exchange (swap) two text objects
" example: To exchange two words, place your cursor on the first word and type
" cxiw. Then move to the second word and type cxiw again. Note: the {motion}
" used in the first and second use of cx don't have to be the same.
"
" cx  - On the first use, define the first {motion} to exchange. On the second
"       use, define the second {motion} and perform the exchange.
" cxx - Like cx, but use the current line.
" X   - Like cx, but for Visual mode.
" cxc - Clear any {motion} pending for exchange.
Plug 'christoomey/vim-sort-motion'
" sort motion gs
" gs2j - Sort down two lines (current + 2 below)
" gsip - Sort the current paragraph
" gsii - Sort the current indentation level (requires text-obj-indent plugin)
" gsi( - Sort within parenthesis. (b, c, a) would become (a, b, c)

" Other stuff

Plug 'inkarkat/vim-ingo-library' " required by visualrepeat
Plug 'tpope/vim-repeat'
" allows you to use . to repeat plugin commands which don't work otherwise.
" E.g. for visualrepeat, surround.vim and speed dating.
Plug 'inkarkat/vim-visualrepeat'
" . repeats last action in visual / visual block mode
Plug 'godlygeek/tabular' " :help :Tabularize to align things in columns based
" off of a regex
Plug 'matze/vim-move' " select some text and then A-hjkl to move it around
" in order to make this work, use iTerm2, go to your profile settings, and
" under keyboard, set left Option to send Meta
let g:switch_no_builtins=1 " no built-in definitions
Plug 'AndrewRadev/switch.vim' " use - to quickly apply a commonly used
" sed-style substitution. Has a special case for cycling around an enum of
" words. See the screencast here: https://www.youtube.com/watch?v=zIOOLZJb87U
" You'll need to configure things with g:switch_custom_definitions or
" b:switch_custom_definitions.


" -- Tags and IDE stuff

let lspOpts = #{autoHighlightDiags: v:true}
autocmd User LspSetup call LspOptionsSet(lspOpts)
Plug 'yegappan/lsp' " newest LSP implementation for Vim 9

Plug 'makerforceio/CoVim' " google docs style collaborative editing
" :CoVim start, :CoVim connect, :CoVim disconnect
" useful with tmate

Plug 'tpope/vim-fugitive' " git stuff
Plug 'rbong/vim-flog'
" :Flog or :Flogsplit to show a beautiful display of git branches
" Many options can be passed in, complete with <Tab> completion.
" Open commits in temporary windows once you've opened Flog using <CR>.
" Jump between commits with <C-N> and <C-P>.
" Refresh the git branch graph with u.
" Toggle viewing all branches with a.
" Quit with gq.
" See more mappings with g?.
Plug 'rhysd/git-messenger.vim'
" <Leader>gm or :GitMessenger to show the commit for this line
nnoremap <Leader>b :<C-u>call gitblame#echo()<CR>
Plug 'zivyangll/git-blame.vim'
" <Leader>b shows git blame in the command line area
let g:gitgutter_enabled = 0 " Don't enable automatically without :GitGutterToggle
Plug 'airblade/vim-gitgutter' " :GitGutterToggle to show -/+ diff marks
" :GitGutterQuickFix - load all hunks into quickfix
" Stage and unstage hunks or selections with <Leader>hs / hu

Plug 'github/copilot.vim' " use :Copilot setup to set it up

Plug 'ciaranm/detectindent'
let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 4
" :DetectIndent

Plug 'vim-test/vim-test' " :cabaltest, :TestNearest, :TestLast, :TestVisit
" Very powerful plugin, read more about it here:
" https://github.com/vim-test/vim-test?tab=readme-ov-file
" Creates quickfix locations from failing test

Plug 'dannyob/quickfixstatus' " :QuickfixStatusEnable and Disable
" When you are in the quickfix window over quickfix a location, it will show the
" related message in the command line buffer

let NERDTreeShowHidden = 1
Plug 'preservim/nerdtree' " :NERDTree - a file system explorer in a sidebar
Plug 'pschiel/opsplorer', { 'do': 'mkdir -p plugin; mv -f opsplorer.vim plugin/; mkdir -p doc; mv -f opsplorer.txt doc/' }
" :Opsplore - a file explorer in a sidebar. Lighter than NERDTree.
" FIXME: only enable fzf if fzf is in PATH.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Install latest fzf
Plug 'junegunn/fzf.vim' " :Rg C-r C-w or just :Rg for fuzzy file search / grep
" see :help fzf-vim-commands for all commands, there are many integrations
Plug 'monkoose/fzf-hoogle.vim', Cond(executable('jq') && executable('hoogle'))
" :Hoogle

Plug 'simnalamburt/vim-mundo' " :MundoToggle - displays undo tree.

" Plug 'vim-scripts/ShowMarks' " show marks set with ' left of line
" by using :DoShowMarks. Turn off with :NoShowMarks.
" TODO seems to be broken for now.

" open and close tags in :Tagbar with h/l
let g:tagbar_map_openfold = ['l', '+', '<kPlus>', 'zo']
let g:tagbar_map_closefold = ['h', '-', '<kMinus>', 'zc']
" position and behavior of :Tagbar
let g:tagbar_position = 'topleft vertical'
let g:tagbar_width = 60
let g:tagbar_autofocus = 1
" Haskell definition for :Tagbar
let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'i:instance:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type',
        \ 'i' : 'instance'
    \ },
    \ 'scope2kind' : {
        \ 'module'   : 'm',
        \ 'class'    : 'c',
        \ 'data'     : 'd',
        \ 'type'     : 't',
        \ 'instance' : 'i'
    \ }
\ }
Plug 'preservim/tagbar' " :Tagbar - displays tags in a hierarchical manner
" in a sidebar; also displays tag you're currently on in the status line.


" -- Cool

Plug 'iqxd/vim-mine-sweeping' " Minesweeper
Plug 'uguu-org/vim-matrix-screensaver' " :Matrix for cool 'screensaver'
Plug 'vim-scripts/sokoban.vim', { 'do': 'mkdir -p plugin; mv -f level*.sok plugin/' }
" Sokoban
Plug 'dansomething/vim-hackernews' " :HackerNews
" takes an optional parameter to view section:
" ask, show, shownew, jobs, best, active, newest, noobstories, <item id>,
" or <search query>
" o - open link in Vim
" O - open link in web browser
" Numbered lines with story titles on the front page link to the story url
" Comment lines on the front page link to the comments url
" F - fold current comment thread
" u - go back
" C-r - go forward
" J/K:
" next/prev item when viewing the front page
" next/prev comment when viewing comments
" next/prev paragraph when viewing the text version of articles
" :bd to close and remove the Hacker News buffer

call plug#end()


" -- Plugin related settings that can't be called before the plugin is loaded

if exists("expand_region#custom_text_objects")
  call expand_region#custom_text_objects({
        \ 'a]' :1,
        \ 'ab' :1,
        \ 'aB' :1,
        \ 'ii' :0,
        \ 'ai' :0,
        \ })
  endif
