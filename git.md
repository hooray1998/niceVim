# fasd
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
dd                      Perform a |:Gdiffsplit| on the file under the cursor.
dv                      Perform a |:Gvdiffsplit| on the file under the cursor.


Commit maps ~
cc                      Create a commit.
ca                      Amend the last commit and edit the message.
cw                      Reword the last commit.
