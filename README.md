Show git diff for Git Rebase Intractive
=======================================

Show git diff between each commit and its parent below the commit list
window of git rebase interactive.

When you move text-cursor in git-rebase-todo file, auto-git-diff.vim gets
a commit hash of the line where cursor exists and update the diff window.

## Variables

 - `g:auto_git_diff_disable_auto_update` 

If the value is set to 1, the diff window won't updated automatically. You
can update the diff window manually with the command: `:call
<Plug>(auto_git_diff_manual_update)`.

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
`:nmap <Leader>gd <Plug>(auto_diff_manual_update)`

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

