"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       Amir Salihefendic
"       http://amix.dk - amix@amix.dk
"
" Version:
"       1.0 - 12/08/13
" Sections:
"    -> Vundle
"    -> General
"    -> VIM user interface
"    -> Colors, Coding and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" => Vundle
    set nocompatible
    filetype off   "required!
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    " let Vundle manage Vundle
    " required
    Bundle 'gmarik/vundle'

    "  My Bundles here {
        " original repos on github
        " Bundle 'tpope/vim-fugitive'
        Bundle 'tpope/vim-surround'
        Bundle 'scrooloose/nerdtree'
        Bundle 'scrooloose/nerdcommenter'
        Bundle 'scrooloose/syntastic'
        Bundle 'kien/ctrlp.vim'
        Bundle 'tpope/vim-fugitive'
        Bundle 'myusuf3/numbers.vim'
        Bundle 'Shougo/neocomplcache.vim'
        Bundle 'Lokaltog/vim-easymotion'
        Bundle 'myusuf3/numbers.vim'
        Bundle 'mbbill/undotree'
        Bundle 'airblade/vim-gitgutter'
        Bundle 'altercation/vim-colors-solarized'
        Bundle 'spf13/vim-colors'
        Bundle 'spf13/vim-autoclose'
        Bundle 'tpope/vim-abolish.git'
        Bundle 'Lokaltog/vim-powerline'
        " Vim-scripts repos
        " Bundle 'L9'
        " non github repos
        "Bundle 'git://git.wincent.com/command-t.git'
    " }

    filetype on "required!
    filetype indent on "required!

    " Brief help
    " :BundleList   - list configured bundles
    " :BundleInstall  - install( update ) bundles
    " :BundleSearch foo - search for foo
    " :BundleClean  - confirm(or auto-approve) removal of unused bundles
    " see :h vundle for more details
    " NOTE: comments after Bundle command are not allowed..

" => General
    " Sets how many lines of history VIM has to remember
    set history=700
    " Set to auto read when a file is changed from the outside
    set autoread
    " Automatically enable mouse usage
    set mouse=a
    " Hide the mouse cursor while typing
    set mousehide
    " With a map leader it's possible to do extra key combinations
    " like <leader>w saves the current file
    let mapleader=","
    let g:mapleader=","

    set timeoutlen=2000
    set pastetoggle=<F12>
    " Fast saving
    nmap <leader>w :w!<cr>
    " :W sudo saves the file
    " (useful for handling the permission-denied error)
    command W w !sudo tee % > /dev/null

" => VIM user interface
    " Set 7 lines to the cursor - when moving vertically using j/k
    " the number of context lines you would like to see above and below the cursor
    " set so=7
    set scrolloff=7
    set shortmess+=filmnrxoOtT
    set virtualedit=onemore " allow for cursor beyond last character

    au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.',[0,1,1,0])


    " Turn on the WiLd menu
    " Show list instead of just completing
    set wildmenu
    " Command <Tab> Completion, list matches. then loongest common part, then all.
    set wildmode=list:longest,full

    " Ignore compiled files
    set wildignore=*.o,*~,*.pyc
    if has("win16") || has("win32")
        set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
    else
        set wildignore+=.git\*,.hg\*,.svn\*
    endif

    "Always show current position
    set ruler
    " Show line number
    set number
    " Highlight current line
    set cursorline
    " add < and > as matchpairs 
    set matchpairs+=<:> 
    " Height of the command bar
    set cmdheight=1
    " A buffer becomes hidden when it is abandoned
    set hid
    " Configure backspace so it acts as it should act
    set backspace=eol,start,indent
    set whichwrap+=<,>,h,l
    " Ignore case when searching
    set ignorecase
    " When searching try to be smart about cases 
    set smartcase
    " Highlight search results
    set hlsearch
    " Makes search act like search in modern browsers
    set incsearch 
    " Don't redraw while executing macros (good performance config)
    set lazyredraw 
    " For regular expressions turn magic on
    set magic
    " Show matching brackets when text indicator is over them
    set showmatch 
    " How many tenths of a second to blink when matching brackets
    set mat=2
    " Highligt problematic whitespcae
    set list
    set listchars=tab:>·,trail:•,extends:#,nbsp:.
    " Remove trailing whitespaces and ^M chars
    autocmd FileType c,cpp,java,go,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> call StripTrailingWhitespace()
    " Automatically switch to the current file directory when a new buffer is opened
    autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
    " Allow buffer switching without saving
    set hidden
    " Display the current mode
    set showmode
    " No annoying sound on errors
    set noerrorbells
    set novisualbell
    set t_vb=

