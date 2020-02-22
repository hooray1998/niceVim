-      添加或删除文件
cc     提交当前修改
Gwrite 增加到暂存区
Gread  放弃修改恢复到最近的一次提交或暂存区的内容
Gedit  查看最近提交的版本
Gvdiff 与最近的提交比较
Gblame 查看每行的最新修改是什么时候
Gmove  移除文件并重命名缓存区
Ggrep  搜索所有提交的行
[range] Gclog 查看某些文件的提交记录
Staging/unstaging maps ~
s                       Stage (add) the file or hunk under the cursor.
u                       Unstage (reset) the file or hunk under the cursor.
-                       Stage or unstage the file or hunk under the cursor.
U                       Unstage everything.
X                       Discard the change under the cursor.  This uses
                        `checkout` or `clean` under the hood.  A command is
                        echoed that shows how to undo the change.  Consult
                        `:messages` to see it again.  You can use this during
                        a merge conflict do discard "our" changes (--theirs)
                        in the "Unstaged" section or discard "their" changes
                        (--ours) in the "Staged" section.
=                       Toggle an inline diff of the file under the cursor.
>                       Insert an inline diff of the file under the cursor.
<                       Remove the inline diff of the file under the cursor.
gI                      Open .git/info/exclude in a split and add the file
                        under the cursor.  Use a count to open .gitignore.
I                       Invoke |:Git| add --patch or reset --patch on the file
P                       under the cursor. On untracked files, this instead
                        calls |:Git| add --intent-to-add.
Diff maps ~
dp                      Invoke |:Git| diff on the file under the cursor.
                        Deprecated in favor of inline diffs.
dd                      Perform a |:Gdiffsplit| on the file under the cursor.
dv                      Perform a |:Gvdiffsplit| on the file under the cursor.
ds                      Perform a |:Ghdiffsplit| on the file under the cursor.
dh
dq                      Close all but one diff buffer, and |:diffoff|! the
                        last one.
d?                      Show this help.
Navigation maps ~
                        in a blob, this and similar maps jump to the patch
                        from the diff where this was added, or where it was
                        removed if a count was given.  If the line is still in
                        the work tree version, passing a count takes you to
                        it.
                        a new split.
                        a new vertical split.
                        a new tab.
                        a preview window.  In the status buffer, 1p is
                        required to bypass the legacy usage instructions.
~                       Open the current file in the [count]th first ancestor.
P                       Open the current file in the [count]th parent.
C                       Open the commit containing the current file.
(                       Jump to the previous file, hunk, or revision.
)                       Jump to the next file, hunk, or revision.
[c                      Jump to previous hunk, expanding inline diffs
                        automatically.  (This shadows the Vim built-in |[c|
                        that provides a similar operation in |diff| mode.)
]c                      Jump to next hunk, expanding inline diffs
                        automatically.  (This shadows the Vim built-in |]c|
                        that provides a similar operation in |diff| mode.)
[/                      Jump to previous file, collapsing inline diffs
[m                      automatically.  (Mnemonic: "/" appears in filenames,
                        "m" appears in "filenames".)
]/                      Jump to next file, collapsing inline diffs
]m                      automatically.  (Mnemonic: "/" appears in filenames,
                        "m" appears in "filenames".)
i                       Jump to the next file or hunk, expanding inline diffs
                        automatically.
[[                      Jump [count] sections backward.
]]                      Jump [count] sections forward.
[]                      Jump [count] section ends backward.
][                      Jump [count] section ends forward.
*                       One the first column of a + or - diff line, search for
                        the corresponding - or + line.  Otherwise, defer to
                        built-in |star|.
#                       Same as "*", but search backward.
gu                      Jump to file [count] in the "Untracked" or "Unstaged"
                        section.
gU                      Jump to file [count] in the "Unstaged" section.
gs                      Jump to file [count] in the "Staged" section.
gp                      Jump to file [count] in the "Unpushed" section.
gP                      Jump to file [count] in the "Unpulled" section.
gr                      Jump to file [count] in the "Rebasing" section.
gi                      Open .git/info/exclude in a split.  Use a count to
                        open .gitignore.
Commit maps ~
cc                      Create a commit.
ca                      Amend the last commit and edit the message.
ce                      Amend the last commit without editing the message.
cw                      Reword the last commit.
cvc                     Create a commit with -v.
cva                     Amend the last commit with -v
cf                      Create a `fixup!` commit for the commit under the
                        ursor.
