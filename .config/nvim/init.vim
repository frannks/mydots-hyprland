"Vim-Plug
"https://github.com/junegunn/vim-plug#neovim

" //////////////////////////////////////////////////////

call plug#begin('~/.config/nvim/plugged')

"Auto-Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Commenter
Plug 'preservim/nerdcommenter'

"Icons File Manager
Plug 'ryanoasis/vim-devicons'

"NerdTree
Plug 'preservim/nerdtree'

"Syntax
Plug 'sheerun/vim-polyglot'

"Terminal
Plug 'tc50cal/vim-terminal'

"Multiple Cursores
Plug 'terryma/vim-multiple-cursors'

"Syntax Check
Plug 'dense-analysis/ale'

"VirtualEnv
Plug 'jmcantrell/vim-virtualenv'

"WebDevIcons
Plug 'nvim-tree/nvim-web-devicons'

"Lualine
Plug 'nvim-lualine/lualine.nvim'

"Lualine-Pywal
Plug 'AlphaTechnolog/pywal.nvim', { 'as': 'pywal' }

"Minimap
"Plug 'koron/minimap-vim'
"Plug 'wfxr/minimap.vim'

"AutoSave
Plug '907th/vim-auto-save'

"QuickRun
Plug 'thinca/vim-quickrun'

"Fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

"Indent Blank
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"Statusline
Plug 'tamton-aquib/staline.nvim'

"Scrolling
Plug 'karb94/neoscroll.nvim'

"Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }

call plug#end()
 
"Cursor
set cursorline
highlight clear CursorLine
highlight CursorLine ctermbg=235

"Set Nvim
set number
"set incsearch
set autoindent
set wildmenu
set laststatus=2
set confirm
"set tabstop=4
set title
set mouse=a
"set relativenumber
"syntax on
filetype on
"set termguicolors
set expandtab
set shiftwidth=2
"set encoding=UTF-8
set encoding=utf-8
set autowrite
"set cursorline
set noswapfile
set hidden
set inccommand=split
set guifont=Fira\ Code:9.5
set clipboard=unnamedplus
set incsearch ignorecase smartcase hlsearch

"Leader Key
let mapleader="\<space>"

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:webdevicons_enable = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:WebDevIconsUnicodeDecorateFileNodes = 1

" Minimap
"let g:minimap_width = 20
"let g:minimap_auto_start = 1
"let g:minimap_auto_start_win_enter = 1
"hi MinimapCurrentLine ctermfg=Green guifg=#50FA7B guibg=#32302f
"let g:minimap_highlight = 'MinimapCurrentLine'
"let g:minimap_highlight_range = 1

"Terminal
nnoremap <leader>t :vsplit term://zsh<cr>A

"Ale
nnoremap <F9> :ALEFix<cr>

"NerdTree
nnoremap <C-l> :NERDTreeToggle<CR>

"Duplicate Line
nnoremap <c-d> <esc>:t.<cr>

"Cgn
nnoremap <C-c> cgn<cr>

"Comment Code
nmap <C-/>   <Plug>NERDCommenterToggle
xmap <C-/>   <Plug>NERDCommenterToggle<CR>

"Map
map q :q<CR>
map <C-q> :q!<CR>
map <C-s> :w!<CR>
map t :Tutor<CR>
map r :PlugInstall<CR>
map <C-k> :vnew<CR>
map <C-x> :s/$/
map \ :AutoSaveToggle<CR> 
map <F8> :colorscheme wal<CR>
map <C-i> :FZF<CR>

"Mover bloco de código selecionado
"vnoremap J :m '>+1<CR>gv=gv
"vnoremap K :m '<-2<CR>gv=gv

"Move Lines
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

"Lista suspensa
inoremap <silent><expr> <c-space> coc#refresh()

"Definir o atalho para ativar/desativar números de linha
nnoremap <F2> :set invnumber<CR>

"Definir o atalho para ativar/desativar o relativenumber
nnoremap <F3> :set relativenumber!<CR>

" ==================================
" Fonts
" Aumentar o tamanho da fonte
nnoremap <C-=> :exe "normal! \<C-w>>"<CR>
" Diminuir o tamanho da fonte
nnoremap <C--> :exe "normal! \<C-w><"<CR>

" Restaurar o tamanho da fonte para o valor padrão
nnoremap <C-0> :exe "normal! \<C-w>="<CR>

" ==================================

"Copiar e Colar
vmap cp "+y
nmap c "+p

"Markdown
nmap <C-p> <Plug>MarkdownPreviewToggle

"Make <CR> to accept selected completion item or notify coc.nvim to format
"<C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


"Lualine
lua << END
require('lualine').setup{
  options = {
  theme = 'pywal-nvim',
  icons_enable = true,
  section_separators = { left = '', right = '' },
  component_separators = { left = '', right = '' }
},
}
