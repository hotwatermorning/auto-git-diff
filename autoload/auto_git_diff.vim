let s:save_cpo = &cpo
let s:previous_hash_string = ""
set cpo&vim

setlocal nowarn nowb

nnoremap <silent> <Plug>(auto_git_diff_manual_update) :<C-u>call auto_git_diff#show_git_diff()<CR>

" Get commit hash from current line.
" The first colomn(pick, r, ...) can be empty.
function! s:get_git_hash()
    return matchstr(getline('.'), '^\(\w\+\>\)\=\(\s*\)\zs\x\{4,40\}\>\ze')
endfunction

" Find the preview window.
" If not found, return zero.
function! s:find_preview_window()
    for nr in range(1, winnr('$'))
        if getwinvar(nr, "&pvw") == 1
            " found a preview
            return nr
        endif
    endfor
    return 0
endfunction

" Execute git diff between hash~1 and hash with options a:opts,
" and show the result into the preview window.
function! s:show_git_diff_impl(hash, vertsplit, opts)

    let last_wn = bufwinnr('%')
    let wn = s:find_preview_window()

    if wn == 0
        " The preview window is not found.
        " => Open new window

        if a:vertsplit
            rightbelow vnew
        else
            rightbelow new
        endif

        silent! setlocal ft=diff previewwindow bufhidden=delete nobackup noswf nobuflisted nowrap buftype=nofile

        let wn = bufwinnr('%')
    else
        " Preview window is found"
        " Move to the window
        silent execute wn."wincmd w"
    endif

    let diff_command="git diff ".a:opts." ".a:hash."~1 ".a:hash

    setlocal modifiable

    " Clear preview window
    exe "normal! ggVG\"_d"

    if has("win32")
        exe "normal! :0r!set LANG=C & ".diff_command."\<CR>1G0"
    else
        exe "normal! :0r!LANG=C ".diff_command."\<CR>1G0"
    endif

    setlocal nomodifiable

    noremap <buffer> q :bw<cr>

    silent execute "wincmd p"
endfunction

function! auto_git_diff#show_git_diff()

    let hash_string = s:get_git_hash()
    if hash_string == "" || hash_string == s:previous_hash_string
      return
    else
      let s:previous_hash_string = hash_string
    endif

    let s:auto_git_diff_show_window_at_right = get(g:, "auto_git_diff_show_window_at_right", 0)
    let s:auto_git_diff_command_options = get(g:, "auto_git_diff_command_options", "--stat -p --submodule -C -C")
    call s:show_git_diff_impl(  s:get_git_hash()
\                               , s:auto_git_diff_show_window_at_right
\                               , s:auto_git_diff_command_options
\                               )
endfunction

" Called when text-cursor is moved.
function! auto_git_diff#auto_update_git_diff()

    if get(g:, "auto_git_diff_disable_auto_update", 0)
        return
    endif

    if mode() != "n"
        return
    endif

    call auto_git_diff#show_git_diff()
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

