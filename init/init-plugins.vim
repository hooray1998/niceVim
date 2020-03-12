"======================================================================
"
" init-plugins.vim -
"
" Created by skywind on 2018/05/31
" Last Modified: 2018/06/10 23:11
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :
"----------------------------------------------------------------------
" 默认情况下的分组，可以再前面覆盖之
"----------------------------------------------------------------------
let g:bundle_group = ['basic', 'filetypes', 'textobj', 'markdown', 'git']
let g:bundle_group += ['perfect']
let g:bundle_group += ['enhanced']
let g:bundle_group += ['optimize']
" let g:bundle_group += ['gutentags']
" let g:bundle_group += ['echodoc']

"----------------------------------------------------------------------
" 计算当前 vim-init 的子路径
"----------------------------------------------------------------------
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')
function! GetPath(path)
    let path = expand(s:home . '/' . a:path )
    return substitute(path, '\\', '/', 'g')
endfunc
"----------------------------------------------------------------------
" 在 ~/.vim/bundles 下安装插件
"----------------------------------------------------------------------
call plug#begin(get(g:, 'bundle_home', '~/.vim/bundles'))

Plug 'ryanoasis/vim-devicons'



Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'

Plug 'skywind3000/vim-auto-popmenu'
Plug 'skywind3000/vim-dict'
" enable this plugin for filetypes, '*' for all files.
let g:apc_enable_ft = {'text':1, 'markdown':1}

" source for dictionary, current or other loaded buffers, see ':help cpt'
set cpt=.,k,w,b

" don't select the first item.
set completeopt=menu,menuone,noselect

" suppress annoy messages.
set shortmess+=c


Plug 'gpanders/vim-medieval'
" Plug 'hy172574895/EasyCompleteYou'
" Plug 'https://gitee.com/Jimmy_Huang/ECY-dictionary'


" TODO: 使用方法写出来，怕忘
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

let g:VM_default_mappings = 0
let g:VM_maps = {}
let g:VM_maps['Find Under']  = '<M-n>'
let g:VM_maps['Find Subword Under'] = '<M-n>'

Plug 'Krasjet/auto.pairs'
let g:AutoPairsShortcutJump = ''
Plug 'Yggdroot/hiPairs'
"Plug 'terryma/vim-multiple-cursors'
" 全文快速移动，c-f{char} 即可触发
Plug 'kkoomen/vim-doge'
Plug 'arzg/vim-colors-xcode'
Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'
let g:lens#disabled_filetypes = ['nerdtree', 'fzf', 'leaderf', 'vista', 'undotree', 'diff', 'coc-explorer']

if index(g:bundle_group, 'markdown') >= 0
    " TODO:注释掉syntax目录才能正确高亮
    Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
    " 自动预览
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': 'markdown' }
    " 数学公式支持
    Plug 'iamcco/mathjax-support-for-mkdp', { 'for': 'markdown' }
    " 表格对齐，使用命令 Tabularize
    Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
    " 中文文档美化
    Plug 'hotoo/pangu.vim', { 'for': 'markdown' }
    " 专注模式
    Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
    "autocmd! User goyo.vim echom 'Goyo is now loaded!'
    " 表格模式
    Plug 'dhruvasagar/vim-table-mode', { 'for': ['markdown','vim']}
endif
"----------------------------------------------------------------------
" 基础插件
"----------------------------------------------------------------------
if index(g:bundle_group, 'basic') >= 0

    Plug 'mhinz/vim-startify'
    Plug 'easymotion/vim-easymotion'
    " 一次性安装一大堆 colorscheme
    Plug 'flazz/vim-colorschemes'
    Plug 'joshdick/onedark.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " 支持库，给其他插件用的函数库
    Plug 'xolox/vim-misc'
    " 用于在侧边符号栏显示 marks （ma-mz 记录的位置）
    Plug 'kshenoy/vim-signature'
    " 文件浏览器，代替 netrw
    Plug 'justinmk/vim-dirvish'
    Plug 'skywind3000/quickmenu.vim'
    Plug 'skywind3000/vim-terminal-help'
    " let g:terminal_default_mapping=1
    " unmap <m-P>
    " tunmap <m-P>
    Plug 'brglng/vim-sidebar-manager'
    Plug 'mbbill/undotree'
    Plug 'liuchengxu/vista.vim'
    "Plug 'scrooloose/nerdtree', {'on': ['NERDTree', 'NERDTreeFocus', 'NERDTreeToggle', 'NERDTreeCWD', 'NERDTreeFind'] }
    "Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
