"——————————————————————————————————————————————————————————————————
" Title: vim config for windows
" Last Modified: 2020/03/29 18:26:34
"——————————————————————————————————————————————————————————————————

" 防止重复加载
if get(s:, 'loaded', 0) != 0
    finish
else
    let s:loaded = 1
endif

" 取得本文件所在的目录
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')
function! GetVimPath(path)
    let path = expand(s:home . '/' . a:path )
    return substitute(path, '\\', '/', 'g')
endfunc

" 定义一个命令用来加载文件
command! -nargs=1 LoadScript exec 'so '.s:home.'/'.'<args>'
" 将 vim-init 目录加入 runtimepath
exec 'set rtp+='.s:home
" 将 ~/.vim 目录加入 runtimepath (有时候 vim 不会自动帮你加入）
set rtp+=~/.vim

"——————————————————————————————————————————————————————————————————
" Title: windows专属配置
"——————————————————————————————————————————————————————————————————

set guifont=SauceCodePro_Nerd_Font_Mono:h12:cANSI:qDRAFT
"设置半透明
" au GUIEnter * call libcallnr("vimtweak.dll", "SetAlpha", 240)
"设置初始工作路径
exec 'cd ' . fnameescape('E:/')
"启动位置
winpos 0 0
"设置默认窗口大小
set lines=103 columns=179
"共享剪贴板
set clipboard+=unnamed

let g:todo_filepath='E:/my.todo'



"----------------------------------------------------------------------
" 模块加载
"----------------------------------------------------------------------

" 修改iskeyword, verbose判断谁修改了
LoadScript init/init-basic.vim
LoadScript init/init-config.vim
LoadScript init/init-style.vim

call plug#begin(get(g:, 'bundle_home', '~/.vim/bundles'))
    LoadScript init/enhance-basic.vim
    LoadScript init/enhance-format.vim
    LoadScript init/enhance-search.vim
    " LoadScript init/enhance-symbol.vim
    LoadScript init/enhance-lint.vim
    LoadScript init/enhance-ui.vim
    LoadScript init/enhance-markdown.vim
    LoadScript init/git.vim
    " LoadScript init/coc.vim
    LoadScript init/sidebar.vim
    " LoadScript init/ycm.vim
    " LoadScript init/gutentags.vim
    LoadScript init/special.vim
    LoadScript init/leaderf.vim
    LoadScript init/gist.vim
    LoadScript init/tasks.vim


call plug#end()

LoadScript init/keymaps-for-basic.vim
LoadScript init/keymaps-for-plugin.vim
LoadScript init/menu.vim

" colorscheme onedark
" colorscheme OceanicNext
colorscheme molokai
" colorscheme PaperColor
" colorscheme codedark
" colorscheme xcodedark
" colorscheme gruvbox
" colorscheme space_vim_theme
" colorscheme atom-dark-256
"——————————————————————————————————————————————————————————————————
" Title: 去掉Signify的背景色
"——————————————————————————————————————————————————————————————————
highlight SignifySignAdd    ctermfg=green  guifg=#00ff00 cterm=NONE gui=NONE
highlight SignifySignDelete ctermfg=red    guifg=#ff0000 cterm=NONE gui=NONE
highlight SignifySignChange ctermfg=yellow guifg=#ffff00 cterm=NONE gui=NONE
