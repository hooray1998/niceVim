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
if !exists('g:bundle_group')
    let g:bundle_group = ['basic', 'enhanced', 'filetypes', 'textobj']
    let g:bundle_group += ['tags', 'airline', 'nerdtree', 'ale']
    let g:bundle_group += ['leaderf', 'menu', 'startify']
    let g:bundle_group += ['markdown']

endif


"----------------------------------------------------------------------
" 计算当前 vim-init 的子路径
"----------------------------------------------------------------------
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')

function! s:path(path)
    let path = expand(s:home . '/' . a:path )
    return substitute(path, '\\', '/', 'g')
endfunc


"----------------------------------------------------------------------
" 在 ~/.vim/bundles 下安装插件
"----------------------------------------------------------------------
call plug#begin(get(g:, 'bundle_home', '~/.vim/bundles'))
"Plug 'terryma/vim-multiple-cursors'
"Plug 'ryanoasis/vim-devicons'
Plug 'dhruvasagar/vim-table-mode', { 'for': 'markdown'}
Plug 'skywind3000/vim-terminal-help'
"Plug 'arzg/vim-colors-xcode'
Plug 'brglng/vim-sidebar-manager'
Plug 'mbbill/undotree'
Plug 'liuchengxu/vista.vim'
if has("persistent_undo")
    set undodir=$HOME/.undodir
    set undofile
endif
let g:vista_sidebar_position = 'vertical topleft'
let g:vista_sidebar_width = 40
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_SplitWidth = 40