" => Fold
    " Auto fold code
    set foldenable
    set foldmethod=indent
    set foldlevel=99
    " Add a bit extra margin to the left
    set foldcolumn=2
    " Code folding options
    nmap <leader>f0 :set foldlevel=0<CR>
    nmap <leader>f1 :set foldlevel=1<CR>
    nmap <leader>f2 :set foldlevel=2<CR>
    nmap <leader>f3 :set foldlevel=3<CR>
    nmap <leader>f4 :set foldlevel=4<CR>
    nmap <leader>f5 :set foldlevel=5<CR>
    nmap <leader>f6 :set foldlevel=6<CR>
    nmap <leader>f7 :set foldlevel=7<CR>
    nmap <leader>f8 :set foldlevel=8<CR>
    nmap <leader>f9 :set foldlevel=9<CR>


" => Colors and Fonts {
    " Enable syntax highlighting
    syntax enable 

    try
        colorscheme desert
    catch
    endtry

    set background=dark

    " Set extra options when running in GUI mode
    if has("gui_running")
        set guioptions-=T
        set guioptions-=e
        set t_Co=256
        set guitablabel=%M\ %t
        set go=aAce              " 去掉难看的工具栏和滑动条
        set guifont=Monaco:h14   " 设置默认字体为monaco
    endif

    set t_Co=256
    " Use unix, as the standard file type
    set ffs=unix,mac,dos

    " { encoding, filecodings setting
    " Set utf8 as standard encoding and en_US as the standard language
    set encoding=utf8

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

    " }

" => Files, backups and undo
    " Turn backup off, since most stuff is in SVN, git et.c anyway...
    set nobackup
    set nowb
    set noswapfile
    if has('persistent_undo')
        set undofile    "So is persistent undo
        set undolevels=1000     "Maximum number of changes that can be undone
        set undoreload=10000    "Maximum number lines to save for undo on a buffer reload
    endif

    " set swap(.swp), backup(~), undo(.udf) directory to vim installation
    " Please make sure the directory exists otherwise current directory will be used
    set directory=~/.vim_runtime/swap//,.,/tmp//
    set backupdir=~/.vim_runtime/backup//,.,/tmp//
    set undodir=~/.vim_runtime/undo//,.,/tmp//

" => Text, tab and indent related
    " Use spaces instead of tabs
    set expandtab

    " Be smart when using tabs ;)
    set smarttab

    " 1 tab == 4 spaces
    set shiftwidth=4
    set tabstop=4
    " Let backspace delete 4 spaces
    set softtabstop=4

    " Linebreak on 500 characters
    set lbr
    set tw=500
    " Indent at the same level of the previous line
    set autoindent

    set smartindent "Smart indent
    set wrap "Wrap lines

" => Visual mode related
    " Visual mode pressing * or # searches for the current selection
    " Super useful! From an idea by Michael Naumann
    vnoremap <silent> * :call VisualSelection('f', '')<CR>
    vnoremap <silent> # :call VisualSelection('b', '')<CR>


" => Moving around, tabs, windows and buffers
    " Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
    map <space> /
    map <C-@> ?

    " Toggle search highlighting
    nmap <silent> <leader>/ :set invhlsearch<cr>

    " Visual shifting ( does not exit Visual mode)
    vnoremap <  <gv
    vnoremap >  >gv


    " Smart way to move between windows
    map <C-j> <C-W>j
    map <C-k> <C-W>k
    map <C-h> <C-W>h
    map <C-l> <C-W>l

    " Close the current buffer
    map <leader>bd :Bclose<cr>

    " Close all the buffers
    map <leader>ba :1,1000 bd!<cr>

    " Useful mappings for managing tabs
    map <leader>tn :tabnew<cr>
    map <leader>to :tabonly<cr>
    map <leader>tc :tabclose<cr>
    map <leader>tm :tabmove<cr>
    map <leader>t<leader> :tabnext<cr>

    " Opens a new tab with the current buffer's path
    " Super useful when editing files in the same directory
    map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

    " Switch CWD to the directory of the open buffer
    map <leader>cd :cd %:p:h<cr>:pwd<cr>

    " Specify the behavior when switching between buffers 
    try
      set switchbuf=useopen,usetab,newtab
      set stal=2
    catch
    endtry

    " Return to last edit position when opening files (You want this!)
    autocmd BufReadPost *
         \ if line("'\"") > 0 && line("'\"") <= line("$") |
         \   exe "normal! g`\"" |
         \ endif
    " Remember info about open buffers on close
    set viminfo^=%

