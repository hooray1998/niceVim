
"==================================================================
" Title: 文件/文本检索
"==================================================================


"|GFiles [OPTS]|Git files (git ls-files)|
"|GFiles?|Git files (git status)|
nnoremap <silent> <Space>f :Files<CR>
nnoremap <silent> <Space>b :Buffers<CR>
nnoremap <silent> <Space>l :BLines<CR>
nnoremap <silent> <Space>L :Lines<CR>

let g:Lf_ShortcutF = 'c-p'
"let g:Lf_ShortcutB = '<leader>b'
noremap <c-n> :LeaderfMru<cr>

noremap <m-*> :<C-U><C-R>=printf("Leaderf rg %s ", expand("<cword>"))<CR><CR>
command! -nargs=? Rg :Leaderf rg <f-args>

"==================================================================
" Title: 定义、引用、符号
"==================================================================


noremap <m-m> :LeaderfFunction<cr>
noremap <m-p> :LeaderfBufTag<cr>
noremap <m-P> :LeaderfTag<cr>

nnoremap <silent> <m-up> :cp<CR>
nnoremap <silent> <m-down> :cn<CR>

autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
autocmd FileType qf nnoremap <silent><buffer> <Enter> :PreviewClose<cr><CR>
noremap <m-u> :PreviewScroll -1<cr>
noremap <m-d> :PreviewScroll +1<cr>
inoremap <m-u> <c-\><c-o>:PreviewScroll -1<cr>
inoremap <m-d> <c-\><c-o>:PreviewScroll +1<cr>

inoremap <F3> <c-\><c-o>:PreviewTag<cr>
noremap <F3> :PreviewTag<cr>
noremap <F4> :PreviewGoto tabe<cr>
" 函数参数
"noremap <F4> :PreviewSignature!<cr>
"inoremap <F4> <c-\><c-o>:PreviewSignature!<cr>


"激活补全
inoremap <silent><expr> <c-n> coc#refresh()
function! GoDefinition()
    if &ft == 'python'
        exec "call CocAction('jumpDefinition')"
    "elseif index(['c', 'cpp'], &ft) >= 0
    else
        exec "GscopeFind g ".expand('<cword>')
        "echom "Current filetype is'n support to find definition."
        "return
    endif
endfunc
function! GoReferences()
    if &ft == 'python'
        exec "call CocAction('jumpReferences')"
    "elseif index(['c', 'cpp'], &ft) >= 0
    else
        " TODO: 或者使用s查询被调用的函数
        exec "GscopeFind s ".expand('<cword>')
        "noremap <silent> <space>gc :GscopeFind c <C-R><C-W><cr>
        "echom "Current filetype is'n support to find references."
        "return
    endif
endfunc

" GoTo code navigation.
"nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gd :call GoDefinition()<CR>
nmap <silent> gr :call GoReferences()<CR>
"nmap <silent> gr <Plug>(coc-references)
"noremap <silent> <space>gs :GscopeFind s <C-R><C-W><cr>
"noremap <silent> <space>gd 
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gy <Plug>(coc-type-definition)

" Note: 查询当前文本符号
noremap <silent> <space>gt :GscopeFind t <C-R><C-W><cr>
noremap <silent> <space>ge :GscopeFind e <C-R><C-W><cr>

" Note: 查询当前文件
noremap <silent> <space>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <space>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>

"==================================================================
" Title: Coc修改意见，格式化，改名，函数文档
"==================================================================


vmap <silent> <m-cr> :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <m-cr> :<C-u>execute 'CocCommand actions.open ' <CR>


"vmap <m-cr>  <Plug>(coc-codeaction-selected)
"nmap <m-cr>  <Plug>(coc-fix-current)
"nmap <m-\>  <Plug>(coc-codeaction)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
command! -nargs=0 Rename  <Plug>(coc-rename)

vmap <m-space>  <Plug>(coc-format-selected)
nmap <m-space>  <Plug>(coc-format-selected)ap

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
"nnoremap <silent> <m-K> :PreviewTag<cr>