endif
"----------------------------------------------------------------------
" 增强插件
"----------------------------------------------------------------------
if index(g:bundle_group, 'git') >= 0
    " 用于在侧边符号栏显示 git/svn 的 diff
    Plug 'mhinz/vim-signify'
    " Diff 增强，支持 histogram / patience 等更科学的 diff 算法
    Plug 'chrisbra/vim-diff-enhanced'
    " Git 支持
    Plug 'tpope/vim-fugitive'
endif

if index(g:bundle_group, 'optimize') >= 0
    " 自动格式化
    Plug 'Chiel92/vim-autoformat'
    " 快速代码注释
    Plug 'scrooloose/nerdcommenter'
    let NERDSpaceDelims = 1
    let NERDRemoveExtraSpaces = 1
    let NERDTrimTrailingWhitespace = 1
    noremap <silent> <m-a> :call NERDComment("n", "Toggle")<CR>
    " 根据 quickfix 中匹配到的错误信息，高亮对应文件的错误行
    " 使用 :RemoveErrorMarkers 命令或者 <space>ha 清除错误
    Plug 'mh21/errormarker.vim'
endif

if index(g:bundle_group, 'enhanced') >= 0
    " 用 v 选中一个区域后，ALT_+/- 按分隔符扩大/缩小选区
    Plug 'terryma/vim-expand-region'
    map <m-=> <Plug>(expand_region_expand)
    map <m--> <Plug>(expand_region_shrink)
    Plug 'honza/vim-snippets'
    " 快速文件搜索
    Plug 'junegunn/fzf', { 'do': './install --bin' }
    Plug 'junegunn/fzf.vim'
    " 使用 :CtrlSF 命令进行模仿 sublime 的 grep
    Plug 'dyng/ctrlsf.vim'
    " 提供 gist 接口
    "Plug 'lambdalisue/vim-gista', { 'on': 'Gista' }
    "Plug 'mattn/webapi-vim'
    "Plug 'mattn/vim-gist'
    " ALT_+/- 用于按分隔符扩大缩小 v 选区
endif
"----------------------------------------------------------------------
" 自动生成 ctags/gtags，并提供自动索引功能
" 不在 git/svn 内的项目，需要在项目根目录 touch 一个空的 .root 文件
" 详细用法见：https://zhuanlan.zhihu.com/p/36279445
"----------------------------------------------------------------------
if index(g:bundle_group, 'gutentags') >= 0
    " 提供基于 TAGS 的定义预览，函数参数预览，quickfix 预览
    Plug 'skywind3000/vim-preview'
    " 提供 ctags/gtags 后台数据库自动更新功能
    "Plug 'ludovicchabant/vim-gutentags', { 'for': ['c', 'cpp']  }
    Plug 'ludovicchabant/vim-gutentags'
    " 提供 GscopeFind 命令并自动处理好 gtags 数据库切换
    "Plug 'skywind3000/gutentags_plus', { 'for': ['c', 'cpp'] }
    Plug 'skywind3000/gutentags_plus'
