" hides buffers instead of closing by default (allows using :e while buffer has changes)
set hidden 

set shiftwidth=4
set number
set laststatus=2
set statusline+=%f

set wildmenu
set wildmode=list:longest,full
inoremap jj <Esc>

" Search related stuff
set incsearch
set hlsearch
set ignorecase
set smartcase
