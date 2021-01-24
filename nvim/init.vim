" ---------------------------- "
"  NeoVim Config File 
"  Author: AarKiMos (Aachman Mittal)
"  Email: m.aachman@gmail.com
" ---------------------------- "


" Using VimPlug for External Pluins "
call plug#begin('~/.data/plugged')

" NerdTree
Plug 'scrooloose/nerdtree'                      " File Explorer
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  " For better colorscheme in nerdtree
Plug 'ryanoasis/vim-devicons'                   " For file icons in nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'              " For git status in nerdtree explorer

" Syntax and AutoComplete
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intellesense and autocompletion
" Plug 'scrooloose/syntastic'                     " For Syntax Checking
Plug 'plasticboy/vim-markdown'                  " Markdown folding
Plug 'rust-lang/rust.vim'                       " Rust Language support
Plug 'jackguo380/vim-lsp-cxx-highlight'

" Utilities
Plug 'airblade/vim-gitgutter'                   " For git diff in number line
Plug 'bling/vim-bufferline'                     " For listing buffers in status line
Plug 'moll/vim-bbye'                            " For better buffer delete and wipeout management
Plug 'mg979/vim-visual-multi', {'branch': 'master'} " For Multiple Cursors
Plug 'zhou13/vim-easyescape'                    " Escape insert mode with jk or kj but with a timeout
Plug 'scrooloose/nerdcommenter'                 " comment uncomment any line with keybind

" Appearance
Plug 'vim-airline/vim-airline'                  " For better status line
Plug 'rakr/vim-one'                             " Theme             
Plug 'jaredgorski/SpaceCamp'                    " Theme
Plug 'ParamagicDev/vim-medic_chalk'             " Theme
Plug 'atahabaki/archman-vim'                    " Theme
Plug 'vim-airline/vim-airline-themes'           " Themes for vim airline

call plug#end()

" ======================= Appearance ========================
colorscheme medic_chalk
set background=dark
let g:airline_theme = 'minimalist'
let g:airline#extensions#tabline#enabled = 1
let g:bufferline_echo = 0
set termguicolors



set updatetime=100
set number
set showcmd                     " Show me what I'm typing
set noswapfile                  " Don't use swapfile
set nobackup			" Don't create annoying backup files
set nowritebackup

set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows

set encoding=utf-8              " Set default encoding to UTF-8
set autowrite                   " Automatically save before :next, :make etc.
set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2
set hidden
set ruler                       " Show the cursor position all the time
au FocusLost * :wa              " Set vim to save the file on focus out.

set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats

set noshowmode                  " We show the mode with airline or lightline
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
set ttyfast
set lazyredraw                  " Wait to redraw "

" speed up syntax highlighting
set nocursorcolumn
set nocursorline

syntax sync minlines=256
set synmaxcol=300
set re=1

" do not hide markdown
set conceallevel=0

" open help vertically
command! -nargs=* -complete=help Help vertical belowright help <args>
autocmd FileType help wincmd L

" Make Vim to handle long lines nicely.
set wrap
set textwidth=80
set formatoptions=qrn1

" Do not use relative numbers to where the cursor is.
set norelativenumber

" Apply the indentation of the current line to the next line.
set autoindent
set smartindent
set complete-=i
set showmatch
set smarttab

set tabstop=8
set shiftwidth=8
set expandtab

set nrformats-=octal
set shiftround

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone

if &history < 1000
  set history=50
endif

if &tabpagemax < 50
  set tabpagemax=50
endif

if !empty(&viminfo)
  set viminfo^=!
endif

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" If linux then set ttymouse
let s:uname = system("echo -n \"$(uname)\"")
if !v:shell_error && s:uname == "Linux" && !has('nvim')
  set ttymouse=xterm
endif



" =============== Key Mappings =========================
" CTRL-U in insert mode deletes a lot.	Use CTRL-G u to first break undo, so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Buffer cycling < only in nvim >
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>

" escape insert mode 
" inoremap jk <ESC> 



" =================== Syntastic ==================
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
" let g:syntastic_cpp_config_file = '$HOME/.config/nvim/coc/cpp_include_paths'
"

" =================== coc.nvim ===================
let g:coc_global_extensions = ['coc-cmake', 'coc-discord-rpc', 'coc-json', 'coc-markdownlint', 'coc-python', 'coc-sh', 'coc-git',
                                \ 'coc-snippets', 'coc-pairs', 'coc-prettier']
source $HOME/.config/nvim/coc/coc.vim



"==================== NerdTree ====================
" For toggling
" nmap <C-n> :NERDTreeToggle<CR>
noremap <Leader>n :NERDTreeToggle<cr>
noremap <Leader>f :NERDTreeFind<cr>

let NERDTreeShowHidden=1
let g:NERDTreeGitStatusWithFlags = 1

let NERDTreeIgnore=['\.vim$', '\~$', '\.git$', '.DS_Store']

" Close nerdtree and vim on close file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif




" ==================== NERDCommenter ===========================
"nnoremap <C-/> <Plug>NERDCommenterToggle
vmap <C-_> <plug>NERDCommenterToggle
nmap <C-_> <plug>NERDCommenterToggle

" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1


" ==================== vim-multiple-cursors ====================
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-i>'
let g:multi_cursor_prev_key='<C-y>'
let g:multi_cursor_skip_key='<C-b>'
let g:multi_cursor_quit_key='<Esc>'

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction







" ========= vim-markdown ==================

" disable folding
let g:vim_markdown_folding_disabled = 1

" Allow for the TOC window to auto-fit when it's possible for it to shrink.
" It never increases its default size (half screen), it only shrinks.
let g:vim_markdown_toc_autofit = 1

" Disable conceal
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" Allow the ge command to follow named anchors in links of the form
" file#anchor or just #anchor, where file may omit the .md extension as usual
let g:vim_markdown_follow_anchor = 1

" highlight frontmatter
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1





" =================== easyescape ======================

let g:easyescape_chars = { "j": 1, "k": 1 }
let g:easyescape_timeout = 100
cnoremap jk <ESC>
cnoremap kj <ESC>


" =================== rust.vim ========================

" Enable automatic running of :RustFmt when a buffer is saved.
let g:rustfmt_autosave = 1

" The :RustPlay command will send the current selection, or if nothing is
" selected the current buffer, to the Rust playpen. Then copy the url to the
" clipboard.
let g:rust_clip_command = 'xclip -selection clipboard'

" TODO: explore fzf and fzf.vim


" c++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_dspacecamecl_highlight = 1
