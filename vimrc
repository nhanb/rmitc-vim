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


" =================================================================
" MAKING VIM BEHAVE IN A SANE WAY
" =================================================================

" Go go Vundle!
"so ~/.vim/vundle.vim

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
" KEYBINDINGS
" =================================================================

" ';' can be used as ':'
nnoremap ; :
vnoremap ; :

" Change the leader key from \ to ,
let mapleader=","

" jj exits Insert mode
inoremap jj <esc>

" Moving around splits using Ctrl+h/j/k/l
map <c-j> <c-w>j
map <c-h> <c-w>h
map <c-k> <c-w>k
map <c-l> <c-w>l

" C-w is super difficult to press, so make it <leader>w
nmap <leader>w <c-w>

" Moving around tabs using <leader>n/m
map <leader>n <esc>:tabprevious<cr>
map <leader>m <esc>:tabnext<cr>

" Sort in visual mode by <leader>s
vnoremap <leader>s :sort<cr>

" F2 clears search highlight & search message
nmap <silent> <f2> :silent noh<cr>:echo<cr>

" F3 toggles paste mode
set pastetoggle=<f3>

" F4 toggles tagbar
nnoremap <f4> :TagbarToggle<cr>

" F7 Clean ^M characters from Windows files
nnoremap <f7> :%s/<c-v><c-m>//g<cr>

" F8 indents whole file
nnoremap <f8> gg=G

" F11 maximizes current split (vertically only)
nnoremap <f11> <c-w>99+

" F12 minimizes current split (vertically only)
nnoremap <f12> <c-w>99-

" Up Down to adjust current split size
nnoremap <up> <c-w>+
nnoremap <down> <c-w>-

" Left Right to cycle through buffers
nnoremap <left> :bprev<cr>
nnoremap <right> :bnext<cr>

" Quickly open vimrc
nnoremap <leader>ve :e<space>~/dotfiles/.vimrc<cr>
nnoremap <leader>vt :tabe<space>~/dotfiles/.vimrc<cr>
nnoremap <leader>vv :tabe<space>~/dotfiles/.vim/vundle.vim<cr>

" Write file with sudo permission
nnoremap <leader>wf :w<space>!sudo<space>tee<space>%<cr>

" Change working dir to the current file's dir
"nnoremap <leader>r :cd<space>%:p:h<cr>:pwd<cr>

" Use X11 system clipboard
nnoremap <leader>xp "+p
nnoremap <leader>xyy "+yy
nnoremap <leader>xdd "+dd
vnoremap <leader>xy "+y
vnoremap <leader>xd "+d

" CtrlP
nnoremap <leader>o :CtrlPMixed<cr>
nnoremap <leader>b :CtrlPBuffer<cr>

" NERDTree
nnoremap <leader>d <esc>:NERDTree<cr>
nnoremap <leader>e :NERDTreeToggle<cr>

" Visually select a piece of text then press ~ to change its case. There are
" three types: all lowercase, ALL UPPERCASE, First Letters Uppercase.
" TwiddleCase --------------------- {{{
function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ ygv"=TwiddleCase(@")<CR>Pgv
" }}}

" Open oh-my-zsh nhanb theme
nnoremap <leader>zt :e<space>~/.oh-my-zsh/themes/nhanb.zsh-theme<cr>

" Open .zshrc
nnoremap <leader>zr :e<space>~/.zshrc<cr>

" Moving up/down 1 row instead of 1 line (fix wrap issue)
nnoremap j gj
nnoremap k gk

" Saner new split position
set splitbelow
set splitright
