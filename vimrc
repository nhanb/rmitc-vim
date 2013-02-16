"                                       #####     
"                                       #####     
"                                       #####     
"                                                 
"                                                 
"                    #########     #####          
"                 ############     #####          
"                #############     #####          
"               ###################          #####
"              ####################          #####
"              ####################          #####
"             :#########################          
"              ##    ###################          
"              #########################          
"            =##########################          
"           +##########################+          
"           ##########################            
"             #######################             
"             ######################              
"                    ##############               
"              ####################               
"              ####################               
"                    ##############I              
"                    +##############              
"                     ##############+             
"                      www.rmitc.org              

" =================================================================
" Many of these tweaks were copied from:
"   http://nvie.com/posts/how-i-boosted-my-vim/
" I strongly recommend checking it out!
" =================================================================

" It's 2013 (as of writing this) and mankind doesn't use vi anymore!
set nocompatible

" Go go Vundle!
so ~/.vim/vundle

" Plugin-independent keybindings
so ~/.vim/keybindings

" =================================================================
" MAKING VIM BEHAVE IN A SANE WAY
" =================================================================

set nowrap        " don't wrap lines
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set tabstop=4 expandtab softtabstop=4
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
"set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
"set cursorline    " highlight current line

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set noerrorbells         " don't beep
set colorcolumn=80       " 80-character indicator line

" Don't make those dreadful backup files
"set nobackup
"set noswapfile

" On second thought, keep swap files in my tmp dir
set backupdir=~/tmp
set directory=~/tmp

" Easier block indenting (does not exit visual mode after one shift)
vnoremap < <gv
vnoremap > >gv

" Auto change working directory to current file's
set autochdir

" Auto reload file on change
set autoread

" =================================================================
" Further tweaks
" =================================================================

" Omnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" Auto reload .vimrc"{{{
" The call Pl#Load() at the end is to reload Powerine
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif | call Pl#Load()
augroup END
"}}}
