if has("gui_running")
    set go=aAce              " 去掉难看的工具栏和滑动条
    set guifont=Monaco:h14   " 设置默认字体为monaco
endif

"folder
set foldmethod=syntax
autocmd FileType python setlocal foldmethod=indent
set foldlevel=99
set mouse=a

"encoding script
if has("multi_byte")
    "set fileencoding priority
    if getfsize(expand("%")) > 0
        set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,latain1
    else
        set fileencodings=cp936,big5,euc-jp,euc-kr,latain1
    endif

    "CJK environment detection and corresponding setting
    if v:lang =~ "^zh_CN"
        "Use cp936 to support GBK, euc-cn == gb2312
        set encoding=cp936
        set termencoding=cp936
        set fileencoding=cp936
    elseif v:lang =~ "^zh_TW"
        "cp950, big5 or euc-tw
        set encoding=big5
        set termencoding=big5
        set fileencoding=big5
    elseif v:lang =~ "^ko"
        set encoding=euc-kr
        set termencoding=euc-kr
        set fileencoding=euc-kr
    elseif v:lang =~ "^ja_JP"
        set encoding=euc-jp
        set termencoding=euc-jp
        set fileencoding=enc-jp
    endif

    " Detect UTF-8 locale, and replace CJK setting if needed
    if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
        set encoding=utf-8
        set termencoding=utf-8
        set fileencoding=utf-8
    endif
else
    echoerr "Sorry, this version of (g)vim was not compiled with multi_byte"
endif
set foldlevel=9

