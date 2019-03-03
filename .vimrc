set nocompatible              " be iMproved, required
filetype off                  " required

" vim plug
call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'git://git.wincent.com/command-t.git'
Plug 'jiangmiao/auto-pairs'
Plug 'git://github.com/tpope/vim-surround.git'
" colour scheme
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/promptline.vim'
" Plug 'edkolev/tmuxline.vim'

" PHP stuff
Plug 'StanAngeloff/php.vim'
Plug 'joonty/vdebug'
" Plug 'joonty/vim-phpqa.git'
Plug 'christoomey/vim-tmux-navigator'
Plug 'git://github.com/majutsushi/tagbar.git'

" html & javascript
Plug 'othree/html5.vim'
Plug 'https://github.com/pangloss/vim-javascript.git'
Plug 'https://github.com/vim-syntastic/syntastic.git'

" golang stuff
Plug 'https://github.com/fatih/vim-go.git'

Plug 'mattn/emmet-vim'

" Initialize plugin system
call plug#end()

" Mikes stuff
" Hard tab
"set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set modeline
set ruler
set termguicolors
let mapleader="\<SPACE>"
set showcmd
set showmatch
set showmode
set background=dark
set splitbelow
set splitright
set colorcolumn=100
"set t_8f=\[[38;2;%lu;%lu;%lum
"set t_8b=\[[48;2;%lu;%lu;%lum
"set termguicolors
set noshowmode
set number
set relativenumber
" syntastic stuff ************
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_html_checkers = ['validator', 'w3']
let g:syntastic_html_validator_parser = 'html5'
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_php_phpcs_args = "--standard=PSR2"
let g:syntastic_javascript_checkers=['eslint']
nnoremap <Leader>qa :SyntasticToggleMode<CR>
" end syntastic stuff ***********
colorscheme gruvbox
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_italic=1
"colorscheme solarized

let g:promptline_preset = {
        \'c' : [ promptline#slices#cwd() ],
        \'y' : [ promptline#slices#vcs_branch() ],
        \'warn' : [ promptline#slices#last_exit_code() ]}

" phpqa stuff
" let g:phpqa_codesniffer_args = "--standard=Joomla"

" tagbar stuff
nmap <F8> :TagbarToggle<CR>
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

" use % to match tags
runtime macros/matchit.vim
" vdebug config
let g:vdebug_options = {
\ 'break_on_open': 1,
\ 'path_maps': {'/var/www/html': '/home/mike/dev/jdd/webdata'},
\ 'port': '9000',
\ 'watch_window_style': 'compact'
\ }

" emmet remap c-y to vim leader
let g:user_emmet_leader_key='<C-Z>'

" Put at the very end of your .vimrc file.
" https://github.com/StanAngeloff/php.vim.git
function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END
nmap <leader>1 :!tmux send-keys -t fred:1.1 Escape k Enter<CR><CR>
nmap <leader>2 :!tmux send-keys -t fred:1.2 Escape k Enter<CR><CR>
nmap <leader>3 :!tmux send-keys -t fred:1.3 Escape k Enter<CR><CR>
nmap <leader>4 :!tmux send-keys -t fred:1.4 Escape k Enter<CR><CR>
"execute "set <M-;>=^[;"
inoremap <m-;> <C-o>A;
inoremap <m-l> <C-o>a
"nnoremap ; :
nnoremap Y y$
