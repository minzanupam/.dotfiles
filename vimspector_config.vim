" debug bindings
nnoremap <Bslash><Bslash>gg :call vimspector#Launch()<CR>
" nnoremap <leader><leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
" nnoremap <leader><leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
" nnoremap <leader><leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
" nnoremap <leader><leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
" nnoremap <leader><leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
" nnoremap <leader><leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <Bslash><Bslash>ge :call vimspector#Reset()<CR>
nnoremap <Bslash>gcc :call vimspector#CleanLineBreakpoint()<CR>
nmap <Bslash>l <Plug>VimspectorStepInto
nmap <Bslash>j <Plug>VimspectorStepOver
nmap <Bslash>k <Plug>VimspectorStepOut
nmap <Bslash>_ <Plug>VimspectorRestart
nnoremap <Bslash>c :call vimspector#Continue()<CR>
nmap <Bslash>r <Plug>VimspectorRunToCursor
nmap <Bslash>t <Plug>VimspectorToggleBreakpoint
nmap <Bslash>gt <Plug>VimspectorToggleConditionalBreakpoint
" key maps end
