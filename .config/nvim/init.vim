" ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
" ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
" ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
" ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
" ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
" ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

" =======================================================
"                         VIM-PLUG
"       https://github.com/junegunn/vim-plug#neovim
" =======================================================

"                     Franklin Souza
"                       @frannksz
"
" =======================================================
"                         PLUGINS
" =======================================================

call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'} "Auto-Complete
Plug 'preservim/nerdcommenter' "NerdCommenter
Plug 'ryanoasis/vim-devicons' "Icons File Manager
Plug 'preservim/nerdtree' "NerdTree
Plug 'sheerun/vim-polyglot' "Syntax
Plug 'tc50cal/vim-terminal' "Terminal
Plug 'dense-analysis/ale' "Syntax Check
Plug 'nvim-tree/nvim-web-devicons' "WebDevIcons
Plug 'nvim-lualine/lualine.nvim' "Lualine
Plug 'AlphaTechnolog/pywal.nvim', { 'as': 'pywal' } "LualinePywal
Plug '907th/vim-auto-save' "AutoSave
Plug 'lukas-reineke/indent-blankline.nvim' "Indent Blank
Plug 'nvim-lua/plenary.nvim' "Indent Blank
Plug 'nvim-telescope/telescope-file-browser.nvim' "Telescope
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' } "Indent Blank
Plug 'tamton-aquib/staline.nvim' "Statusline
Plug 'norcalli/nvim-colorizer.lua' "Colorizer
Plug 'https://github.com/itchyny/calendar.vim' "Calendar
Plug 'akinsho/bufferline.nvim', { 'tag': '*' } "Bufferline
Plug 'zaldih/themery.nvim' "Themery
Plug 'nvimdev/dashboard-nvim' "Dashboard
Plug 'mfussenegger/nvim-dap' "Nvim-Dap
Plug 'neovim/nvim-lspconfig' "Nvim-Lspconfig
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
call plug#end()

" =======================================================
"                           THEMES
" =======================================================
Plug 'morhetz/gruvbox'
Plug 'navarasu/onedark.nvim'
Plug 'tanvirtin/monokai.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' }
Plug 'AlexvZyl/nordic.nvim', { 'branch': 'main' }
Plug 'xero/miasma.nvim'
Plug 'comfysage/evergarden'
Plug 'shrikecode/kyotonight.vim'
Plug 'romainl/Apprentice'
Plug 'rose-pine/neovim'
Plug 'scottmckendry/cyberdream.nvim'
Plug 'sho-87/kanagawa-paper.nvim'
Plug 'sainnhe/sonokai'
Plug 'qaptoR-nvim/chocolatier.nvim'
Plug 'Mofiqul/dracula.nvim'

call plug#end()

" =======================================================
"                       THEMES APLLY
" =======================================================
set bg=dark "litght (Tema Claro), dark (Tema Escuro)
"color onedark
"color gruvbox
"color nordic
"color monokai
"color catppuccin
"color moonfly
"color miasma
"color evergarden
"color kyotonight
"color apprentice
"color rose-pine-moon
"color cyberdream
"color kanagawa-paper
"color sonokai
"color chocolatier
"color dracula
"color dracula-soft

" =======================================================
"                       CONFIGS NEOVIM
" =======================================================
set cursorline
highlight clear CursorLine
highlight CursorLine ctermbg=235
set tabstop=4
set number
set autoindent
set wildmenu
set laststatus=2
set confirm
set title
set mouse=a
syntax on
filetype on
set termguicolors
set expandtab
set shiftwidth=2
set encoding=utf-8
set autowrite
set noswapfile
set hidden
set inccommand=split
set clipboard=unnamedplus
set incsearch ignorecase smartcase hlsearch
set guifont=Fira\ Code:12
"set incsearch
"set encoding=UTF-8
"set relativenumber

" =======================================================
"                         NERDTREE
" =======================================================
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = ''
let g:webdevicons_enable = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:WebDevIconsUnicodeDecorateFileNodes = 1
nnoremap <C-l> :NERDTreeToggle<CR>
"=======================================================

" =======================================================
"                        OTHERS CONFIGS
" =======================================================

"Pyright
lua << EOF
require"mason".setup {}
require 'lspconfig'.pyright.setup {}
EOF

let mapleader="\<space>" "Leader Key

"Terminal
nnoremap <leader>t :vsplit term://zsh<cr>A

"Duplicate Line
nnoremap <c-d> <esc>:t.<cr>

"Comment Code
nmap <C-/>   <Plug>NERDCommenterToggle
xmap <C-/>   <Plug>NERDCommenterToggle<CR>

"Keyboard map
map <C-t> :Themery<CR>
map <C-m> :Mason<CR>
map <C-q> :q!<CR>
map <C-c> :Calendar<CR>
map <C-s> :w!<CR>
map <C-x> :s/$/
map <C-i> :ShowEmoji<CR>
map <F8> :colorscheme wal<CR>
map \ :AutoSaveToggle<CR> 
map q :q<CR>
map r :PlugInstall<CR>
map t :Tutor<CR>

nnoremap <C-k> :call OpenVnewInput()<CR>

function! OpenVnewInput()
  let l:filename = input("Digite o nome do arquivo: ", '', 'file')
  if !empty(l:filename)
    execute "vnew " . l:filename
  endif
endfunction


"Mover bloco de código selecionado
"vnoremap J :m '>+1<CR>gv=gv
"vnoremap K :m '<-2<CR>gv=gv

"Move Lines
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

"Definir o atalho para ativar/desativar números de linha
nnoremap <F2> :set invnumber<CR>

"Definir o atalho para ativar/desativar o relativenumber
nnoremap <F3> :set relativenumber!<CR>

"Desinstalar pacote mason
nnoremap <C-u> :MasonUninstall<Space>

"Copiar e Colar
vmap cp "+y
nmap c "+p

"AutoComplete
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" =======================================================
"                         TELESCOPE
" =======================================================
nnoremap <F5> :Telescope<CR>
nnoremap <F6> :Telescope buffers<CR>
nnoremap <F7> :Telescope fd<CR>

" Mapeia a tecla <space>fb para abrir o file_browser do Telescope
nnoremap <silent> <space>fb :Telescope file_browser<CR>

" Abre o file_browser com o caminho do buffer atual
nnoremap <silent> <space>fb :Telescope file_browser path=%:p:h select_buffer=true<CR>

" Alternativamente, usando a API do Lua
nnoremap <silent> <space>fb :lua require("telescope").extensions.file_browser.file_browser()<CR>

" =======================================================
"                       LUA-PLUGINS
" =======================================================
lua dofile(vim.fn.stdpath('config') .. '/lua-plugins/lualine.lua')
lua dofile(vim.fn.stdpath('config') .. '/lua-plugins/colorizer.lua')
lua dofile(vim.fn.stdpath('config') .. '/lua-plugins/bufferline.lua')
lua dofile(vim.fn.stdpath('config') .. '/lua-plugins/themery.lua')
lua dofile(vim.fn.stdpath('config') .. '/lua-plugins/dashboard.lua')
