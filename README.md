Show git diff for Git Rebase Interactive
=======================================

`auto-git-diff` is a vim plugin which shows git diff between each commit and
its parent commit below the commit list window of git rebase interactive.

When you move a text-cursor in `git-rebase-todo` file, `auto-git-diff` gets
a commit hash of the line where the cursor exists and update the diff window.

![sample_image](https://cloud.githubusercontent.com/assets/359226/11892093/3e9c3a24-a5a8-11e5-81de-e9730aa2fa73.png)

## Variables

 - `g:auto_git_diff_disable_auto_update` 

If the value is set to 1, the diff window won't update automatically. You
can update the diff window manually with following keymapping: 
`<Plug>(auto_git_diff_manual_update)`.

 - `g:auto_git_diff_show_window_at_right`

If the value is set to 1, the diff window will be created at right on the
commit list window.

 - `g:auto_git_diff_command_options`

Options passed to `git diff` command. If the variable is not defined,
`--stat -p --submodule -C -C` will be
   used.

## Mappings

 - `<Plug>(auto_git_diff_manual_update)`

Key mapping to update diff window manully. Example:
`:nmap <Leader>gd <Plug>(auto_git_diff_manual_update)`

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

