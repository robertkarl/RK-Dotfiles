" hides buffers instead of closing by default (allows using :e while buffer has changes)
filetype off                  " required
inoremap <c-h> :tabprev<cr>
inoremap <c-l> :tabprev<cr>
inoremap jk <Esc>
nnoremap <c-h> :tabprev<cr>
nnoremap <c-l> :tabnext<cr>
set clipboard=unnamed  " use the clipboards of vim and win
set clipboard^=autoselect " https://stackoverflow.com/questions/7747846/selecting-in-visual-mode-to-paste-outside-vim-window
set expandtab
set go+=a               " Visual selection automatically copied to the clipboard
set hidden
set laststatus=2
set mouse=a
set nocompatible              " be iMproved, required
set number relativenumber
set paste               " Paste from a windows or from vim
set shiftwidth=4
set statusline+=%f
set tabstop=4
set wildmenu
set wildmode=list:longest,full
set showcmd

inoremap <c-d> <esc>ddi
inoremap <m-u> <esc>viwUi
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"mappings don't take into account what characters come before or after;
"abbrevs do.
iabbrev @@ robertkarljr@gmail.com
iabbrev ssig -- <cr>Robert Karl<cr>robertkarljr@gmail.com
iabbrev i32 int32_t
iabbrev @F FREEZER
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lell
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lell

" Move between tabs with leader + number, or leader + h/l
nnoremap <leader>1 :1tabnext<cr>
nnoremap <leader>2 :2tabnext<cr>
nnoremap <leader>3 :3tabnext<cr>
nnoremap <leader>4 :4tabnext<cr>
nnoremap <leader>5 :5tabnext<cr>
nnoremap <c-h> :tabprev<cr>
nnoremap <c-l> :tabnext<cr>
" quotes the word where the cursor is
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>l

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
Plug 'Valloric/YouCompleteMe'
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

let g:ycm_server_python_interpreter = '/usr/bin/python'
let g:ycm_confirm_extra_conf=0
let g:ycm_always_populate_location_list = 1
function! YapfMe()
  !yapf -i %:p
endfunction

nnoremap gd :YcmCompleter GoToDefinition<CR>
