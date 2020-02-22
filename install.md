# fasdf

:PlugInstall

```sh
install anaconda3
pip install neovim
pip install pylint(python 语法检查)
pip install pygments (配合gtags)

npm i -g fd-find
zypper in fd
```

wget https://dl.google.com/go/go1.11.5.linux-amd64.tar.gz
tar xvf go1.11.5.linux-amd64.tar.gz -C .local/
加上go的环境变量
go　get github.com:efm-lsp
加上efm的环境变量
拷贝yaml文件

coc.config文件


gtags 安装

wget https://ftp.gnu.org/pub/gnu/global/global-6.6.tar.gz
tar xvf global-6.6.tar.gz
cd global-6.6
./configure --with-sqlite3
make -j4
sudo make install

checkhealth



# 文档

Space-s + 两个字符 | 快速移动
EnhanceDiff   |Diff增强
- |文件管理器
<space>nt | 文件树


    " 根据 quickfix 中匹配到的错误信息，高亮对应文件的错误行
    " 使用 :RemoveErrorMarkers 命令或者 <space>ha 清除错误
    " 提供基于 TAGS 的定义预览，函数参数预览，quickfix 预览
    Plug 'skywind3000/vim-preview'

文本搜索使用


## 文本对象
    " 基础插件：提供让用户方便的自定义文本对象的接口
    " indent 文本对象：ii/ai 表示当前缩进，vii 选中当缩进，cii 改写缩进
    " 语法文本对象：iy/ay 基于语法的文本对象
    " 函数文本对象：if/af 支持 c/c++/vim/java
    " 参数文本对象：i,/a, 包括参数或者列表元素
    " 提供 python 相关文本对象，if/af 表示函数，ic/ac 表示类
    " 提供 uri/url 的文本对象，iu/au 表示

## 文件/符号搜索

        " CTRL+p 打开文件模糊匹配
        let g:Lf_ShortcutF = '<leader>f'

        " ALT+n 打开 buffer 模糊匹配
        let g:Lf_ShortcutB = '<leader>g'

        " CTRL+n 打开最近使用的文件 MRU，进行模糊匹配
        noremap <c-n> :LeaderfMru<cr>

        " ALT+p 打开函数列表，按 i 进入模糊匹配，ESC 退出
        noremap <m-p> :LeaderfFunction!<cr>

        " ALT+SHIFT+p 打开 tag 列表，i 进入模糊匹配，ESC退出
        noremap <m-P> :LeaderfBufTag!<cr>

        " ALT+m 全局 tags 模糊匹配
        noremap <m-m> :LeaderfTag<cr>

## 注释,代码美化


## markdown


根据文件设置不同的规则



设置正确的wrap 和 paste  pastetoggle

menu的问题参考连接的其他文件
https://github.com/skywind3000/vim/blob/master/asc/menu.vim


## 安装ctags, gtags

sudo apt install automake autoconf libtool
./autogen.sh
./configure --prefix=/home/itt/.local
make
make install # may require extra privileges depending on where to install

## 定义和引用

gutentags_plus.vim 的小脚本做这个事，直接用里面的 GscopeFind 命令，像 cs find 一样用就行了。

搭配 gutentags，这个脚本在你每次 GscopeFind 前帮你处理数据库加载问题，已经加载过的数据库不会重复加载，非本项目的数据库会得到即时清理，所以你根本感觉不到 gtags 的存在，只管始用 GscopeFind g 命令查找定义，GscopeFind s 命令查找引用，


这个小脚本末尾还还定义了一系列快捷键：

<leader>cg - 查看光标下符号的定义
<leader>cs - 查看光标下符号的引用
<leader>cc - 查看有哪些函数调用了该函数
<leader>cf - 查找光标下的文件
<leader>ci - 查找哪些文件 include 了本文件


TODO: 支持c,cpp,python,go,lua,java就行


gutentags_plus取消支持markdown



## 定义引用

:PreviewTag连续按可以连续切换
:PreviewGoto [tabe|edit]进入编辑
M-u M-d 上下预览
C-w z 删除预览窗口

**如果在quickfix窗口中,  按p预览,P关闭, M-u/d 上下移动 Enter进入编辑**


## 查看

## 补全插件coc

```python
if you
print("fasd")
```



## 配置 leaderf rg的用法
alt-*

## 菜单栏清晰一点

3. 翻译插件

1. 开始显示todo
    1. git
    2. session
    3. mru dir
    4. command
    5. 删除名言
    显示两列



配置markdown

配置coclist的其他用法
npm i -g bash-language-server

配置ycm
离线词典
