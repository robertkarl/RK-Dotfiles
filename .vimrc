" hides buffers instead of closing by default (allows using :e while buffer has changes)
set hidden

set expandtab
set shiftwidth=4
set tabstop=4
set number
set laststatus=2
set statusline+=%f

set wildmenu
set wildmode=list:longest,full
inoremap jk <Esc>

"
" Install with curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'jlanzarotta/bufexplorer'
call plug#end()

" Search related stuff
set incsearch
set hlsearch
set ignorecase
set smartcase

syntax on
filetype indent plugin on
set background=light

function! LoadLocal()
    let fname = expand("~/.vimrc.local")
    if filereadable(fname)
        source ~/.vimrc.local
    endif
endfunction
call LoadLocal()
