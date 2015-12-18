if exists("b:did_auto_git_diff") | finish | endif
let b:did_auto_git_diff = 1

augroup auto_git_diff_command_group
    autocmd!
    autocmd CursorMoved git-rebase-todo call auto_git_diff#auto_update_git_diff()
augroup END

