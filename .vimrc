set nocompatible
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
set noswapfile
set autoread

set nu
set ai
set ci
set showmatch
set sw=2
set ts=2

set splitbelow
set splitright

set hlsearch
set ignorecase
set incsearch
set smartcase
set hidden

set wrap
set textwidth=0

set pastetoggle=<F2>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set tags=tags
syntax on



" Navigating between windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <Space> :noh<cr>

let mapleader = ","

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" NERD Tree
let NERDTreeWinPos = "left"
nmap <f8> :NERDTreeFind<cr>
nmap <f9> :NERDTreeToggle<cr>
let g:NERDTreeNodeDelimiter = "\u00a0"

map <leader><leader> gc

" Vroom
let g:vroom_map_keys = 0
let g:vroom_use_vimux = 1
let g:vroom_use_spring = 1
map <leader>t :VroomRunTestFile<cr>
map <leader>T :VroomRunNearestTest<cr>
map <leader>l :VroomRunLastTest<cr>

" Vimux
map <leader>vz :VimuxZoomRunner<CR>
map <leader>vq :VimuxCloseRunner<CR>

" Ag
let g:ag_working_path_mode="r"
let g:ag_highlight=1

" Search {
function! VisualSelection()
  try
  let a_save = @a
  normal! gv"ay
  return @a
  finally
  let @a = a_save
  endtry
endfunction
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|tags'

function! SearchProjectForSelect()
   exec ":Ag! \"" . VisualSelection() . "\""
endfunction

map <leader>s :call SearchProjectForSelect()<cr>

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Bundle "altercation/vim-colors-solarized"

Plugin 'ctrlp.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'ervandew/supertab'
Plugin 'rstacruz/sparkup'
Plugin 'gregsexton/matchtag'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-endwise'
Plugin 'rking/ag.vim'
Plugin 'mxw/vim-jsx'
Plugin 'benmills/vimux'
Plugin 'tpope/vim-fugitive'

Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'craigemery/vim-autotag'

Plugin 'slim-template/vim-slim'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'posva/vim-vue'

Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'skalnik/vim-vroom'
Plugin 'tpope/vim-bundler'

" Python
Plugin 'python/black'
autocmd BufWritePre *.py execute ':Black'

call vundle#end()

filetype plugin indent on

" Color Scheme
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

highlight ExtraWhitespace ctermbg=red guibg=red
let g:SuperTabDefaultCompletionType = "context"
