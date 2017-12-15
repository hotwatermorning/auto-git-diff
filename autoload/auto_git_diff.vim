let s:save_cpo = &cpo
let s:previous_hash_string = ""
set cpo&vim

nnoremap <silent> <Plug>(auto_git_diff_manual_update) :<C-u>call auto_git_diff#show_git_diff()<CR>

" Get commit hash from current line.
" The first colomn(pick, r, ...) can be empty.
function! s:get_git_hash() abort
    return matchstr(getline('.'), '^\(\w\+\>\)\=\(\s*\)\zs\x\{4,40\}\>\ze')
endfunction

" Find the preview window.
" If not found, return zero.
function! s:find_preview_window() abort
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
function! s:show_git_diff_impl(hash, vertsplit, opts) abort

    let wn = s:find_preview_window()

    if wn == 0
        " The preview window is not found.
        " => Open new window

        if a:vertsplit
            rightbelow vnew
        else
            rightbelow new
        endif

        silent! setlocal previewwindow bufhidden=delete nobackup noswf nobuflisted nowrap buftype=nofile

        let wn = bufwinnr('%')
    else
        " Preview window is found"
        " Move to the window
        silent execute wn."wincmd w"
    endif

    let diff_command = "git diff ".a:opts." ".a:hash."~1 ".a:hash
    let prefix = has("win32") ? "set LANG=C & " : "LANG=C "
    silent let out = system(prefix.diff_command)

    if v:shell_error
        setlocal ft=
    else
        setlocal ft=diff
    endif

    setlocal modifiable

    silent! % delete _
    silent! $ put=out
    silent! 1 delete _

    setlocal nomodifiable

    noremap <buffer> q :bw<cr>

    silent wincmd p
endfunction

function! auto_git_diff#show_git_diff() abort

    let hash_string = s:get_git_hash()
    if hash_string == "" || hash_string == s:previous_hash_string
      return
    else
      let s:previous_hash_string = hash_string
    endif

    call s:show_git_diff_impl(  s:get_git_hash()
\                               , get(g:, "auto_git_diff_show_window_at_right", 0)
\                               , get(g:, "auto_git_diff_command_options", "--stat -p --submodule -C -C")
\                               )
endfunction

" Called when text-cursor is moved.
function! auto_git_diff#auto_update_git_diff() abort

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

