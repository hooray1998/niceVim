"==================================================================
" Title: Startify
"==================================================================

autocmd User Startified exec "vsplit /media/Document/my.todo \| set ft=tasks \| wincmd w"
autocmd User Startified nnoremap <buffer> <leader>e :qa<CR>
autocmd User Startified nnoremap <buffer> l <C-W>l
autocmd User StartifyBufferOpened silent execute "wincmd o"

let g:startify_disable_at_vimenter = 0
let g:startify_session_dir = '~/.vim/session'
let g:startify_change_to_vcs_root = 0
let g:startify_update_oldfiles    = 1
let g:startify_enable_special     = 0
let g:startify_files_number       = 6
let g:startify_relative_path      = 1

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
            \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ { 'type': 'commands',  'header': ['   Commands']       },
            \ ]

let g:startify_custom_indices = map(range(1,100), 'string(v:val)')
let g:startify_custom_header_quotes = [
            \ {-> systemlist('shuf -n2 $HOME/quote.list')}
            \ ]

let g:startify_commands = [
            \ {'n': ['history', 'LeaderfMru']},
            \ {'f': ['files', 'LeaderfFile']},
            \ {'g': ['git status', 'vertical topleft G | vertical resize -35']},
            \ {'v': ['vim config', 'e ~/.vim/niceVim/init.vim']},
            \ {'m': ['map config', 'e ~/.vim/niceVim/init/plugin-keymaps.vim']},
            \ {'p': ['plugin config', ':e ~/.vim/niceVim/init/init-plugins.vim']},
            \ ]
let g:startify_custom_header      = startify#pad(startify#fortune#boxed())


"==================================================================
" Title: 文件浏览器coc-explore，符号树Vista， UndoTree
"==================================================================

if has("persistent_undo")
    set undodir=$HOME/.undodir
    set undofile
endif
let g:undotree_SplitWidth = 40
let g:undotree_SetFocusWhenToggle = 1

let g:vista_sidebar_width = 40
let g:vista_sidebar_position = 'vertical topleft'
let g:vista_default_executive = 'ctags'
let g:vista_executive_for = {
  \ 'python': 'coc',
  \ }
let g:vista_icon_indent = ["▸ ", ""]

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

let g:startify_session_before_save = ['call sidebar#close_all()']


"Plug 'irrationalistic/vim-tasks'
autocmd BufNewFile,BufReadPost *.TODO,TODO,*.todo,*.todolist,*.taskpaper,*.tasks set filetype=tasks

"==================================================================
" Title: 文件管理器
"==================================================================

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


let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeHijackNetrw = 0
let g:NERDTreeChDirMode=1
let g:NERDTreeShowBookmarks=0
let g:NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let g:NERDTreeWinSize=25

"==================================================================
" Title: Airline
"==================================================================

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


"==================================================================
" Title: Signity显示git/svn
"==================================================================

" diff使用增强算法
autocmd VimEnter * EnhancedDiff histogram
" started In Diff-Mode set diffexpr (plugin not loaded yet)
if &diff
    let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=histogram")'
endif

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
