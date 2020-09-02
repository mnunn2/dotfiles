set nocompatible
call plug#begin('~/.local/share/nvim/')

Plug 'joonty/vdebug'

Plug 'christoomey/vim-tmux-navigator'

" colour scheme & status line
Plug 'morhetz/gruvbox'
" Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'git://github.com/tpope/vim-surround.git'
Plug 'psliwka/vim-smoothie'
Plug 'ludovicchabant/vim-gutentags'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'jmckiern/vim-venter'

Plug 'preservim/nerdtree'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'vimwiki/vimwiki'
" Plug 'mzlogin/vim-markdown-toc'

" PHP stuff
Plug 'StanAngeloff/php.vim'
Plug 'git://github.com/majutsushi/tagbar.git'

" html & javascript
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
" Plug 'https://github.com/pangloss/vim-javascript.git'
Plug 'yuezk/vim-js'
Plug 'storyn26383/vim-vue'
Plug 'digitaltoad/vim-pug'

Plug 'edkolev/tmuxline.vim'
" golang stuff
"Plug 'https://github.com/fatih/vim-go.git'

call plug#end()

let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = {
    \'a'    : '#P',
    \'b'    : '#(cd #{pane_current_path}; git rev-parse --abbrev-ref HEAD)',
    \'c'    : '#H',
    \'cwin' : '#W',
    \'win'  : '#W',
    \'x'    : '#{?client_prefix,Prefix,      }',
    \'y'    : ['%a', '%e-%b-%Y', '%l:%M%p'],
    \'z'    : '#T'}

let mapleader="\<SPACE>"
set noshowmode
set modeline
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set splitbelow
set splitright
set nowrap
set timeoutlen=1000 ttimeoutlen=10
" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2

let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

let g:vdebug_options = {
\ 'break_on_open': 0,
\ 'port': '9000',
\ 'simplified_status': 0
\ }

" let php_folding=1
" set foldmethod=syntax

" Theme
syntax enable
colorscheme gruvbox
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark="medium"
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \ },
      \ 'component': {
      \   'filename': '%n %t',
      \ },
      \ }

nnoremap Y y$

:nnoremap <F8> :TagbarToggle<CR>

"Insert alt commands
inoremap <M-;> <C-o>A;
inoremap <M-l> <C-o>a

"Normal leader commands
nnoremap <Leader>n :set number! <bar> :set rnu!<CR>

"Edit & reload config
nnoremap <Leader>ve :e ~/.config/nvim/init.vim<CR>
nnoremap <Leader>vr :source ~/.config/nvim/init.vim<CR>

nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>c :noh<CR>

"Buffers
:nnoremap <leader>bo :buffers<CR>:vert sb<Space>
nnoremap <leader>bn :bnext<CR>

"experiments
noremap <leader>z :silent exec "!tmux resize-pane -Z"<CR>
noremap <leader>vc :VenterToggle<CR>
