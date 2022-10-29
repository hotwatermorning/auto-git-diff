Show git diff for Git Interactive Rebase
=======================================

`auto-git-diff` is a vim plugin which enable showing commit diff while processing git interactive rebase.

When you move the text cursor in the commit list window, this plugin reads the commit hash of the line and show diff of the commit.

![sample_image](https://user-images.githubusercontent.com/359226/33921582-2319e7a0-e008-11e7-8be3-ba9f68a78217.gif)

## Variables

- `g:auto_git_diff_disable_auto_update`

    If this variable is set to 1, the diff window won't be updated automatically. To update the diff window manually, use this key mapping: `<Plug>(auto_git_diff_manual_update)`.

- `g:auto_git_diff_show_window_at_right`

    If this variable is set to 1, the diff window will be created at right on the commit list window, instead of bottom.

- `g:auto_git_diff_command_options`

    The value of this variable will be passed to `git diff` command. If this variable is not defined, `--stat -p --submodule -C -C` will be used.

## Mappings

- `<Plug>(auto_git_diff_manual_update)`

    This key mapping triggers update of the diff window. This mapping is used when the diff window's automatic update is disabled.

- `<Plug>(auto_git_diff_scroll_down_1)`
- `<Plug>(auto_git_diff_scroll_up_1)`
- `<Plug>(auto_git_diff_scroll_down_half)`
- `<Plug>(auto_git_diff_scroll_up_half)`
- `<Plug>(auto_git_diff_scroll_down_page)`
- `<Plug>(auto_git_diff_scroll_up_page)`

    These key mappings scroll the diff window without moving the cursor into the window. `_1` means scrolling one line (like `<C-e>` or `<C-y>`), `_half` means scrolling half a page (like `<C-d>` or `<C-u>`) and `_page` means scrolling one page (like `<C-f>` or `<C-b>`).

This snippet is an example configuration:

```vim
function! s:setup_auto_git_diff() abort
    nmap <buffer><C-l> <Plug>(auto_git_diff_scroll_manual_update)
    nmap <buffer><C-n> <Plug>(auto_git_diff_scroll_down_half)
    nmap <buffer><C-p> <Plug>(auto_git_diff_scroll_up_half)
endfunction
autocmd FileType gitrebase call <SID>setup_auto_git_diff()
```

## License

    The MIT License (MIT)
    Copyright (c) 2015 hotwatermorning

    Permission is hereby granted, free of charge, to any person obtaining
    a copy of this software and associated documentation files (the
    "Software"), to deal in the Software without restriction, including
    without limitation the rights to use, copy, modify, merge, publish,
    distribute, sublicense, and/or sell copies of the Software, and to
    permit persons to whom the Software is furnished to do so, subject to
    the following conditions:

    The above copyright notice and this permission notice shall be
    included in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
    EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
    IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
    CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
    TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
    SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

