"
" Customizations for working with Go lang. The goal is to have key strokes the
" same, or nearly the same, for any different language, and for the settings to
" only load when the specific language is in use.
"
" ,r = run current file
" ,t = test current file
" ,b = build current file
" ga = go to the 'alternate' file, like to the test file from the source file,
"      or to the source file from the test file.
" ,m = make project - this one tends to be hard as there are a lot of build
"      systems, and many projects don't have clean build systems, requiring
"      instead a series of steps.
" ,n = rename symbol under the cursor.
" ,l = run linter
" gd = go to the definition of the symbol under the cursor.
" ?? = comment out the current line, or the currently highlighted block.
"
" On save, strip whitespace.
"
" Settings for vim-go -- https://github.com/fatih/vim-go#settings

" Make the output of GoTest appear in a terminal window instead of in
" quickfix.
" -- with experimentation I found that this is not so useful. Although the
"  quick fix window is quirky and difficult to read, it stays visible, and is
"  navigable. The terminal window is nicer with respect to size, but it
"  doesn't have highlighting and disappears when I press a key.
"let g:go_term_enabled = 1

" Use goimports for formatting instead of gofmt. goimports is a superset that
" includes automatically adjusting the import list of the file on save.
let g:go_fmt_command = "goimports"

" Debugging output from `go test` and `go build` should appear in the quickfix
" window.
let g:go_list_type = "quickfix"

let g:go_disable_autoinstall = 1

" Open new terminals in a horizontal split by default.
let g:go_term_mode = "split"

" Automatically fill in and fix the imports section on save.
"let g:go_fmt_command = "goimports"

" Enable some keyboard shortcuts.
au FileType go nmap ,a  :GoAlternate<CR>
au FileType go nmap ,b  <Plug>(go-build)
au FileType go nmap ,c  <Plug>(go-coverage)
au FileType go nmap ,e  <Plug>(go-rename)
au FileType go nmap ,ga GoAlternate<CR>
au FileType go nmap ga  GoAlternate<CR>
au FileType go nmap ,gb <Plug>(go-doc-browser)
au FileType go nmap ,gd <Plug>(go-doc)
au FileType go nmap ,i  <Plug>(go-info)
au FileType go nmap ,l  :GoLint<CR>
au FileType go nmap ,m  :GoBuild<CR>
au FileType go nmap ,n  <Plug>(go-rename)
au FileType go nmap ,q  <Plug>(go-doc-split)
au FileType go nmap ,r  <Plug>(go-run-split)
au FileType go nmap ,t  <Plug>(go-test)


au FileType go vmap <C-_> :s#^#//#<CR>
au FileType go nmap <C-_> :s#^#//#<CR>

" Improve the syntax highlighting defaults.
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Go uses tabs everywhere, so change the tab width.
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

" Without these highlight groups defined, vim-go errors out when invoking
" `:GoCoverage`
highlight goCoverageNormalText guibg=Black guifg=White
"highlight goCoverageUncover ctermbg=red guibg=darkred
highlight goCoverageUncover ctermbg=lightred
"highlight goCoverageCovered ctermbg=green guibg=darkgreen
highlight goCoverageCovered ctermbg=lightgreen

