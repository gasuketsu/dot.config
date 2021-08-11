" Be improved
set nocompatible
filetype plugin indent on
syntax enable

" vim-plug
let s:plug = {
      \ "plugs": get(g:, 'plugs', {})
      \ }

function! s:plug.is_installed(name)
  return has_key(self.plugs, a:name) ? isdirectory(self.plugs[a:name].dir) : 0
endfunction

let s:plugged_dir = '~/.local/share/nvim/plugged'

call plug#begin(expand(s:plugged_dir))
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'romainl/vim-qf'
Plug 'junegunn/fzf', {'tag': '*', 'dir': '~/.fzf', 'do': './install --bin'}
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'rhysd/vim-clang-format'
Plug 'Yggdroot/indentLine'
Plug 'psf/black', {'tag': '*'}
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Color Schemes
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
call plug#end()

"-----------------------------
" Visual configuration
"-----------------------------
" Enable truecolor
set termguicolors

" Colorscheme
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_contrast_light='medium'
let g:gruvbox_invert_selection=0
let g:gruvbox_italic=1
let g:gruvbox_material_palette = 'original'
let g:gruvbox_material_enable_bold = 1

set background=dark
colorscheme gruvbox-material

" statusline (airline)
let g:airline_theme = 'gruvbox_material'
let g:airline#extensions#tabline#enabled = 1

"-----------------------------
" Provider configuration
"-----------------------------
if has('pyx')
  set pyxversion=3
endif
let g:loaded_python_provider = 0
let g:python3_host_prog = $HOME.'/.config/nvim/py3nvim/.venv/bin/python'
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0

"-----------------------------
" Display configuration
"-----------------------------
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

"-----------------------------
" Editor configuration
"-----------------------------
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

"-----------------------------
" Ctags
"-----------------------------
set tags+=tags;~/

"-----------------------------
" Buffergator
"-----------------------------
let g:buffergator_viewport_split_policy = 'T'

"-----------------------------
" vim-qf
"-----------------------------
nmap <Leader>qq <Plug>(qf_qf_toggle)
nmap <Leader>ql <Plug>(qf_loc_toggle)
nmap <silent> [q <Plug>(qf_qf_previous)
nmap <silent> ]q <Plug>(qf_qf_next)
nmap <silent> [l <Plug>(qf_loc_previous)
nmap <silent> ]l <Plug>(qf_loc_next)

"-----------------------------
" fzf
"-----------------------------
nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>fg :GFiles<CR>
nnoremap <silent> <leader>fb :Buffers<CR>

"-----------------------------
" NERDCommenter
"-----------------------------
let g:NERDDefaultAlign = 'left'

"-----------------------------
" NERDTree
"-----------------------------
nnoremap <silent> <F3> :NERDTreeToggle<CR>

"-----------------------------
" vim-better-whitespace
"-----------------------------
" disable highlighting trailing whitespace by default.
" (perform :ToggleWhitespace to enable highlighting)
let g:better_whitespace_guicolor = '#fb4934'
let g:better_whitespace_ctermcolor = 167
nnoremap <silent> <leader>w :ToggleWhitespace<CR>
vnoremap <silent> <leader>sw :StripWhitespace<CR>
nnoremap <silent> <leader>sw :StripWhitespace<CR>

"-----------------------------
" multiple cursors
"-----------------------------
let g:multiple_cursor_use_default_mapping=0
let g:multiple_cursor_next_key='<C-n>'
let g:multiple_cursor_prev_key='<C-h>'
let g:multiple_cursor_skip_key='<C-x>'
let g:multiple_cursor_quit_key='<Esc>'

"--------------------------
" clang-format
"--------------------------
let g:clang_format#detect_style_file = 1
" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>Cf :ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>Cf :ClangFormat<CR>
" Toggle auto formatting:
nmap <Leader>Ct :ClangFormatAutoToggle<CR>

"----------------------------
" nvim-treesitter
"----------------------------
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = {}, -- list of language that will be disabled
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 10000,
  },
}
EOF

"-----------------------------
" coc.nvim
"-----------------------------
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Format on save
let format_on_save_filetypes = [
      \ 'python',
      \ 'go',
      \ ]
autocmd BufWritePre * if index(format_on_save_filetypes, &ft) >= 0 |
      \ call CocAction('format')

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

" Use `[g` and `]g` to navigate git chunks
nmap <silent> [g <Plug>(coc-git-prevchunk)
nmap <silent> ]g <Plug>(coc-git-nextchunk)

command! -nargs=0 Prettier :CocCommand prettier.formatFile
nnoremap <silent> <leader>cp :Prettier<CR>

" CocList
nnoremap <silent> <leader>cd :<C-u>CocList diagnostics<CR>
nnoremap <silent> <leader>ce :<C-u>CocList extensions<CR>
nnoremap <silent> <leader>cc :<C-u>CocList commands<CR>
nnoremap <silent> <leader>cr :<C-u>CocListResume<CR>

nnoremap <silent> <leader>cj :<C-u>CocNext<CR>
nnoremap <silent> <leader>ck :<C-u>CocPrev<CR>

" Language specific configuration
" Remap keys for tagging in go
nnoremap <Plug>(GoTagsAddLine) :<C-u>CocCommand go.tags.add.line<CR>
nnoremap <Plug>(GoTagsRemoveLine) :<C-u>CocCommand go.tags.remove.line<CR>
nnoremap <Plug>(GoTagsClearTagLine) :<C-u>CocCommand go.tags.clear.line<CR>
autocmd FileType go nmap <silent> tj <Plug>(GoTagsAddLine)
autocmd FileType go nmap <silent> tr <Plug>(GoTagsRemoveLine)
autocmd FileType go nmap <silent> tx <Plug>(GoTagsClearTagLine)


" Post hook to source machine-specific configuration
" (should be put at the last of this file)
let s:local_rc = expand($HOME.'/.nvimrc_local')
if filereadable(s:local_rc)
  execute 'source' s:local_rc
endif
