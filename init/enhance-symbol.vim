"==================================================================
" Title: Leaderf gtags 真的nice，爱死了
"==================================================================
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1

" let g:Lf_WildIgnore = {
        " \ 'dir': [],
        " \ 'file': ['*.vim']
        " \}

let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagslabel = 'native-pygments'
let g:Lf_Gtagsconf = '/usr/local/share/gtags/gtags.conf'
let g:Lf_RootMarkers = ['.git', '.svn', '.root']
" 插入模式使用Ctrl-p预览即可, Ctrl-D/U 上下滚动
let g:Lf_CommandMap = {'<C-Up>': ['<C-U>'], '<C-Down>': ['<C-D>']}
let g:Lf_MruMaxFile = 50
let g:Lf_PreviewResult = {
        \ 'File': 0,
        \ 'Buffer': 0,
        \ 'Mru': 0,
        \ 'Tag': 0,
        \ 'BufTag': 0,
        \ 'Function': 0,
        \ 'Line': 0,
        \ 'Colorscheme': 1,
        \ 'Rg': 0,
        \ 'Gtags': 0
        \}
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_PopupWidth = 0.75
let g:Lf_PopupHeight = 0.4
let g:Lf_PopupPosition = [ &lines * 1 / 2,  0]
let g:Lf_StlSeparator = { 'left': "", 'right': "" }

let g:Lf_WildIgnore = {
        \ 'dir': ['.svn','.git','.hg'],
        \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
        \}
