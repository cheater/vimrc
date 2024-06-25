" This uses djinn for automatically generating Haskell code from type
" signatures. Move your cursor over the type sig and type :Djinn. See also the
" <http://www.augustsson.net/Darcs/Djinn/examples> examples page for more info
" on using Djinn.
command! -range Djinn
\    <line1>,<line2>!
\      sed 's/::/?/g'
\      | djinn <(cat)
\      | grep -v -- "-- loading file /dev/fd"

" Get the type of an expression.
command! -range Type <line1>,<line2>LambdabotPipe @type

" Refactor Haskell code into pointfree form
command! -range Pl <line1>,<line2>LambdabotPipe @pl

" Refactor Haskell code into pointful form
command! -range Unpl <line1>,<line2>LambdabotPipe @unpl

" Refactor Haskell code from monadic operator form to do form
command! -range Do <line1>,<line2>LambdabotPipe @do

" Refactor Haskell code from do form to monadic operator form
command! -range Undo <line1>,<line2>LambdabotPipe @undo

" Refactor Haskell code by unrolling MTL monads. You only do this on the type,
" for example on a line that says:
" StateT s (ContT ByteString IO) a
command! -range Unmtl <line1>,<line2>LambdabotPipe @unmtl

" Prettify Haskell code.
command! -range Hspretty <line1>,<line2>LambdabotPipe @pretty

" Get free theorem (piece of code) that uses some function. You should only use
" this on lines containing a single name.
command! -range Hsfree <line1>,<line2>LambdabotPipe @free

" Get the source of a function. Use this on lines containing a single name.
command! -range Hssrc <line1>,<line2>LambdabotPipe @src

" Get the type of a value.
command! -range Hstype <line1>,<line2>LambdabotPipe @type

" Get the kind of a type.
command! -range Hskind <line1>,<line2>LambdabotPipe @kind

" Automatically generate Haskell code. You feed it what's after the :: in
" a type signature. For example: you don't give it foo :: a -> a like in
" Djinn, you give it a -> a.
" I couldn't get this command to work yet. Lambdabot doesn't seem to think
" that djinn is installed. FIXME
command! -range Djinn2 <line1>,<line2>LambdabotPipe @djinn

" Lambdabot integration. Useful for refactoring Haskell code.
" Requires the lambdabot package:
" <http://hackage.haskell.org/package/lambdabot>
command! -nargs=1 -range LambdabotPipe
\    <line1>,<line2>!
\      inp="$(cat)";
\      without_indent=$(echo "$inp" | sed 's/^[ \t]*//');
\      indent_spaces=$(echo "$inp" | head -n1 | sed 's/^\([ \t]*\)\([^ \t].*\|\)$/\1/');
\      outp=$(lambdabot -e <args>" $without_indent" 2>/dev/null );
\      echo "$without_indent" > /tmp/woi;
\      echo <args>" $without_indent" > /tmp/awoi;
\      echo -n "$indent_spaces$outp"
