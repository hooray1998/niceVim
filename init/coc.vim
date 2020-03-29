Plug 'neoclide/coc.nvim', {'branch': 'release'}

"==================================================================
" Title: Coc配置
"==================================================================

let g:coc_global_extensions = [
            \ 'coc-zi' ,
            \ 'coc-yank' ,
            \ 'coc-vimlsp' ,
            \ 'coc-translator' ,
            \ 'coc-todolist' ,
            \ 'coc-tabnine' ,
            \ 'coc-snippets' ,
            \ 'coc-marketplace'  ,
            \ 'coc-explorer' ,
            \ 'coc-ecdict' ,
            \ 'coc-xml' ,
            \ 'coc-python' ,
            \ 'coc-markmap' ,
            \ 'coc-markdownlint' ,
            \ 'coc-lua' ,
            \ 'coc-json' ,
            \ 'coc-java' ,
            \ 'coc-html' ,
            \ 'coc-css',
            \ 'coc-cmake',
            \ 'coc-actions']

set updatetime=300
set shortmess+=c

if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Highlight the symbol and its references when holding the cursor.
" if has('nvim')
    " autocmd CursorHold *.py,*.sh silent call CocActionAsync('highlight')
" endif

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
