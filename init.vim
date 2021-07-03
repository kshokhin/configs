call plug#begin('~/.config/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'plasticboy/vim-markdown'
Plug 'altercation/vim-colors-solarized'
"Plug 'ChaiScript/vim-chaiscript'
"Plug 'ChaiScript/vim-cpp'
"Plug 'Mizuchi/STL-Syntax'
Plug 'kien/rainbow_parentheses.vim'
Plug 'arecarn/crunch.vim'
Plug 'pboettch/vim-cmake-syntax'
Plug 'rhysd/vim-clang-format'
"Plug 'tpope/vim-liquid'
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'NLKNguyen/papercolor-theme'
Plug 'sjl/gundo.vim'
"Plug 'APZelos/blamer.nvim'
Plug 'dyng/ctrlsf.vim'

"let g:blamer_enabled = 1
"let g:python3_host_prog = 'python3'
"let g:ycm_python_binary_path = 'python3'
"Plug 'valloric/youcompleteme'
" Plug 'jaxbot/semantic-highlight.vim'
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'spolu/dwm.vim'
Plug 'terryma/vim-multiple-cursors'


Plug 'sbdchd/neoformat'

" let g:neoformat_enabled_cpp = ['clang-format']
" let g:neoformat_enabled_cmake = ['cmake-format']


Plug 'scrooloose/nerdcommenter'

"Fuzzy find
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'rust-lang/rust.vim'


call plug#end()

let g:doxygen_enhanced_color=1
let g:load_doxygen_syntax=1

set expandtab
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set lcs=trail:·,tab:»·
set list
set cursorline
set number
set relativenumber

set undofile

set spell spelllang=en_us
set spellcapcheck=""

set signcolumn=yes

"let g:ycm_confirm_extra_conf = 0
"let g:ycm_clangd_uses_ycmd_caching = 0
"let g:ycm_clangd_binary_path = exepath("clangd")

let g:airline_powerline_fonts=1
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

set background=dark
"set background=light
let g:gruvbox_contrast_light="hard"
let g:gruvbox_italic=1
let g:gruvbox_invert_signs=0
let g:gruvbox_improved_strings=0
let g:gruvbox_improved_warnings=1
let g:gruvbox_undercurl=1
let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox

let g:fzf_preview_window = []

:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a

map <C-p> :Files<CR>
vnoremap <C-h> :nohlsearch<CR>
nnoremap <C-h> :nohlsearch<CR>

noremap <leader>p :read !xsel --clipboard --output<cr>
noremap <leader>c :w !xsel -ib<cr><cr>


nnoremap <C-e> <Esc>
inoremap <C-e> <Esc>
vnoremap <C-e> <Esc>
snoremap <C-e> <Esc>
xnoremap <C-e> <Esc>
cnoremap <C-e> <C-c>
onoremap <C-e> <Esc>
lnoremap <C-e> <Esc>
tnoremap <C-e> <Esc>
map H ^
map L $
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"set t_Co=256
"colorscheme PaperColor
"let g:airline_theme='PaperColor'

"let g:solarized_termcolors = 256
"colorscheme solarized


let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'

let g:vim_markdown_frontmatter = 1
let g:vim_markdown_folding_disabled = 1


let g:vim_indent_guides_start_level = 2


set laststatus=2

set termguicolors
set ignorecase
set smartcase

autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

au VimEnter * RainbowParenthesesActivate
" Round disabled for CMakeLists.txt support...
"au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" au Syntax * RainbowParenthesesLoadChevrons

