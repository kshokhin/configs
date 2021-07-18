call plug#begin('~/.config/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'plasticboy/vim-markdown'
Plug 'altercation/vim-colors-solarized'
Plug 'kien/rainbow_parentheses.vim'
Plug 'arecarn/crunch.vim'
Plug 'pboettch/vim-cmake-syntax'
Plug 'rhysd/vim-clang-format'
Plug 'NLKNguyen/papercolor-theme'
Plug 'sjl/gundo.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'

"Language server plugin
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'nvim-lua/completion-nvim'

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

set completeopt=menuone,noinsert,noselect
set shortmess+=c

let g:airline_powerline_fonts=1
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

set background=dark
let g:gruvbox_contrast_light="hard"
let g:gruvbox_italic=1
let g:gruvbox_invert_signs=0
let g:gruvbox_improved_strings=0
let g:gruvbox_improved_warnings=1
let g:gruvbox_undercurl=1
let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox

let g:fzf_preview_window = []

:nmap <c-s> <space>f:w<CR>
:imap <c-s> <Esc><space>f:w<CR>a

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
nmap <silent> gd <Cmd>lua vim.lsp.buf.definition()<CR>
nmap <silent> <space>f <Cmd>lua vim.lsp.buf.formatting()<CR>
nmap <silent> gi <Cmd>lua vim.lsp.buf.implementation()<CR>
nmap <silent> gr <Cmd>lua vim.lsp.buf.references()<CR>

let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'

let g:vim_markdown_frontmatter = 1
let g:vim_markdown_folding_disabled = 1


let g:vim_indent_guides_start_level = 2

"Language servers setup
lua << EOF
local nvim_lsp = require'lspconfig'

local on_attach = function(client)
    require'completion'.on_attach(client)
end

nvim_lsp.rust_analyzer.setup({
    on_attach=on_attach,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "module",
                importPrefix = "by_self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    }
})

nvim_lsp.clangd.setup{
    on_attach=on_attach,
    cmd = { "clangd-12", "--background-index", "--fallback-style=none" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_dir = nvim_lsp.util.root_pattern("compile_commands.json", "build/compile_commands.json", "compile_flags.txt", ".git") or dirname
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)
EOF

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

