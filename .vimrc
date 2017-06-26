set hidden
source ~/.vim/bundle/a.vim

filetype plugin indent on
set shiftwidth=2
set softtabstop=2
set number
set laststatus=2

set wildmenu
set wildmode=list:longest,full
inoremap jj <Esc>

" Search related stuff
set incsearch
set hlsearch
set ignorecase
set smartcase

set autochdir

set mouse=a

set backup
set backupdir=~/.vimbackup

" Switch header files
nnoremap <Leader>a :A<Return>
