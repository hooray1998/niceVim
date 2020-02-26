# NiceVim文档

:PlugInstall

## Install


### Python
```sh
install anaconda3
pip install neovim
pip install pylint(python 语法检查)
pip install pygments (配合gtags)
pip install neovim-remote
checkhealth
```

### Nodejs，Yarn

npm i -g bash-language-server

### Universal Ctags

```sh
sudo apt install automake autoconf libtool
./autogen.sh
./configure --prefix=/home/itt/.local
make
make install # may require extra privileges depending on where to install
```

### Gtags

```sh
wget https://ftp.gnu.org/pub/gnu/global/global-6.6.tar.gz
tar xvf global-6.6.tar.gz
cd global-6.6
./configure --with-sqlite3
make -j4
sudo make install
```


### Go
```go
wget https://dl.google.com/go/go1.11.5.linux-amd64.tar.gz
tar xvf go1.11.5.linux-amd64.tar.gz -C .local/
加上go的环境变量
go　get github.com:efm-lsp
加上efm的环境变量
拷贝yaml文件
```


### 其他工具

npm i -g fd-find
zypper in fd
rg


### 配置文件汇总

coc.config文件
python配置
go
.config中coc的配置
管理个人片段


## QuickStart



### 文本对象

| 文本对象     | 命令  | 备注                                       |
|--------------|-------|--------------------------------------------|
| 缩进文本对象 | ii/ai | 表示当前缩进，vii 选中当缩进，cii 改写缩进 |
| 语法文本对象 | iy/ay | 基于语法的文本对象                         |
| 函数文本对象 | if/af | 支持 c/c++/vim/java/python                 |
| 参数文本对象 | i,/a, | 包括参数或者列表元素                       |
| uri/url对象  | iu/au | 表示                                       |

### 文件搜索

| 命令  | 功能                           |
|-------|--------------------------------|
| `C-p` | fzf搜索当前项目管理文件(GFile) |
| `C-n` | 搜索最近文件                   |
| `A-1` | coc文件树                      |
| `-`   | 文件管理器                     |

### 文本检索


| 命令     | 功能           |
|----------|----------------|
| `A-*`    | 搜索当前单词   |
| `Rg`     | Leaderf rg搜索 |
| `CtrlSF` | 搜索文本       |
| `S-l`      | 搜索当前文件   |
| `S-L`      | 搜索所有Buffer |


### 符号搜索

| 命令   | 功能                              |
|--------|-----------------------------------|
| `A-2`  | 显示符号列表                      |
| `m-m`  | 搜索函数                          |
| `m-p`  | 搜索符号                          |
| `m-P`  | 搜索全局符号                      |
| `F3`   | 搜索当前符号并右侧预览A-d,A-u翻动 |
| `K/F4` | 显示函数签名或帮助                |


## 注释,代码美化

Alt-Space  代码段格式化
AutoFormat 全文格式化
Alt-Enter  代码直接修改
Alt-\      代码修复意见


设置正确的wrap 和 paste  pastetoggle

menu的问题参考连接的其他文件
https://github.com/skywind3000/vim/blob/master/asc/menu.vim



## 定义和引用

Gutentags_plus取消支持markdown

GscopeFind g 命令查找定义
GscopeFind s 命令查找引用

<leader>gg - 查看光标下符号的定义
<leader>gs - 查看光标下符号的引用
<leader>gc - 查看有哪些函数调用了该函数
<leader>gf - 查找光标下的文件
<leader>gi - 查找哪些文件 include 了本文件

TODO: 支持c,cpp,python,go,lua,java就行


:PreviewTag连续按可以连续切换
:PreviewGoto [tabe|edit]进入编辑
M-u M-d 上下预览
C-w z 删除预览窗口

**如果在quickfix窗口中,  按p预览,P关闭, M-u/d 上下移动 Enter进入编辑**

**Coc跳转** 
gr gd
coc-改名字


### Git

查看git.md
EnhanceDiff   |Diff增强 , 验证有效性
SignifyToggle
git diff
git差异

fzf中GFiles


### 窗口管理

| 命令      | 功能          |
|-----------|---------------|
| S+ 1~n    | Tab跳转       |
| Alt + 1   | coc文件管理器 |
| Alt + 2   | 符号列表      |
| Alt + 3   | Undo历史      |
| Alt + 7   | Todo显示      |
| Alt + 8-0 | 帮助菜单      |

会话保存等待
开机界面



### Markdown

MarkdownPreview
Goyo && signifyToggle && Coc禁用
Pangu
vim-table-mode 进入模式，删除一列 <leader>tdc，左右居中刷新 TableModeRealign
加粗快捷键参考niceboy


### 内置终端

ALT + =: toggle terminal below.
ALT + -: paste register 0 to terminal.
ALT + q: switch to terminal normal mode.
内置终端可以直接drop打开文件
drop abc.txt


### 其他命令

Command
CocCommand
Maps
Marks
coc的寄存器列表nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
/历史 c-f/
:历史 c-f:

翻译插件
配置ycm

### 快速跳转

C-f + 俩字母跳转

### 特殊开关

tags自动生成开关
写作模式开关


文件、文本搜索
gtags，leaderf，gutentags,preview,coc
markdown
git
menu
todo
其他命令
其他插件不带映射的
