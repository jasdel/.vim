" General
"-------------------
syntax enable
filetype plugin indent on
set relativenumber
set number
set wrap linebreak
set shiftwidth=4 tabstop=4
let mapleader=","
set hlsearch

" Platform Specific
"-------------------
let s:uname = substitute(system("uname -s"), '\n', '', '')

if s:uname == "Darwin"
  let g:tagbar_ctags_bin="$HOME/bin/ctags"
endif

" Cursor improvements
"-------------------
if exists('+colorcolumn')
  set colorcolumn=80
endif
set cursorline

" Alt swapfile output
"-------------------
set directory=~/.vim/swapfiles//

" Highlight
"--------------------
let g:go_highlight_functions = 1  
let g:go_highlight_methods = 1  
let g:go_highlight_structs = 1  
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1  
let g:go_highlight_build_constraints = 1

" neocomplete - auto completion
"---------------------
let g:neocomplete#enable_at_startup = 1
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
set completeopt=menu

" Pathogen - manage runtime path
"----------------------
execute pathogen#infect()

" Color and Themes
"----------------------

" Vim color detection
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

let g:rehash256 = 1
colorscheme molokai

" Go Mappings
" ----------------------

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplete#close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Go related mappings
au FileType go nmap <Leader>i :GoInfo<CR> 
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>r <Plug>(go-run)
au FileType go nmap <Leader>re :GoRename<CR>
au FileType go nmap <Leader>b :GoBuild<CR>
au FileType go nmap <Leader>t :GoTest<CR>
au FileType go nmap gd <Plug>(go-def-tab)

" Vim-Go config
"------------------
let g:go_fmt_command = "goimports"
let g:go_disable_autoinstall = 0

" Vim-markdown
"------------------
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1

" Vim-ctrlp
"------------------
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_custom_ignore = {
			\ 'dir': '\v[\/]\.(git|idea)',
			\ 'file': '\v[\/].(DS_Store)',
 \}

" rust.vim
"------------------
"let g:rustfmt_autosave=1

" tagbar
"-----------------
nmap <F8> :TagbarToggle<CR>
" TagBar for Go
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }