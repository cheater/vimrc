function! HaskellManual()
python << EOF
import vim
word = vim.eval("expand('<cword>')")

# The below is a bit unsightly, I know. I have chosen this way over several
# other possibilities:
# 1) Using a temporary file: sucks, litters the data system with files, does
# not ensure the recipient process (lynx) will get the file in extreme cases
# 2) the old version (using os.system with echo to supply lynx's stdin) - this
# had a shell injection vulnerability
# 3) the subprocess module - this does not work for me because lynx requires
# access to a tty, and subprocess does not give it the tty that Vim is running
# inside of. os.system does, however, so I can only use that.
# If you know of a better way, please do let me know.
#
# What the below does is it uses the word the cursor is currently over, and
# queries hayoo with it. Then it gets all the function results and puts them
# in pairs of the form (url, name). Those then get transformed into a very
# simple html page with one link for each tuple. This gets sent to lynx -stdin
# via its standard input, so that lynx displays it on startup. Once started,
# lynx has control of the tty and is fully interactive.

os.system("""
    python -c '
word = \" """ + word + """ \"[1:-1]
import urllib
import json
results = json.load(urllib.urlopen(
    \"http://holumbus.fh-wedel.de/hayoo/hayoo.json?query=\" + word
    ))
fmt = \"<a href=\\\"%s\\\">%s</a><br>\"
links = \"\"
for f in results[\"functions\"]:
    links += fmt % (f[\"uri\"], f[\"module\"] + \".\" + f[\"name\"])
if not links:
    links = \"Function not found.\"
html = \"<html><body>%s</body></html>\" % (links,)
print html
        ' | lynx -stdin -vikeys
    """)
EOF
  silent !reset
  redraw!
  endfunction

command! HaskellManual call HaskellManual()

autocmd FileType haskell nnoremap K :HaskellManual<cr>
" FIXME: those are currently disabled, re-enable them and see what bugs they
" have and how they can be made better.
"call vam#ActivateAddons(['haskellmode-vim'])
"call vam#ActivateAddons(['vim-addon-haskell'])