function! s:show_documentation()
  "if (index(['vim','help'], &filetype) >= 0)
    "execute 'h '.expand('<cword>')
  if (index(['c', 'cpp'], &filetype) >= 0)
    execute 'PreviewSignature'
  else
    call CocAction('doHover')
  endif
endfunction
let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]

"==================================================================
" Title: 其他窗口/菜单
"==================================================================


function! TodoToggle()
    if &ft == 'tasks'
        exec ":wincmd w | bd *.todo"
    else
        exec ":vsplit /media/Document/my.todo"
    endif
endfunc
"nnoremap <silent><m-7> :call TodoToggle()<CR>
noremap <silent><m-7> <ESC>:<C-U>call TodoToggle()<CR>

noremap <silent><m-8> :call quickmenu#toggle(3)<cr>
noremap <silent><m-9> :call quickmenu#toggle(0)<cr>
noremap <silent><m-0> :call quickmenu#toggle(1)<cr>


noremap <silent> <M-1> :call sidebar#toggle('coc-explorer')<CR>
noremap <silent> <M-2> :call sidebar#toggle('vista')<CR>
noremap <silent> <M-3> :call sidebar#toggle('undotree')<CR>

noremap <space>nn :NERDTree<cr>
noremap <space>no :NERDTreeFocus<cr>
noremap <space>nm :NERDTreeMirror<cr>
noremap <space>nt :NERDTreeToggle<cr>


"==================================================================
" Title: Todo中快捷键
"==================================================================


" MAPPINGS
autocmd Filetype tasks inoremap <buffer> <Tab> 
autocmd Filetype tasks inoremap <buffer> <S-Tab> 
" 编辑下一行
autocmd Filetype tasks inoremap <buffer> <Enter> <ESC>:call NewTask(1)<cr>
autocmd Filetype tasks nnoremap <buffer> o :call NewTask(1)<cr>
autocmd Filetype tasks nnoremap <buffer> O :call NewTask(-1)<cr>
autocmd Filetype tasks nnoremap <buffer> <Enter> :call TaskComplete()<cr>
autocmd Filetype tasks nnoremap <buffer> <BS> :call TaskCancel()<cr>
autocmd Filetype tasks nnoremap <buffer> <C-l> m6:call TasksArchive()<cr>'6

autocmd Filetype tasks nnoremap <buffer> * :call TaskStar()<cr>
autocmd Filetype tasks nnoremap <buffer> <C-j> /:\s*$<cr>:<C-u>set nohlsearch<cr>
autocmd Filetype tasks nnoremap <buffer> <C-k> ?:\s*$<cr>:<C-u>set nohlsearch<cr>

"setlocal foldlevel=2        " 设置折叠层数为
" 用空格键来开关折叠
autocmd Filetype tasks nnoremap <buffer> ; @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>






"==================================================================
" Title: 增强功能
"==================================================================

"nmap <c-f> <Plug>(easymotion-s2)

nnoremap <m-;> :Commands<CR>
nnoremap <m-:> :CocCommand<CR>
nnoremap <silent> <m-y>  :<C-u>CocList -A yank<cr>
nnoremap <silent> <m-M>  :Maps<cr>
nnoremap mm :Marks<CR>
":Colors	Color schemes

":History:	Command history
cnoremap <c-f>: History:<CR>
":History/	Search history
cnoremap <c-f>/ History/<CR>

"fzf或者内置终端可以使用<C-\><C-n>回到norm模式，进行拷贝等操作
"


"==================================================================
" Title: 其他映射
"==================================================================


" 使用 <space>ha 清除 errormarker 标注的错误
noremap <silent><space>ha :RemoveErrorMarkers<cr>

autocmd Filetype markdown nnoremap <silent> <buffer> <F12> :SignifyToggle \| Goyo<CR>
autocmd FileType markdown nnoremap <silent> <buffer> <C-t> :TableModeRealign<CR>

let g:EasyMotion_use_upper = 1
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1
nmap <C-f> <Plug>(easymotion-s)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
