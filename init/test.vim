call quickui#menu#reset()

" install a 'File' menu, use [text, command] to represent an item.
" items containing tips, tips will display in the cmdline
call quickui#menu#install('&File', [
            \ [ 'Auto&Format', 'Autoformat', '使用AutoFormat格式化代码' ],
            \ [ '&Tab2Space', '%s/\t/    /gg | %s/\s*$//gg | w','Tab2Space & trailing' ],
            \ [ '&CRLF to LF', 'exec ":%s///gg"', '换行符转化' ],
            \ [ '-','' ],
            \ [ '&Save Session','SSave!', '保存会话' ],
            \ ])
call quickui#menu#install('&Mode', [
            \ [ '&Goyo', 'Goyo', '专注模式'],
            \ [ '&Find', 'echo 3', 'help 3' ],
            \ ])

function! EnableGutentags()
    exec ":GutentagsToggleEnabled"
    if g:gutentags_enabled == 1
        echom "已启用:gutentags"
    else
        echom "已禁用:gutentags"
    endif
endfunc
| Gblame   | 查看每行的最新修改是什么时候               |
| Gwrite   | 增加到暂存区                               |
| Gvdiff   | 与最近的提交比较                           |
| Gread    | 放弃修改恢复到最近的一次提交或暂存区的内容 |
| Gmove    | 移除文件并重命名缓存区                     |
| Ggrep    | 搜索git文件                                |
| BCommits | 查看当前文件所有提交                       |
call quickui#menu#install('&Git', [
            \ [ 'Git &add', 'Gwrite', '增加到暂存区'],
            \ [ 'Git &diff', 'Gvdiffsplit', '文件对比' ],
            \ [ 'Git &blame', 'Gblame', '文件问责' ],
            \ [ 'Git &grep', 'Ggrep', 'Git文件搜索' ],
            \ [ 'Git &commit', 'BCommits', '本文件相关的提交' ],
            \ [ '&Git', 'G', 'fugitive' ],
            \ ])
" script inside %{...} will be evaluated and expanded in the string
call quickui#menu#install("&Option", [
            \ ['Set &Spell %{&spell? "Off":"On"}', 'set spell!'],
            \ ['Set &Cursor Line %{&cursorline? "Off":"On"}', 'set cursorline!'],
            \ ['Set &Paste %{&paste? "Off":"On"}', 'set paste!'],
            \ ['Turn &gutentags', 'call EnableGutentags'],
            \ ])

" register HELP menu with weight 10000
call quickui#menu#install('&Help', [
            \ ['&Dict', 'Dict', '词典'],
            \ ["&Cheatsheet", 'help index', ''],
            \ ['T&ips', 'help tips', ''],
            \ ['--',''],
            \ ["&Tutorial", 'help tutor', ''],
            \ ['&Quick Reference', 'help quickref', ''],
            \ ['&Summary', 'help summary', ''],
            \ ], 10000)

" enable to display tips in the cmdline
let g:quickui_show_tip = 1

" hit space twice to open menu
noremap <m-8> :call quickui#menu#open()<cr><cr>

" command! -nargs=0 TranslatePopup CocCommand translator.popup
" command! -nargs=0 Translate CocCommand translator.echo
" command! -nargs=0 Dict CocList translators
" call CocAction('doHover')
let content = [
            \ ["&CocHover\tc"        ,  'call CocAction("doHover")' ],
            \ ["&Translate\tt"       ,  'CocCommand translator.popup'],
            \ ['-'],
            \ ["Find &Defintion\td"  ,  'call GoDefinition()' ],
            \ ["Find &References\tr" ,  'call GoReferences()'],
            \ ['-'],
            \ ["&Find in File\tf"     ,  'Leaderf line --cword' ],
            \ ["Ctrl&SF\ts"          ,  'CtrlSF '.expand("<cword>") ],
            \ ["R&g\tg"              ,  'Leaderf rg --cword' ],
            \ ]
" set cursor to the last position
let opts = {'index':g:quickui#context#cursor}
noremap K :call quickui#context#open(content, opts)<CR>
