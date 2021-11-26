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
Plug 'junegunn/fzf', {'tag': '*', 'dir': '~/.fzf', 'do': './install --bin'}
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-fugitive'
Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim' " depends on pelenary.nvim
Plug 'junegunn/gv.vim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'psf/black', {'tag': '*'}
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
let g:gruvbox_material_palette = 'original'
let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_enable_bold = 1

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
nnoremap <silent> <F6> :<C-u>lcd %:h<CR>

map q <Nop>

" NERDCommenter
let g:NERDDefaultAlign = 'left'

" nvim-tree
lua require('config.nvim-tree')
nnoremap <silent> <leader>et :NvimTreeToggle<CR>
nnoremap <silent> <leader>ef :NvimTreeFindFileToggle<CR>
nnoremap <silent> <leader>er :NvimTreeRefresh<CR>

" Bufferline
lua require("config.bufferline")
nnoremap <silent> ]b :BufferLineCycleNext<CR>
nnoremap <silent> [b :BufferLineCyclePrev<CR>

" Neoformat
let g:neofomat_try_formatprg = 1
nnoremap <silent> <space>f :<C-u>Neoformat<CR>

" Ctags
set tags+=tags;~/

" vim-qf
" ------
nmap <Leader>qq <Plug>(qf_qf_toggle)
nmap <Leader>ql <Plug>(qf_loc_toggle)
nmap <silent> [q <Plug>(qf_qf_previous)
nmap <silent> ]q <Plug>(qf_qf_next)
nmap <silent> [l <Plug>(qf_loc_previous)
nmap <silent> ]l <Plug>(qf_loc_next)

" fzf
" ---
nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>fg :GFiles<CR>
nnoremap <silent> <leader>fb :Buffers<CR>

" vim-better-whitespace
" ---------------------
" disable highlighting trailing whitespace by default.
" (perform :ToggleWhitespace to enable highlighting)
let g:better_whitespace_guicolor = '#fb4934'
let g:better_whitespace_ctermcolor = 167
nnoremap <silent> <leader>w :ToggleWhitespace<CR>
vnoremap <silent> <leader>sw :StripWhitespace<CR>
nnoremap <silent> <leader>sw :StripWhitespace<CR>

" multiple cursors
"-----------------
let g:multiple_cursor_use_default_mapping=0
let g:multiple_cursor_next_key='<C-n>'
let g:multiple_cursor_prev_key='<C-h>'
let g:multiple_cursor_skip_key='<C-x>'
let g:multiple_cursor_quit_key='<Esc>'

" indent-blankline.nvim
lua require("config.indent-blankline")

" diffview.nvim
lua require("config.diffview")

" nvim-treesitter
lua require('config.nvim-treesitter')

" coc.nvim
" --------
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" use <c-n> for trigger completion
inoremap <silent><expr> <C-n> pumvisible() ? "\<C-n>" : coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[d` and `]d` to navigate diagnostics
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for format selected region
xmap <leader>cf <Plug>(coc-format-selected)
nmap <leader>cf <Plug>(coc-format)

" coc-git
nmap <silent> [g <Plug>(coc-git-prevchunk)
nmap <silent> ]g <Plug>(coc-git-nextchunk)
nmap <silent> [c <Plug>(coc-git-prevconflict)
nmap <silent> ]c <Plug>(coc-git-nextconflict)

command! -nargs=0 Prettier :CocCommand prettier.formatFile
nnoremap <silent> <leader>cp :Prettier<CR>

" CocList
nnoremap <silent> <nowait> <leader>ld :<C-u>CocList diagnostics<CR>
nnoremap <silent> <nowait> <leader>le :<C-u>CocList extensions<CR>
nnoremap <silent> <nowait> <leader>lc :<C-u>CocList commands<CR>
nnoremap <silent> <nowait> <leader>lr :<C-u>CocListResume<CR>
nnoremap <silent> <nowait> <space>j :<C-u>CocNext<CR>
nnoremap <silent> <nowait> <space>k :<C-u>CocPrev<CR>

" Language specific configuration
" Remap keys for tagging in go
nnoremap <Plug>(GoTagsAddLine) :<C-u>CocCommand go.tags.add.line<CR>
nnoremap <Plug>(GoTagsRemoveLine) :<C-u>CocCommand go.tags.remove.line<CR>
nnoremap <Plug>(GoTagsClearTagLine) :<C-u>CocCommand go.tags.clear.line<CR>
autocmd FileType go nmap <silent> tj <Plug>(GoTagsAddLine)
autocmd FileType go nmap <silent> tr <Plug>(GoTagsRemoveLine)
autocmd FileType go nmap <silent> tx <Plug>(GoTagsClearTagLine)