" => Status line
    " Explicitly tell Vime that the terminal supports 256 colors
    set t_Co=256
    " display keystrokes in status line
    if has('cmdline_info')
        set ruler   " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
        set showcmd
    endif
    " Format the status line
    if has('statusline')
        set laststatus=2
        " Broken down into easily includeable segments
        set statusline=%<%f\                     " Filename
        set statusline+=%w%h%m%r                 " Options
        set statusline+=%{fugitive#statusline()} " Git Hotness
        set statusline+=\ [%{&ff}/%Y]            " Filetype
        set statusline+=\ [%{getcwd()}]          " Current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    endif
    if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
        let g:solarized_termcolors=256
        color solarized                 " Load a colorscheme
    endif
    let g:solarized_termtrans=1
    let g:solarized_contrast="high"
    let g:solarized_visibility="high"

" => Editing mappings
    " Remap VIM 0 to first non-blank character
    map 0 ^
    
    " Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
    nmap <M-j> mz:m+<cr>`z
    nmap <M-k> mz:m-2<cr>`z
    vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
    vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
    
    if has("mac") || has("macunix")
      nmap <D-j> <M-j>
      nmap <D-k> <M-k>
      vmap <D-j> <M-j>
      vmap <D-k> <M-k>
    endif
    
    " Delete trailing white space on save, useful for Python and CoffeeScript ;)
    func! DeleteTrailingWS()
      exe "normal mz"
      %s/\s\+$//ge
      exe "normal `z"
    endfunc
    autocmd BufWrite *.py :call DeleteTrailingWS()
    autocmd BufWrite *.coffee :call DeleteTrailingWS()

" => vimgrep searching and cope displaying
    " When you press gv you vimgrep after the selected text
    vnoremap <silent> gv :call VisualSelection('gv', '')<CR>
    
    " Open vimgrep and put the cursor in the right position
    map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>
    
    " Vimgreps in the current file
    map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>
    
    " When you press <leader>r you can search and replace the selected text
    vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>
    
    " Do :help cope if you are unsure what cope is. It's super useful!
    "
    " When you search with vimgrep, display your results in cope by doing:
    "   <leader>cc
    "
    " To go to the next search result do:
    "   <leader>n
    "
    " To go to the previous search results do:
    "   <leader>p
    "
    map <leader>cc :botright cope<cr>
    map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
    map <leader>n :cn<cr>
    map <leader>p :cp<cr>


" => Spell checking
    " Pressing ,ss will toggle and untoggle spell checking
    map <leader>ss :setlocal spell!<cr>
    
    " Shortcuts using <leader>
    map <leader>sn ]s
    map <leader>sp [s
    map <leader>sa zg
    map <leader>s? z=

" => Misc
    " Remove the Windows ^M - when the encodings gets messed up
    noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
    
    " Quickly open a buffer for scripbble
    map <leader>q :e ~/buffer<cr>
    
    " Toggle paste mode on and off
    map <leader>pp :setlocal paste!<cr>


" => Helper functions
    function! CmdLine(str)
        exe "menu Foo.Bar :" . a:str
        emenu Foo.Bar
        unmenu Foo
    endfunction 
    
    function! VisualSelection(direction, extra_filter) range
        let l:saved_reg = @"
        execute "normal! vgvy"
    
        let l:pattern = escape(@", '\\/.*$^~[]')
        let l:pattern = substitute(l:pattern, "\n$", "", "")
    
        if a:direction == 'b'
            execute "normal ?" . l:pattern . "^M"
        elseif a:direction == 'gv'
            call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.' . a:extra_filter)
        elseif a:direction == 'replace'
            call CmdLine("%s" . '/'. l:pattern . '/')
        elseif a:direction == 'f'
            execute "normal /" . l:pattern . "^M"
        endif
    
        let @/ = l:pattern
        let @" = l:saved_reg
    endfunction
    
    
    " Returns true if paste mode is enabled
    function! HasPaste()
        if &paste
            return 'PASTE MODE  '
        en
        return ''
    endfunction
    
    " Don't close window, when deleting a buffer
    command! Bclose call <SID>BufcloseCloseIt()
    function! <SID>BufcloseCloseIt()
       let l:currentBufNum = bufnr("%")
       let l:alternateBufNum = bufnr("#")
    
       if buflisted(l:alternateBufNum)
         buffer #
       else
         bnext
       endif
    
       if bufnr("%") == l:currentBufNum
         new
       endif
    
       if buflisted(l:currentBufNum)
         execute("bdelete! ".l:currentBufNum)
       endif
    endfunction
