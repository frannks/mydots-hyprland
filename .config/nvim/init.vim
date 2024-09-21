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

" Franklin Souza
" @frannksz

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
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' } "Indent Blank
Plug 'tamton-aquib/staline.nvim' "Statusline
Plug 'norcalli/nvim-colorizer.lua' "Colorizer

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

call plug#end()

" =======================================================
"                       THEMES APLLY
" =======================================================
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
color kanagawa-paper
"color sonokai

" =======================================================
"                       CONFIGS NEOVIM
" =======================================================
set cursorline
highlight clear CursorLine
highlight CursorLine ctermbg=235
"set incsearch
"set relativenumber
set number
set autoindent
set wildmenu
set laststatus=2
set confirm
"set tabstop=4
set title
set mouse=a
syntax on
filetype on
set termguicolors
set expandtab
set shiftwidth=2
"set encoding=UTF-8
set encoding=utf-8
set autowrite
set noswapfile
set hidden
set inccommand=split
set guifont=Fira\ Code:9.5
set clipboard=unnamedplus
set incsearch ignorecase smartcase hlsearch
set bg=dark

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
let mapleader="\<space>" "Leader Key

"Inicializa o colorizer
lua require'colorizer'.setup()

"Ativa o Colorizer automaticamente em cada buffer aberto ou criado
autocmd BufReadPost,BufNewFile * lua require'colorizer'.attach_to_buffer(0)

"Terminal
nnoremap <leader>t :vsplit term://zsh<cr>A

"Duplicate Line
nnoremap <c-d> <esc>:t.<cr>

"Comment Code
nmap <C-/>   <Plug>NERDCommenterToggle
xmap <C-/>   <Plug>NERDCommenterToggle<CR>

"Keyboard map
map q :q<CR>
map <C-q> :q!<CR>
map <C-s> :w!<CR>
map t :Tutor<CR>
map r :PlugInstall<CR>
map <C-k> :vnew<CR>
map <C-x> :s/$/
map \ :AutoSaveToggle<CR> 
map <F8> :colorscheme wal<CR>

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

"Fonts
"Aumentar o tamanho da fonte
nnoremap <C-=> :exe "normal! \<C-w>>"<CR>
"Diminuir o tamanho da fonte
nnoremap <C--> :exe "normal! \<C-w><"<CR>

"Restaurar o tamanho da fonte para o valor padrão
nnoremap <C-0> :exe "normal! \<C-w>="<CR>

"Copiar e Colar
vmap cp "+y
nmap c "+p

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" =======================================================
"                         TELESCOPE
" =======================================================
nnoremap <F5> :Telescope<CR>
nnoremap <F6> :Telescope buffers<CR>
nnoremap <F7> :Telescope fd<CR>

" =======================================================
"                 COC-EXTENSIONS-INSTALL
" =======================================================
function! CheckAndInstallCocExtensions()

  "Caminho para o arquivo de verificação
  let l:install_flag = stdpath('data') . '/coc_extensions_installed'

  "Se o arquivo de verificação existir, não faz nada
  if filereadable(l:install_flag)
    return
  endif

  "Lista de extensões Coc
  let l:extensions = ['coc-pairs', 'coc-sh', 'coc-python', 'coc-css']

  "Checa e instala as extensões ausentes
  for l:ext in l:extensions
    if empty(glob(stdpath('data') . '/plugged/coc.nvim/extensions/node_modules/' . l:ext))
      execute 'CocInstall ' . l:ext
    endif
  endfor

  "Cria o arquivo de verificação após instalar as extensões
  call writefile([], l:install_flag)
endfunction
" =======================================================================================================

"Executa a função uma única vez durante o start do Vim
autocmd VimEnter * call CheckAndInstallCocExtensions()

"Executa a função durante o start do Vim
autocmd VimEnter * call CheckAndInstallCocExtensions()

" =======================================================
"                       LUALINE
" =======================================================
lua << END
require('lualine').setup{
  options = {
  theme = 'pywal-nvim',
  icons_enable = true,
  section_separators = { left = '', right = '' },
  component_separators = { left = '', right = '' },
  disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
  },
}

