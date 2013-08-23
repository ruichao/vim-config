
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set extra options when running in GUI mode
if has("gui_running")
    set background=light
    set guioptions-=T
    set guioptions-=e
    set transparency=5 " transparency background
    set t_Co=256
    set guitablabel=%M\ %t
    set go=aAce              " 去掉难看的工具栏和滑动条
endif


" Set font according to system
if has("mac") || has("macunix")
    set guifont=Menlo:h14
elseif has("win16") || has("win32")
    set guifont=Bitstream\ Vera\ Sans\ Mono:h11
elseif has("linux")
    set guifont=Monospace\ 11
endif

" Open MacVim in fullscreen mode
"if has("gui_macvim")
"    set fuoptions=maxvert,maxhorz
"    au GUIEnter * set fullscreen
"endif

" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart mappings on the command line
cno $h e ~/
cno $j e ./
"cno $c e <C-\>eCurrentFileDir("e")<cr>

" $q is super useful when browsing on the command line
" it deletes everything until the last slash 
cno $q <C-\>eDeleteTillSlash()<cr>

" Bash like keys for the command line
cnoremap <C-A>  <Home>
cnoremap <C-E>  <End>
cnoremap <C-K>  <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => General abbreviations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Omni complete functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Helper functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"func! DeleteTillSlash()
"    let g:cmd = getcmdline()
"
"    if has("win16") || has("win32")
"        let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
"    else
"        let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
"    endif
"
"    if g:cmd == g:cmd_edited
"        if has("win16") || has("win32")
"            let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
"        else
"            let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
"        endif
"    endif   
"
"    return g:cmd_edited
"endfunc
"
"func! CurrentFileDir(cmd)
"    return a:cmd . " " . expand("%:p:h") . "/"
"endfunc
