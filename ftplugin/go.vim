" Go specific key bindings

" Go related mappings
:nmap <Leader>i :GoInfo<CR>
:nmap <Leader>gd :GoDef<CR>
:nmap <Leader>r <Plug>(go-run)
:nmap <Leader>re :GoRename<CR>
:nmap <Leader>t :GoTest<CR>
:nmap gd <Plug>(go-def-tab)

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

" (un)comment line(s)
:map <buffer> <Leader>// :s:^://:<CR>:noh<CR>
:map <buffer> <Leader>?? :s:^\s*//::<CR>:noh<CR>
