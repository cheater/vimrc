" This is some stuff I haven't gotten around to porting to my new vim config
" yet.

" I will need to install some system packages for supporting some of the
" addons. Let me fetch them once to speed up processing.
let g:installed_system_packages="\n".system(
  \"dpkg --get-selections | awk '/install$/ && !/deinstall$/{print $1}'"
  \)
function! EnsureSystemPackage(pkg)
  " this function will install the package if it's not installed yet. Uses
  " the variable g:installed_system_packages from above.
  if -1 == stridx(g:installed_system_packages, "\n".a:pkg."\n")
    execute "!sudo aptitude install ".a:pkg
    endif
  endfunction

call vam#ActivateAddons(['sparkup']) " write fast html and css with this markup
call vam#ActivateAddons(['todotxt']) " syntax file for [todo|TODO][.txt|]
call vam#ActivateAddons(['git:git://github.com/fs111/pydoc.vim.git'])
" K support for python and other goodies
call vam#ActivateAddons(['git:git://github.com/dleonard0/pony-vim-syntax.git'])
" pony language syntax etc

" the surround plugin. We also make it use c and C for any surround-related
" stuff; and we make Vim's s into what normally is done with c in vanilla Vim.
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

call vam#ActivateAddons(['git:git://github.com/oplatek/Conque-Shell.git']) " :ConqueTerm
call vam#ActivateAddons(['Source_Explorer_SrcExpl']) " :SrcExplToggle
" FIXME: temporarily disabled YankRing. See if that helps with the corruption,
" and if it does, then remove it permanently.
" call vam#ActivateAddons(['YankRing']) \" you can do \"2p (without the
" backslash) to paste the 2nd to last content of the " buffer, 3 for 3rd, up
" to 9. Note that there is some bug which I hadn't yet looked into which means
" yy does not add stuff to the yank ring, whereas dd does.

call vam#ActivateAddons(['git:git://github.com/tpope/vim-markdown.git'])
" markdown filetype script.

call vam#ActivateAddons(['git:git://github.com/tpope/vim-speeddating.git'])
" use C-a/C-x to increment and decrement dates. Smart about leap years etc.

call vam#ActivateAddons(['git:git://github.com/tpope/vim-pastie.git'])
" Vim interface for pastie.org; use :Pastie to paste all files or a range,
" :%Pastie to paste the current file. Ranges are allowed
call vam#ActivateAddons(['paster']) " configurable pastebin client
call vam#ActivateAddons(['Dpaste.com_Plugin']) " Dpaste.com client
call vam#ActivateAddons(['lodgeit']) " :Lodgeit (paste.pocoo.org)
call vam#ActivateAddons(['Gist']) " :Gist

call EnsureSystemPackage("tidy") " install xhtml linter for Syntastic

call EnsureSystemPackage("python-setuptools") " install easy_install
python << EOF
""" This installs flake8, for use with Syntastic. """
try:
  import flake8
except ImportError:
  import os
  os.system("sudo pip install flake8")
EOF

python << EOF
""" This will install pyflakes. It uses a special fork which is from the
    author of pyflakes.vim and according to him is better because it retains
    line number info. This is for use with Syntastic and the pyflakes addon.
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

if 0 " not using pyflakes anymore. It's still here in case I change my mind.
  let g:pyflakes_use_quickfix = 0
  command PyflakesQuickfixOn  let g:pyflakes_use_quickfix = 1
  command PyflakesQuickfixOff let g:pyflakes_use_quickfix = 0
  call vam#ActivateAddons(['git:git://github.com/cheater/pyflakes-vim.git'])
  " automatically puts pyflakes errors in the quickfix list, and updates them
  " as you edit.
  endif

" TODO: check out vim-hsimport

" call EnsureSystemPackage("ghc-mod") " Install ghc-mod, a linter/checker for
" Haskell. Yes, it does pull in Emacs as a dependency. For use with Syntastic.
" actually, never mind: do cabal-install ghc-mod instead? - FIXME

let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_mode_map = {
  \'mode':'active', 'active_filetypes':[], 'passive_filetypes':[]
  \}
" call vam#ActivateAddons(['Syntastic']) " fucking thing breaks Vim. Error
" messages in the linters show up every time you do keyboard input into Vim,
" which is simply excruciating.
" automatically puts syntax-checker (lint, pyflakes, etc) errors in the
" location list, and updates them when you save. Use :lw to open the location
" list window.

"call vam#ActivateAddons(['AutoClose%1849']) " auto-closes parentheses etc
"call vam#ActivateAddons(['delimitMate']) " first impression: delimitMate is
" better than AutoClose%1849.
" FIXME: if you are on top of a ) and type ) then delimitMate doesn't type it,
" it just moves right of it, even if that ) was not auto-completed by
" delimitMate (meaning, it was there before).

" Plug 'craigemery/vim-autotag' " seems broken. runs python code, and can't
" import vim module.

let g:pythonhelper_updatetime = 1000
"call vam#ActivateAddons(['git:git://github.com/cheater/pythonhelper.git'])
call vam#ActivateAddons(['py-coverage'])

"call vam#ActivateAddons(['pythonhelper'])
" displays the class and function name the cursor is currently on.
" FIXME: breaks on multiline comments that reduce indent level.

" the following two status lines that are commented out were ripped off
" someone else... :)
" set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]
" set statusline=%<%f%y\ \ %h%m%r%=%-14.(%l/%L,%c%V%)\ %P
" set statusline=%-f%r\ %2*%m%*\ \ \ \ %1*%{TagInStatusLine()}%*%=[%l:%c]
" \ \ \ \ [buf\ %n]

let g:chapa_default_mappings = 1
let g:chapa_no_repeat_mappings = 1
call vam#ActivateAddons(['chapa']) " fnc, fpc to go to next/prev class, also
" works for functions. Works for Python and JavaScript. FIXME: does not think
" that old-style classes (that do not extend anything) are classes.
call vam#ActivateAddons(['browser%2227']) " :Google, :Wikipedia, :WebBrowser
call vam#ActivateAddons(['camelcasemotion']) " now you can do ci,w and ci,b
" for CamelCase and snake_case names. FIXME: doesn't work.

call vam#ActivateAddons(['phpcomplete']) " ^X^O for omnicompletion via tags or
"from open files.

" call vam#ActivateAddons(['CmdlineComplete']) " press ^N/^P (C-n, C-p) in
" command line or search mode. Doesn't work well in search but works well in
" command mode.
" ^ FIXME: seems broken.

" there's also this: https://github.com/j5shi/CommandlineComplete.vim - might
" be working?

call vam#ActivateAddons(['git:git://github.com/bogado/file-line.git'])
" allows you to open file:line like from compiler or grep output
" FIXME: messes up -p, -o, and -O.

" call vam#ActivateAddons(['Smartput']) " makes p work better inside
" (lists, of, things) and 'lists of words' by auto-adjusting where the space
" or the comma joining the words is placed.
" Smartput has been deactivated for now because it conflicts with this
" advanced use of p:
" \"=strftime(\"%c\")<cr>p (double quotes have been escaped but normally there
" are no backslashes). What happens here is we use the expression buffer
" (named =), we fill it with the output of strftime, and then press p to put
" it into the buffer.

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


call vam#ActivateAddons(['fugitive']) " needed for gitv
call vam#ActivateAddons(['vimagit']) " magit for vim. Allows you to stage
" single lines. Real cool.
call vam#ActivateAddons(['gitv']) " like gitk, but in Vim. Really cool. Does
" this exist for mercurial?
call vam#ActivateAddons(['Lawrencium']) " like fugitive, but for hg

let Tlist_Ctags_Cmd = 'ctags-exuberant' " ubuntu puts etags in /usr/bin/ctags
call vam#ActivateAddons(['SourceCodeObedience'])
" create tags and cscope.out in your project root, and in the dir where they
" are, create a foo.sco file. Edit it, then do :SCO* to query the project by
" using info from tags, cscope, and so on.
" FIXME: the display is being messed up by 'long line showing'
"
" To use cscope, go to the project root, and do:
" find . -iname '*.whatever' > cscope.files
" (note that you can do it with an enough C-like language)
" Then, do cscope -R -b (-b disables the shell)


call EnsureSystemPackage("id-utils") " for the lid addon
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
"
" To generate the database, you'd run mkid.


call EnsureSystemPackage("ack-grep") " for the ack addon
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
call vam#ActivateAddons(['git:git://github.com/mileszs/ack.vim.git'])
" You can use :Ack, :AckAdd for quickfix, :LAck, :LAckAdd for location-list,
" use mappings like o, go, t, T, v, V to open the file in different ways.
" See :help *ack-mappings* for more mappings. The quickfix support (:AckAdd
" and the mappings) is better than lid.
" We need to set g:ackprg because Debian renames ack to ack-grep.
" FIXME: add a variable to explicitly turn on the quickfix bindings.
" FIXME: remove the 'silent' from 'silent execute' which messes up the gui
" during search results that open a file being edited by another instance of
" Vim
" FIXME: fix the error which happens when two instances try to display the
" same file (is this even fixable?)


call EnsureSystemPackage("global") " GNU global, for the gtags addon
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
" the packaged version is very old and crashy (6.x is new).
"
" To create tags, execute gtags from the project root. If it crashes then
" you need a new version.

" some bindings for the quickfix and location list windows
" TODO: put this in a Vim plugin.
au BufWinEnter * call QFBind()
function! QFBind()
    if &buftype==#"quickfix"
        exec "nnoremap <silent> <buffer> q :ccl<CR>"
        exec "nnoremap <silent> <buffer> t <C-W><CR><C-W>T"
        exec "nnoremap <silent> <buffer> T <C-W><CR><C-W>TgT<C-W><C-W>"
        exec "nnoremap <silent> <buffer> o <CR>"
        exec "nnoremap <silent> <buffer> go <CR><C-W><C-W>"
        exec "nnoremap <silent> <buffer> v <C-W><C-W><C-W>v<C-L><C-W><C-J><CR>"
        exec "nnoremap <silent> <buffer> gv <C-W><C-W><C-W>v<C-L><C-W><C-J><CR><C-W><C-J>"
        endif
    endfunction



" -- Scala
"
" disabled envim because i currently don't have the envim related binary
" installed and it's annoying to see the errors all the time.
"  \ 'envim'

let plugins = [
  \ 'ensime',
  \ 'vim-addon-async',
  \ 'vim-async-beans',
  \ 'ensime-common',
  \ ]

call vam#ActivateAddons(plugins, {'auto_install' : 0})
" call vam#ActivateAddons(['vim-scala']) " Scala syntax files.
call vam#ActivateAddons(['git:git://github.com/derekwyatt/vim-scala.git'])


let g:Tlist_Ctags_Cmd = 'hasktags-ctags'
let g:Tlist_Display_Tag_Scope = 0
Plug 'yegappan/taglist'

" Use taglist plugin to display the tag you're currently on
function! TagInStatusLine2()
  let s:tag = taglist#Tlist_Get_Tagname_By_Line()
  if s:tag == ""
    return ""
  endif
  let s:tag2 = "[" . s:tag . "]"
  return s:tag2
  endfunction

set statusline=\ %n\ %f\ %<[%M%Y%R]%h%w\ %<%{TagInStatusLine2()}%=\ [L%l\ C%v\ %p%%]

" let g:gundo_prefer_python3 = 1
" Plug 'sjl/gundo.vim' " :GundoToggle - displays undo tree. Superceded by Mundo.
Plug 'mbbill/undotree' " :UndotreeToggle - displays undo tree. Doesn't require
" python, but uglier and inferior to Gundo/Mundo.
Plug 'chrisbra/histwin.vim' " :histwin - displays undo UI, but it's a bit complicated.

Plug 'ludovicchabant/vim-gutentags' " - tag management. would be nice, but it
" won't work with hasktags, only universal-ctags. would need to patch hasktags.

Plug 'junegunn/goyo.vim' " :Goyo for distraction free writing.

Plug 'ggandor/leap.nvim' " Quickly jump around using ad-hoc labels


function! HashCommentBind()
    " This function inserts a space after a hash (#) character opening a
    " comment, but not on the first line, so that it doesn't interrupt with
    " typing shebangs. You could customize this for file types and have it
    " type the whole shebang on line 1, for example '#!/usr/bin/env python'.
    " The idea was to add \   | inoremap <expr> # HashCommentBind()
    " to atuocmd FileType sh and python, but then this bind becomes active
    " in all buffers, not just shell/python
    if line(".") == 1
        return "#"
    else
        return " # " " the ' ^H' is there so that the # doesn't get put in
        " the first column.
        endif
    endfunction

Plug 'romainl/vim-qf' " a bunch of quickfix related enhancements, but they're
" sometimes not compatible with other plugins and some are very intrusive

" https://github.com/Konfekt/FastFold  maybe if i start using folds