let g:sidebars = {
  \ 'coc-explorer': {
  \     'position': 'left',
  \     'check_win': {nr -> getwinvar(nr, '&filetype') ==# 'coc-explorer'},
  \     'open': 'CocCommand explorer --no-toggle',
  \     'close': 'CocCommand explorer --toggle'
  \ },
  \ 'vista': {
  \     'position': 'right',
  \     'check_win': {nr -> bufname(winbufnr(nr)) =~ '__vista__'},
  \     'open': 'Vista',
  \     'close': 'Vista!'
  \ },
  \ 'undotree': {
  \     'position': 'left',
  \     'check_win': {nr -> getwinvar(nr, '&filetype') ==# 'undotree'},
  \     'open': 'UndotreeShow',
  \     'close': 'UndotreeHide'
  \ }
  \ }

noremap <silent> <M-1> :call sidebar#toggle('coc-explorer')<CR>
noremap <silent> <M-2> :call sidebar#toggle('vista')<CR>
noremap <silent> <M-3> :call sidebar#toggle('undotree')<CR>
let g:startify_session_before_save = ['call sidebar#close_all()']
"----------------------------------------------------------------------
" 默认插件
"----------------------------------------------------------------------

"Plug 'irrationalistic/vim-tasks'
autocmd BufNewFile,BufReadPost *.TODO,TODO,*.todo,*.todolist,*.taskpaper,*.tasks set filetype=tasks
Plug 'skywind3000/quickmenu.vim'

" 全文快速移动，<leader><leader>f{char} 即可触发
Plug 'easymotion/vim-easymotion'
nmap <C-f> <Plug>(easymotion-s2)

" 文件浏览器，代替 netrw
Plug 'justinmk/vim-dirvish'
" 表格对齐，使用命令 Tabularize
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }

" Diff 增强，支持 histogram / patience 等更科学的 diff 算法
Plug 'chrisbra/vim-diff-enhanced'
autocmd VimEnter * EnhancedDiff histogram

"----------------------------------------------------------------------
" Dirvish 设置：自动排序并隐藏文件，同时定位到相关文件
" 这个排序函数可以将目录排在前面，文件排在后面，并且按照字母顺序排序
" 比默认的纯按照字母排序更友好点。
"----------------------------------------------------------------------
function! s:setup_dirvish()
    if &buftype != 'nofile' && &filetype != 'dirvish'
        return
    endif
    if has('nvim')
        return
    endif
    " 取得光标所在行的文本（当前选中的文件名）
    let text = getline('.')
    if ! get(g:, 'dirvish_hide_visible', 0)
        exec 'silent keeppatterns g@\v[\/]\.[^\/]+[\/]?$@d _'
    endif
    " 排序文件名
    exec 'sort ,^.*[\/],'
    let name = '^' . escape(text, '.*[]~\') . '[/*|@=|\\*]\=\%($\|\s\+\)'
    " 定位到之前光标处的文件
    call search(name, 'wc')
    noremap <silent><buffer> ~ :Dirvish ~<cr>
    noremap <buffer> % :e %
endfunc

augroup MyPluginSetup
    autocmd!
    autocmd FileType dirvish call s:setup_dirvish()
augroup END

if index(g:bundle_group, 'markdown') >= 0
    " 注释掉syntax目录才能正确高亮
    Plug 'plasticboy/vim-markdown'
    "Plug 'iamcco/markdown-preview.nvim'
    " If you don't have nodejs and yarn
    " use pre build
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
    Plug 'iamcco/mathjax-support-for-mkdp'

    Plug 'hotoo/pangu.vim'
    Plug 'junegunn/goyo.vim'
    Plug 'Chiel92/vim-autoformat'
    "Plug 'amix/vim-zenroom2'
endif
"----------------------------------------------------------------------
" 基础插件
"----------------------------------------------------------------------
if index(g:bundle_group, 'basic') >= 0


    " 快速代码注释
    Plug 'scrooloose/nerdcommenter'
    noremap <silent> <m-a> :call NERDComment("n", "Toggle")<CR>

    " 一次性安装一大堆 colorscheme
    Plug 'flazz/vim-colorschemes'
    Plug 'joshdick/onedark.vim'

    " 支持库，给其他插件用的函数库
    Plug 'xolox/vim-misc'

    " 用于在侧边符号栏显示 marks （ma-mz 记录的位置）
    Plug 'kshenoy/vim-signature'

    " 用于在侧边符号栏显示 git/svn 的 diff
    Plug 'mhinz/vim-signify'



    " 根据 quickfix 中匹配到的错误信息，高亮对应文件的错误行
    " 使用 :RemoveErrorMarkers 命令或者 <space>ha 清除错误
    Plug 'mh21/errormarker.vim'

    " 提供基于 TAGS 的定义预览，函数参数预览，quickfix 预览
    Plug 'skywind3000/vim-preview'
    set switchbuf=newtab "新的tab打开预览项
    autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
    autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
    autocmd FileType qf nnoremap <silent><buffer> <Enter> :PreviewClose<cr><CR>
    noremap <m-u> :PreviewScroll -1<cr>
    noremap <m-d> :PreviewScroll +1<cr>
    inoremap <m-u> <c-\><c-o>:PreviewScroll -1<cr>
    inoremap <m-d> <c-\><c-o>:PreviewScroll +1<cr>
    " 符号预览
    noremap <F3> :PreviewTag<cr>
    inoremap <F3> <c-\><c-o>:PreviewTag<cr>
    " 函数参数
    noremap <F4> :PreviewSignature!<cr>
    inoremap <F4> <c-\><c-o>:PreviewSignature!<cr>

    " Git 支持
    Plug 'tpope/vim-fugitive'

    " 使用 ALT+E 来选择窗口
    nmap <m-e> <Plug>(choosewin)

    " 默认不显示 startify
    let g:startify_disable_at_vimenter = 0
    let g:startify_session_dir = '~/.vim/session'

    " 使用 <space>ha 清除 errormarker 标注的错误
    noremap <silent><space>ha :RemoveErrorMarkers<cr>

    " signify 调优
    let g:signify_vcs_list = ['git', 'svn']
    let g:signify_sign_add               = '+'
    let g:signify_sign_delete            = '_'
    let g:signify_sign_delete_first_line = '‾'
    let g:signify_sign_change            = '~'
    let g:signify_sign_changedelete      = g:signify_sign_change
    let g:signify_skip_filetype = { 'startify': 1 , 'tasks': 1 }

    " git 仓库使用 histogram 算法进行 diff
    let g:signify_vcs_cmds = {
                \ 'git': 'git diff --no-color --diff-algorithm=histogram --no-ext-diff -U0 -- %f',
                \}
endif


"----------------------------------------------------------------------
" 增强插件
"----------------------------------------------------------------------
if index(g:bundle_group, 'enhanced') >= 0

    " 用 v 选中一个区域后，ALT_+/- 按分隔符扩大/缩小选区
    Plug 'terryma/vim-expand-region'

    " 快速文件搜索
    Plug 'junegunn/fzf', { 'do': './install --bin' }
    Plug 'junegunn/fzf.vim'
    " 给不同语言提供字典补全，插入模式下 c-x c-k 触发
    Plug 'asins/vim-dict'

    " 使用 :FlyGrep 命令进行实时 grep
    Plug 'wsdjeg/FlyGrep.vim'

    " 使用 :CtrlSF 命令进行模仿 sublime 的 grep
    Plug 'dyng/ctrlsf.vim'

    " 配对括号和引号自动补全
    "Plug 'Raimondi/delimitMate'

    " 提供 gist 接口
    "Plug 'lambdalisue/vim-gista', { 'on': 'Gista' }
    "Plug 'mattn/webapi-vim'
    "Plug 'mattn/vim-gist'

    " ALT_+/- 用于按分隔符扩大缩小 v 选区
    map <m-=> <Plug>(expand_region_expand)
    map <m--> <Plug>(expand_region_shrink)
endif


"----------------------------------------------------------------------
" 自动生成 ctags/gtags，并提供自动索引功能
" 不在 git/svn 内的项目，需要在项目根目录 touch 一个空的 .root 文件
" 详细用法见：https://zhuanlan.zhihu.com/p/36279445
"----------------------------------------------------------------------
if index(g:bundle_group, 'tags') >= 0

    " 提供 ctags/gtags 后台数据库自动更新功能
    Plug 'ludovicchabant/vim-gutentags'
    let g:gutentags_define_advanced_commands = 1 "启用更多功能
    let g:gutentags_enabled = 0 " 使用GutentagsToggleEnable启用
    let g:gutentags_dont_load = 0
    let $GTAGSLABEL = 'native-pygments'
    let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'

    " 提供 GscopeFind 命令并自动处理好 gtags 数据库切换
    " 支持光标移动到符号名上：<leader>cg 查看定义，<leader>cs 查看引用
    Plug 'skywind3000/gutentags_plus'
    let g:gutentags_plus_nomap = 1

    " 如果只有一个结果,使用C-g快速跳转
    noremap <silent> <C-g> :cclose<CR>:cn<CR>

    noremap <silent> <space>gs :GscopeFind s <C-R><C-W><cr>
    noremap <silent> <space>gg :GscopeFind g <C-R><C-W><cr>
    noremap <silent> <space>gd :GscopeFind d <C-R><C-W><cr>
    noremap <silent> <space>gc :GscopeFind c <C-R><C-W><cr>
    noremap <silent> <space>gt :GscopeFind t <C-R><C-W><cr>
    noremap <silent> <space>ge :GscopeFind e <C-R><C-W><cr>
    noremap <silent> <space>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
    noremap <silent> <space>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
    noremap <silent> <space>ga :GscopeFind a <C-R><C-W><cr>
    "| `<leader>gs` | Find symbol (reference) under cursor |
    "| `<leader>gg` | Find symbol definition under cursor |
    "| `<leader>gd` | Functions called by this function |
    "| `<leader>gc` | Functions calling this function |
    "| `<leader>gt` | Find text string under cursor |
    "| `<leader>ge` | Find egrep pattern under cursor |
    "| `<leader>gf` | Find file name under cursor |
    "| `<leader>gi` | Find files #including the file name under cursor |
    "| `<leader>ga` | Find places where current symbol is assigned |

    " 设定项目目录标志：除了 .git/.svn 外，还有 .root 文件
    let g:gutentags_project_root = ['.root']

    " 默认生成的数据文件集中到 ~/.cache/tags 避免污染项目目录，好清理
    let g:gutentags_cache_dir = expand('~/.cache/tags')

    let g:gutentags_exclude_filetypes = ['json', 'markdown', 'txt', 'vim']
    " 默认禁用自动生成
    let g:gutentags_modules = []

    " 如果有 ctags 可执行就允许动态生成 ctags 文件
    if executable('ctags')
        let g:gutentags_modules += ['ctags']
    endif

    " 如果有 gtags 可执行就允许动态生成 gtags 数据库
    if executable('gtags') && executable('gtags-cscope')
        let g:gutentags_modules += ['gtags_cscope']
    endif

    " 设置 ctags 的参数
    let g:gutentags_ctags_tagfile = '.tags'
    let g:gutentags_ctags_extra_args = []
    let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
    let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
    let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

    " 使用 universal-ctags 的话需要下面这行，请反注释
    let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

    " 禁止 gutentags 自动链接 gtags 数据库
    let g:gutentags_auto_add_gtags_cscope = 1
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


"----------------------------------------------------------------------
" airline
"----------------------------------------------------------------------
if index(g:bundle_group, 'airline') >= 0
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_powerline_fonts = 0
    let g:airline_exclude_preview = 1
    let g:airline_section_b = '%n'
    let g:airline_theme='deus'
    let g:airline#extensions#branch#enabled = 0
    let g:airline#extensions#syntastic#enabled = 0
    let g:airline#extensions#fugitiveline#enabled = 0
    let g:airline#extensions#csv#enabled = 0
    let g:airline#extensions#vimagit#enabled = 0

    " 优化tab栏显示
    let g:airline_theme='onedark'
    let g:airline#extensions#tabline#show_buffers = 0
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
    let g:airline#extensions#tabline#tabs_label = 'Go'
    let g:airline#extensions#tabline#show_close_button = 0
    let g:airline#extensions#tabline#show_splits = 0
    let g:airline#extensions#tabline#show_tab_count = 1

endif
"----------------------------------------------------------------------
" NERDTree
"----------------------------------------------------------------------
if index(g:bundle_group, 'nerdtree') >= 0
    Plug 'scrooloose/nerdtree', {'on': ['NERDTree', 'NERDTreeFocus', 'NERDTreeToggle', 'NERDTreeCWD', 'NERDTreeFind'] }
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    let g:NERDTreeMinimalUI = 1
    let g:NERDTreeDirArrows = 1
    let g:NERDTreeHijackNetrw = 0
    let g:NERDTreeChDirMode=1
    let g:NERDTreeShowBookmarks=0
    let g:NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
    let g:NERDTreeWinSize=25
    noremap <space>nn :NERDTree<cr>
    noremap <space>no :NERDTreeFocus<cr>
    noremap <space>nm :NERDTreeMirror<cr>
    noremap <space>nt :NERDTreeToggle<cr>
endif


"----------------------------------------------------------------------
" ale：动态语法检查
"----------------------------------------------------------------------
if index(g:bundle_group, 'ale') >= 0
    Plug 'w0rp/ale'

    " 设定延迟和提示信息
    let g:ale_completion_delay = 500
    let g:ale_echo_delay = 20
    let g:ale_lint_delay = 500
    let g:ale_echo_msg_format = '[%linter%] %code: %%s'

    " 设定检测的时机：normal 模式文字改变，或者离开 insert模式
    " 禁用默认 INSERT 模式下改变文字也触发的设置，太频繁外，还会让补全窗闪烁
    let g:ale_lint_on_text_changed = 'normal'
    let g:ale_lint_on_insert_leave = 1

    " 在 linux/mac 下降低语法检查程序的进程优先级（不要卡到前台进程）
    if has('win32') == 0 && has('win64') == 0 && has('win32unix') == 0
        let g:ale_command_wrapper = 'nice -n5'
    endif

    " 允许 airline 集成
    let g:airline#extensions#ale#enabled = 1

    " 编辑不同文件类型需要的语法检查器
    let g:ale_linters = {
                \ 'c': ['gcc', 'cppcheck'],
                \ 'cpp': ['gcc', 'cppcheck'],
                \ 'python': ['flake8', 'pylint'],
                \ 'lua': ['luac'],
                \ 'go': ['go build', 'gofmt'],
                \ 'java': ['javac'],
                \ 'javascript': ['eslint'],
                \ }


    " 获取 pylint, flake8 的配置文件，在 vim-init/tools/conf 下面
    function! s:lintcfg(name)
        let conf = s:path('tools/conf/')
        let path1 = conf . a:name
        let path2 = expand('~/.vim/linter/'. a:name)
        if filereadable(path2)
            return path2
        endif
        return shellescape(filereadable(path2)? path2 : path1)
    endfunc

    " 设置 flake8/pylint 的参数
    let g:ale_python_flake8_options = '--conf='.s:lintcfg('flake8.conf')
    let g:ale_python_pylint_options = '--rcfile='.s:lintcfg('pylint.conf')
    let g:ale_python_pylint_options .= ' --disable=W'
    let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
    let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
    let g:ale_c_cppcheck_options = ''
    let g:ale_cpp_cppcheck_options = ''

    let g:ale_linters.text = ['textlint', 'write-good', 'languagetool']

    " 如果没有 gcc 只有 clang 时（FreeBSD）
    if executable('gcc') == 0 && executable('clang')
        let g:ale_linters.c += ['clang']
        let g:ale_linters.cpp += ['clang']
    endif
endif


"----------------------------------------------------------------------
" echodoc：搭配 YCM/deoplete 在底部显示函数参数
"----------------------------------------------------------------------
if index(g:bundle_group, 'echodoc') >= 0
    Plug 'Shougo/echodoc.vim'
    set noshowmode
    let g:echodoc#enable_at_startup = 1
endif


"----------------------------------------------------------------------
" LeaderF：CtrlP / FZF 的超级代替者，文件模糊匹配，tags/函数名 选择
"----------------------------------------------------------------------
if index(g:bundle_group, 'leaderf') >= 0
    " 如果 vim 支持 python 则启用  Leaderf
    if has('python') || has('python3')
        Plug 'Yggdroot/LeaderF'

        " CTRL+p 打开文件模糊匹配
        let g:Lf_ShortcutF = '<leader>f'

        " ALT+n 打开 buffer 模糊匹配
        let g:Lf_ShortcutB = '<leader>b'

        " CTRL+n 打开最近使用的文件 MRU，进行模糊匹配
        noremap <c-n> :LeaderfMru<cr>

        " ALT+p 打开函数列表，按 i 进入模糊匹配，ESC 退出
        "noremap <c-k> :LeaderfFunction<cr>

        " ALT+SHIFT+p 打开 tag 列表，i 进入模糊匹配，ESC退出
        "noremap <c-k> :LeaderfBufTag<cr>

        " ALT+m 全局 tags 模糊匹配
        noremap <m-m> :LeaderfTag<cr>

        noremap <m-*> :<C-U><C-R>=printf("Leaderf rg %s ", expand("<cword>"))<CR><CR>
        " 最大历史文件保存 2048 个
        let g:Lf_MruMaxFiles = 2048

        " ui 定制
        let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

        " 如何识别项目目录，从当前文件目录向父目录递归知道碰到下面的文件/目录
        let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
        let g:Lf_WorkingDirectoryMode = 'Ac'
        let g:Lf_WindowHeight = 0.30
        let g:Lf_CacheDirectory = expand('~/.vim/cache')

        " 显示绝对路径
        let g:Lf_ShowRelativePath = 0

        " 隐藏帮助
        let g:Lf_HideHelp = 1

        " 模糊匹配忽略扩展名
        let g:Lf_WildIgnore = {
                    \ 'dir': ['.svn','.git','.hg'],
                    \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
                    \ }

        " MRU 文件忽略扩展名
        let g:Lf_MruFileExclude = ['*.so', '*.exe', '*.py[co]', '*.sw?', '~$*', '*.bak', '*.tmp', '*.dll']
        let g:Lf_StlColorscheme = 'powerline'

        " 禁用 function/buftag 的预览功能，可以手动用 p 预览
        let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

        " 使用 ESC 键可以直接退出 leaderf 的 normal 模式
        let g:Lf_NormalMap = {
                    \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
                    \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<cr>']],
                    \ "Mru": [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<cr>']],
                    \ "Tag": [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<cr>']],
                    \ "BufTag": [["<ESC>", ':exec g:Lf_py "bufTagExplManager.quit()"<cr>']],
                    \ "Function": [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<cr>']],
                    \ }

    endif
endif

if index(g:bundle_group, 'startify') >= 0
    " 展示开始画面，显示最近编辑过的文件
    Plug 'mhinz/vim-startify'

    autocmd User Startified exec "vsplit /media/Document/my.todo \| set ft=tasks \| wincmd w"
    autocmd User Startified nmap <buffer> <leader>e :qa<CR>
    autocmd User StartifyBufferOpened silent execute "wincmd o"

    let g:startify_enable_special      = 0
    let g:startify_files_number        = 6
    let g:startify_relative_path       = 1

    let g:startify_skiplist = [
                \ 'COMMIT_EDITMSG',
                \ 'bundle/.*/doc',
                \ '/data/repo/neovim/runtime/doc',
                \ '/Users/mhi/local/vim/share/vim/vim74/doc',
                \ ]

    let g:startify_bookmarks = [
                \ { 'c': '~/.vim/vimrc' },
                \ '~/golfing',
                \ ]


    let g:startify_custom_footer =
                \ ['', "   撸起袖子加油干", '']

    let g:startify_lists = [
                \ { 'type': 'files',     'header': ['   MRU']            },
                \ { 'type': 'sessions',  'header': ['   Sessions']       },
                \ { 'type': 'commands',  'header': ['   Commands']       },
                \ ]
                "\ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },

    let g:startify_custom_indices = map(range(1,100), 'string(v:val)')
    let g:startify_custom_header_quotes = [
                \ {-> systemlist('shuf -n2 $HOME/quote.list')}
                \ ]

    let g:startify_commands = [
                \ {'n': ['history', 'LeaderfMru']},
                \ {'f': ['files', 'LeaderfFile']},
                \ {'c': ['commands', 'Commands']},
                \ {'g': ['git status', 'vertical topleft G | vertical resize -35']},
                \ {'v': ['vim config', 'e ~/.vim/niceVim/init.vim']},
                \ {'m': ['map config', 'e ~/.vim/niceVim/init/init-keymaps.vim']},
                \ {'p': ['plugin config', ':e ~/.vim/niceVim/init/init-plugins.vim']},
                \ ]
endif

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" 括号配对后cr增强
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
				\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
autocmd FileType markdown let b:coc_pairs_disabled = ['`']

Plug 'honza/vim-snippets'
Plug 'voldikss/vim-translator'
"let g:translator_target_lang = 'zh'
"let g:translator_source_lang = 'auto'
"let g:translator_default_engines = ['ciba', 'youdao']
let g:translator_history_enable = v:true
"let g:translator_proxy_url = 'socks5://127.0.0.1:1080'
"----------------------------------------------------------------------
" 结束插件安装
"----------------------------------------------------------------------
call plug#end()

let g:startify_custom_header = startify#pad(startify#fortune#boxed())
"
"

function! OpenFloatingWin()
    let height = &lines - 3
    let width = float2nr(&columns - (&columns * 2 / 10))
    let col = float2nr((&columns - width) / 2)

    " 设置浮动窗口打开的位置，大小等。
    " 这里的大小配置可能不是那么的 flexible 有继续改进的空间
    let opts = {
                \ 'relative': 'editor',
                \ 'row': height * 0.2,
                \ 'col': col,
                \ 'width': width ,
                \ 'height': height * 2 / 3
                \ }

    let buf = nvim_create_buf(v:false, v:true)
    let win = nvim_open_win(buf, v:true, opts)

    " 设置浮动窗口高亮
    call setwinvar(win, '&winhl', 'Normal:Pmenu')

    setlocal
                \ buftype=nofile
                \ nobuflisted
                \ bufhidden=hide
                \ nonumber
                \ norelativenumber
                \ signcolumn=no
endfunction
" 让输入上方，搜索列表在下方
let $FZF_DEFAULT_OPTS = '--layout=reverse'

" 打开 fzf 的方式选择 floating window
let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }

nnoremap <silent> <Space>f :Files<CR>
nnoremap <silent> <Space>b :Buffers<CR>
nnoremap <silent> <Space>l :BLines<CR>
nnoremap <silent> <Space>L :Lines<CR>
autocmd FileType startify nnoremap <silent><buffer> l <C-W>l

nnoremap <silent> <m-n> :cn<CR>
nnoremap <silent> <m-p> :cp<CR>

autocmd FileType tasks let b:coc_pairs_disabled = ['(', ')']

let g:vista_default_executive = 'ctags'
let g:vista_executive_for = {
  \ 'python': 'coc',
  \ }
" e.g., more compact: 
" Note: this option only works the LSP executives, doesn't work for `:Vista ctags`.
"let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_icon_indent = ["▸ ", ""]