endif
"----------------------------------------------------------------------
" 文本对象：textobj 全家桶
"----------------------------------------------------------------------
if index(g:bundle_group, 'textobj') >= 0
    " 基础插件：提供让用户方便的自定义文本对象的接口
    Plug 'kana/vim-textobj-user'
    " indent 文本对象：ii/ai 表示当前缩进，vii 选中当缩进，cii 改写缩进
    Plug 'kana/vim-textobj-indent'
    " 语法文本对象：iy/ay 基于语法的文本对象
    Plug 'kana/vim-textobj-syntax'
    " 函数文本对象：if/af 支持 c/c++/vim/java
    Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
    " 参数文本对象：i,/a, 包括参数或者列表元素
    Plug 'sgur/vim-textobj-parameter'
    " 提供 python 相关文本对象，if/af 表示函数，ic/ac 表示类
    Plug 'bps/vim-textobj-python', {'for': 'python'}
    " 提供 uri/url 的文本对象，iu/au 表示
    Plug 'jceb/vim-textobj-uri'
endif
"----------------------------------------------------------------------
" 文件类型扩展
"----------------------------------------------------------------------
if index(g:bundle_group, 'filetypes') >= 0
    " powershell 脚本文件的语法高亮
    Plug 'pprovost/vim-ps1', { 'for': 'ps1' }
    " lua 语法高亮增强
    Plug 'tbastos/vim-lua', { 'for': 'lua' }
    " C++ 语法高亮增强，支持 11/14/17 标准
    Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }
    " 额外语法文件
    Plug 'justinmk/vim-syntax-extra', { 'for': ['c', 'bison', 'flex', 'cpp'] }
    " python 语法文件增强
    Plug 'vim-python/python-syntax', { 'for': ['python'] }
    " rust 语法增强
    Plug 'rust-lang/rust.vim', { 'for': 'rust' }
    " vim org-mode
    Plug 'jceb/vim-orgmode', { 'for': 'org' }
endif

if index(g:bundle_group, 'perfect') >= 0
    Plug 'w0rp/ale'
    Plug 'Yggdroot/LeaderF'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif
" Plug 'ianding1/leetcode.vim'
"----------------------------------------------------------------------
" echodoc：搭配 YCM/deoplete 在底部显示函数参数
"----------------------------------------------------------------------
if index(g:bundle_group, 'echodoc') >= 0
    Plug 'Shougo/echodoc.vim'
    set noshowmode
    let g:echodoc#enable_at_startup = 1
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    let g:deoplete#enable_at_startup = 1
endif
"----------------------------------------------------------------------
" 结束插件安装
"----------------------------------------------------------------------
call plug#end()

function! s:lf_task_source(...)
	let rows = asynctasks#source(&columns * 48 / 100)
	let source = []
	for row in rows
		let name = row[0]
		let source += [name . '  ' . row[1] . '  : ' . row[2]]
	endfor
	return source
endfunction


function! s:lf_task_accept(line, arg)
	let pos = stridx(a:line, '<')
	if pos < 0
		return
	endif
	let name = strpart(a:line, 0, pos)
	let name = substitute(name, '^\s*\(.\{-}\)\s*$', '\1', '')
	if name != ''
		exec "AsyncTask " . name
	endif
endfunction

function! s:lf_task_digest(line, mode)
	let pos = stridx(a:line, '<')
	if pos < 0
		return [a:line, 0]
	endif
	let name = strpart(a:line, 0, pos)
	return [name, 0]
endfunction

function! s:lf_win_init(...)
	setlocal nonumber
	setlocal nowrap
endfunction


let g:Lf_Extensions = get(g:, 'Lf_Extensions', {})
let g:Lf_Extensions.task = {
			\ 'source': string(function('s:lf_task_source'))[10:-3],
			\ 'accept': string(function('s:lf_task_accept'))[10:-3],
			\ 'get_digest': string(function('s:lf_task_digest'))[10:-3],
			\ 'highlights_def': {
			\     'Lf_hl_funcScope': '^\S\+',
			\     'Lf_hl_funcDirname': '^\S\+\s*\zs<.*>\ze\s*:',
			\ },
		\ }

    function! StartifyEntryFormat()
        return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
    endfunction

let g:airline_powerline_fonts=1
