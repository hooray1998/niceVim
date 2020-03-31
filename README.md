# NiceVim文档

## 环境配置

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

```sh
npm i -g bash-language-server
npm i -g tldr (.tldr压缩打包)
```

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
wget http://tamacom.com/global/global-6.6.4.tar.gz
tar xvf global-6.6.4.tar.gz
cd global-6.6.4
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

```sh
npm i -g fd-find
zypper install fd
install rg
```

### 配置文件汇总

1. coc.config文件
2. python配置
3. go
4. .config中coc的配置
5. 管理个人片段

### 进入NeoVim

```sh
:PlugInstall
Leaderf编译c扩展
```

## QuickStart

### 文件/文本搜索

| 命令  | 功能                           |
|-------|--------------------------------|
| `C-p` | fzf搜索当前项目管理文件(GFile) |
| `C-n` | 搜索最近文件                   |
| `m-/` | 搜索当前文件                   |
| `m-?` | 搜索所有Buffer                 |

**Ctrl-t 在tab中打开**

### 递归搜索文本

| `A-*`    | 搜索当前单词   |
| `Rg`     | Leaderf rg搜索 |
| `CtrlSF` | 搜索文本       |

### 文本对象

| 文本对象     | 命令  | 备注                                       |
|--------------|-------|--------------------------------------------|
| 缩进文本对象 | ii/ai | 表示当前缩进，vii 选中当缩进，cii 改写缩进 |
| 语法文本对象 | iy/ay | 基于语法的文本对象                         |
| 函数文本对象 | if/af | 支持 c/c++/vim/java/python                 |
| 参数文本对象 | i,/a, | 包括参数或者列表元素                       |
| uri/url对象  | iu/au | 表示                                       |

### 符号搜索

| 命令   | 功能                              |
|--------|-----------------------------------|
| `A-2`  | 显示符号列表                      |
| `m-m`  | 搜索函数                          |
| `m-p`  | 搜索符号                          |
| `m-P`  | 搜索全局符号                      |
| `F3`   | 搜索当前符号并右侧预览A-d,A-u翻动 |
| `K/F4` | 显示函数签名或帮助                |

### 注释,代码美化

| 命令       | 功能       |
|------------|------------|
| Alt-Space  | 代码格式化 |
| Alt-Enter  | 代码修复   |
| AutoFormat | 全文格式化 |

设置正确的wrap 和 paste  pastetoggle

### 定义和引用

| 命令         | 功能                                  |
|--------------|---------------------------------------|
| `gd`         | 查看光标下符号的定义                  |
| `gr`         | 查看光标下符号的引用                  |
| `S-gc`       | 查看有哪些函数调用了该函数,跟引用类似 |
| `S-gt`       | 查找光标下文本                        |
| `S-ge`       | 查找光标下文本正则                    |
| `<leader>gf` | 查找光标下的文件                      |
| `<leader>gi` | 查找哪些文件 include 了本文件         |

### 窗口管理

| 命令         | 功能          |
|--------------|---------------|
| S+ 1~n       | Tab跳转       |
| Alt + 1      | coc文件管理器 |
| Alt + 2      | 符号列表      |
| Alt + 3      | Undo历史      |
| Alt + 7      | Todo显示      |
| Alt + 8-0    | 帮助菜单      |
| SSave! +name | 会话保存      |

### Git

#### 文件内命令

| 命令       | 功能                                                       |
| ---------- | --------------------------------------------               |
| Gblame     | 查看每行的最新修改是什么时候(p预览commit,-进入光标下的版本 |
| Gwrite     | 增加到暂存区(git add)                                      |
| Gvdiff     | 与最近的提交比较                                           |
| Gread      | 放弃修改恢复到最近的一次提交或暂存区的内容                 |
| Gmove      | 移除文件并重命名缓存区                                     |
| Ggrep      | 搜索git文件                                                |
| BCommits   | 查看当前文件所有提交                                       |

#### Git界面按键映射(:G进入)

| Map   | Des                      |
|-------|--------------------------|
| CR    | 进入文件                 |
| -/s/u | 暂存/取消暂存            |
| U     | 全部取消暂存             |
| X     | 丢弃修改checkout/clean   |
| =     | 快速查看/关闭diff        |
| dd    | **新标签页对比查看diff** |
| cc    | 提交                     |
| ca    | 追加修改                 |
| gI    | 进入ignore文件           |
| Gclog | 查看某些文件的提交记录   |

### Markdown

- MarkdownPreview
- Goyo && signifyToggle && Coc禁用
- Pangu

### 内置终端

| 命令         | 功能          |
|--------------|---------------|
|ALT + =|toggle terminal below.|
|ALT + -|paste register 0 to terminal.|
|ALT + q|switch to terminal normal mode.|
|drop abc.txt|直接drop打开文件|

### 其他命令

| 命令      | 功能       |
|-----------|------------|
| A-;       | Command    |
| A-:       | CocCommand |
| A-M       | Maps       |
| mm        | Marks      |
| M-y       | 寄存器历史 |
| c-f/      | /历史      |
| c-f:      | :历史      |
| 可视模式f | 翻译       |
| C-f{char} | 快速跳转   |
| F12       | 专注模式   |

### 本地Gist

| 命令 | 功能     |
|------|----------|
| c-n  | 创建gist |
| Gist | 搜索gist |

### surround

### task工具

### fzf命令行工具

### fzf重写很多命令行函数

### unimpaired.vim

q|quickfix
l|location
j/b|buffer
f|file
c|git diff
g|warn
<space>|add newline

### tldr使用

```sh
echo tell awk
```

### nvim-qt

**nvim_gui_shim.vim 最后加入该行,取消tabline**
```vim
call rpcnotify(0, 'Gui', 'Option', 'Tabline', 0)
```
