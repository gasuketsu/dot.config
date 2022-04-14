" Be improved
set nocompatible
filetype plugin indent on
syntax enable

" vim-plug
let s:plug = {"plugs": get(g:, 'plugs', {})}

function! s:plug.is_installed(name)
  return has_key(self.plugs, a:name) ? isdirectory(self.plugs[a:name].dir) : 0
endfunction

let s:plugged_dir = '~/.local/share/nvim/plugged'

call plug#begin(expand(s:plugged_dir))
Plug 'preservim/nerdcommenter'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua' " depends on nvim-web-devicons
Plug 'akinsho/bufferline.nvim' " depends on nvim-web-devicons
Plug 'sbdchd/neoformat'
Plug 'romainl/vim-qf'
Plug 'editorconfig/editorconfig-vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-fugitive'
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'sindrets/diffview.nvim' " depends on plenary.nvim
Plug 'nvim-telescope/telescope.nvim' " depends on plenary.nvim
Plug 'junegunn/gv.vim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'
" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'ray-x/lsp_signature.nvim'
Plug 'onsails/lspkind-nvim'
" Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
" Golang specific
Plug 'mattn/vim-goaddtags'
Plug 'mattn/vim-goimports'
Plug 'mattn/vim-goimpl'
" Statusline
Plug 'nvim-lualine/lualine.nvim'
" ColorSchemes
Plug 'sainnhe/gruvbox-material'
call plug#end()

" Visual configuration
" --------------------
" Enable truecolor
set termguicolors

" Colorscheme
let g:gruvbox_material_palette = 'mix'
let g:gruvbox_material_statusline_style = 'mix'
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_diagnostic_virtual_text = 'colored'

set background=dark
colorscheme gruvbox-material

" Statusline (lualine)
lua require('config.lualine')

" Provider configuration
" ----------------------
let g:loaded_python_provider = 0
let g:python3_host_prog = $HOME.'/.config/nvim/py3nvim/.venv/bin/python'
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0

" Display configuration
" ---------------------
set shortmess+=cI
set shellslash
set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,cp932,iso-2022-jp

set number
set cursorline
set wrap
set list
set ambiwidth=single

set cmdheight=2
set laststatus=2
set showcmd
set display=lastline
set updatetime=300
set signcolumn=yes

" Editor configuration
" --------------------
set mouse=a
set nobackup
set nowritebackup
set noswapfile
set viminfo=
set noundofile

" enable to open other file in edit
set hidden

" wildmode(complement)
set wildmenu
set wildmode=list:longest
set wildignore+=*.o,*.obj,*.a,*.pyc,*.DS_Store,*.db,*/tmp/*,*.swp,*.zip,*.exe,*.dll,*.so,NTUSER*,ntuser*

" no beep
set vb t_vb=

" timeout
" may need to  put these settings into vimfiles/plugin/notimeout.vim
set notimeout
set ttimeout
set timeoutlen=200

" Default Indentation
set expandtab
set tabstop=2
set shiftwidth=2
set cindent
set cino=l1,:0,g0,(0,W4,m1

" enable to delete newline
set backspace=2

" Copy&Paste
set clipboard=unnamed

" Search behavior
set hlsearch
set ignorecase
set smartcase
set wrapscan
set inccommand=split

" Yank to end of line
nnoremap Y y$
" turn off search highlighting until the next search
nnoremap <silent> <C-l> :nohl<CR>
" change current directory when changing buffer
nnoremap <silent> CD <cmd>lcd %:h<CR>

map q <Nop>

" NERDCommenter
let g:NERDDefaultAlign = 'left'

" nvim-tree
lua require('config.nvim-tree')
nnoremap <silent> <leader>et <cmd>NvimTreeToggle<CR>
nnoremap <silent> <leader>ef <cmd>NvimTreeFindFileToggle<CR>
nnoremap <silent> <leader>er <cmd>NvimTreeRefresh<CR>

" Bufferline
lua require("config.bufferline")
nnoremap <silent> <A-.> <cmd>BufferLineCycleNext<CR>
nnoremap <silent> <A-,> <cmd>BufferLineCyclePrev<CR>

" Neoformat
let g:neofomat_try_formatprg = 1
nnoremap <silent> <A-f> <cmd>Neoformat<CR>

" Ctags
set tags+=tags;~/

" vim-qf
" ------
nmap <leader>qq <Plug>(qf_qf_toggle)
nmap <leader>ql <Plug>(qf_loc_toggle)
nmap <silent> [q <Plug>(qf_qf_previous)
nmap <silent> ]q <Plug>(qf_qf_next)
nmap <silent> [l <Plug>(qf_loc_previous)
nmap <silent> ]l <Plug>(qf_loc_next)

" Telescope
" ---
nnoremap <silent> <leader>ff <cmd>Telescope find_files<CR>
nnoremap <silent> <leader>fg <cmd>Telescope git_files<CR>
nnoremap <silent> <leader>fb <cmd>Telescope buffers<CR>
nnoremap <silent> <leader>fG <cmd>Telescope live_grep<CR>
nnoremap <silent> <leader>fh <cmd>Telescope help_tags<CR>

" vim-better-whitespace
" ---------------------
" disable highlighting trailing whitespace by default.
" (perform :ToggleWhitespace to enable highlighting)
let g:better_whitespace_guicolor = '#fb4934'
let g:better_whitespace_ctermcolor = 167
nnoremap <silent> <leader>w <cmd>ToggleWhitespace<CR>
vnoremap <silent> <leader>sw <cmd>StripWhitespace<CR>
nnoremap <silent> <leader>sw <cmd>StripWhitespace<CR>

" multiple cursors
"-----------------
let g:multiple_cursor_use_default_mapping=0
let g:multiple_cursor_next_key='<C-n>'
let g:multiple_cursor_prev_key='<C-h>'
let g:multiple_cursor_skip_key='<C-x>'
let g:multiple_cursor_quit_key='<Esc>'

" indent-blankline.nvim
lua require("config.indent-blankline")
" gitsigns
lua require("config.gitsigns")
" diffview.nvim
lua require("config.diffview")
" telescope.nvim
lua require("config.telescope")
" nvim-treesitter
lua require("config.nvim-treesitter")
" LSP
lua require("config.lsp")
" Completion
lua require("config.completion")
