if exists("g:did_auto_git_diff") | finish | endif
let g:did_auto_git_diff = 1

augroup auto_git_diff_command_group
    autocmd!
    autocmd CursorMoved git-rebase-todo call auto_git_diff#auto_update_git_diff()
    autocmd FileType gitrebase setlocal nowarn nowb
augroup END

nnoremap <silent><Plug>(auto_git_diff_scroll_down_1) :<C-u>call auto_git_diff#scroll_in_preview_window("C-e")<CR>
nnoremap <silent><Plug>(auto_git_diff_scroll_up_1) :<C-u>call auto_git_diff#scroll_in_preview_window("C-y")<CR>
nnoremap <silent><Plug>(auto_git_diff_scroll_down_half) :<C-u>call auto_git_diff#scroll_in_preview_window("C-d")<CR>
nnoremap <silent><Plug>(auto_git_diff_scroll_up_half) :<C-u>call auto_git_diff#scroll_in_preview_window("C-u")<CR>
nnoremap <silent><Plug>(auto_git_diff_scroll_down_page) :<C-u>call auto_git_diff#scroll_in_preview_window("C-f")<CR>
nnoremap <silent><Plug>(auto_git_diff_scroll_up_page) :<C-u>call auto_git_diff#scroll_in_preview_window("C-b")<CR>

