" This must be first, because it changes other options as side effect
set nocompatible

set wrap linebreak
set fileencoding=utf-8
set relativenumber
set ignorecase
set smartcase
set incsearch

execute pathogen#infect()

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk

" swap : & ; key
nnoremap : ;
nnoremap ; :

" visually select everything inside a block using %
noremap % v%

" remember up to 100 marks and also memorize glbal marks
set viminfo='100,f1

syntax enable
set background=dark
se t_Co=16
let g:solarized_termcolors=256
" let g:gruvbox_termcolors=16
colorscheme solarized

set hidden
set clipboard=unnamed

set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set nobackup
set noswapfile

filetype plugin indent on

set wildmenu
set laststatus=2

" remove search highlight on pressing Esc
" this line create some problems when vim first load up, goes to insert mode
" nnoremap <esc> :noh<return><esc>

" Code Folding setting
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

autocmd FileType javascript,css,php,cpp,c nnoremap <silent> <Leader>; :call cosco#commaOrSemiColon()<CR>
autocmd FileType javascript,css,php,cpp,c inoremap <silent> <Leader>; <c-o>:call cosco#commaOrSemiColon()<CR>

" block cursor in normal mode, ibeam cursor in insert mode
if has("autocmd")
  au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
  au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
  au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
endif
