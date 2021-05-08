if &compatible
  set nocompatible
endif

augroup vimrc
  autocmd!
augroup END

set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('$HOME/.cache/dein')
  call dein#begin('$HOME/.cache/dein')

  call dein#add('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')
" vim-airline
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  " nerdtree, fern にアイコンを
  call dein#add('ryanoasis/vim-devicons')

  " nerdtree
  " call dein#add('scrooloose/nerdtree')

  " Fern ファイラ
  call dein#add('lambdalisue/fern.vim')
  " call dein#add('lambdalisue/nerdfont.vim')
  call dein#add('lambdalisue/fern-renderer-devicons.vim')
  call dein#add('lambdalisue/fern-hijack.vim')
  call dein#add('hrsh7th/fern-mapping-collapse-or-leave.vim')

  " 括弧やクォートの補完
  call dein#add('Raimondi/delimitMate')

  " コメントアウトを強力に
  call dein#add('tpope/vim-commentary')

  " tig を vim から
  call dein#add('iberianpig/tig-explorer.vim')

  " プロジェクトルートに移動
  call dein#add('airblade/vim-rooter')

  " Color
  call dein#add('hzchirs/vim-material')
  call dein#add('ghifarit53/tokyonight-vim')

  " 英語の構文チェック
  call dein#add('rhysd/vim-grammarous')

  " LSP
  call dein#add('prabirshrestha/async.vim')
  call dein#add('prabirshrestha/asyncomplete.vim')
  call dein#add('prabirshrestha/asyncomplete-lsp.vim')
  call dein#add('prabirshrestha/vim-lsp')
  call dein#add('mattn/vim-lsp-settings', {'merged': 0})
  call dein#add('mattn/vim-lsp-icons')
  call dein#add('hrsh7th/vim-vsnip')
  call dein#add('hrsh7th/vim-vsnip-integ')

  " call dein#add('neoclide/coc.nvim', {'rev': 'release', 'merged': 0})

  " Tabnine
  " call dein#add('zxqfl/tabnine-vim')

  " ruby, rails 関連
  " call dein#add('vim-ruby/vim-ruby')
  call dein#add('tpope/vim-rails')
  call dein#add('tpope/vim-endwise')

  " JavaScript
  call dein#add('jelera/vim-javascript-syntax')

  " TypeScript
  " call dein#add('HerringtonDarkholme/yats.vim')

  " js, ts hilight
  call dein#add('maxmellon/vim-jsx-pretty')

  "Vue
  call dein#add('posva/vim-vue')

  " slim hilight
  call dein#add('slim-template/vim-slim')

  " Go
  call dein#add('fatih/vim-go')

  " Git
  " call dein#add('tpope/vim-fugitive')

  " ctrlp
  call dein#add('ctrlpvim/ctrlp.vim')

  " fzf
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
  " call dein#add('junegunn/fzf', { 'build': './install --all' })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

  " buffer 管理
  call dein#add('jeetsukumaran/vim-buffergator')

  " vim-surround, repeat
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-repeat')

  call dein#add('liuchengxu/vista.vim')

  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

set updatetime=300

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb

" 描画をすばやく
set ttyfast

" Fix backspace indent
set backspace=indent,eol,start

" Tabs. May be overriten by autocmd rules
set expandtab
set tabstop=2
set shiftwidth=2

" 不可視文字を表示する
set list
set listchars=tab:»-,trail:-,nbsp:%

" Go の場合、tab が表示されると邪魔なので消す
autocmd filetype go set nolist

" json でダブルクォートを表示するように
" autocmd Filetype json set conceallevel=0

" Map leader to Space
let mapleader="\<Space>"

" Enable hidden buffers
set hidden

" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

" session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

set autoread

set ruler
set number
set showmatch
source $VIMRUNTIME/macros/matchit.vim
set wildmenu

" 常に signcolumn を表示
set signcolumn=yes

set history=200

" 検索系
set hlsearch
set ignorecase
set smartcase
set incsearch
set wrapscan

nnoremap <silent> <ESC><ESC> :noh<CR>

set ttimeoutlen=10

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

let no_buffers_menu=1
set background=dark

let g:tokyonight_style = 'night'
let g:tokyonight_disable_italic_comment = 1
colorscheme tokyonight

set clipboard+=unnamed

" set cursorline

set mousemodel=popup

" Disable the blinking cursor.
set scrolloff=3

" Status bar
set laststatus=2

set ambiwidth=double

" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

nnoremap n nzzzv
nnoremap N Nzzzv

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

let g:airline_theme = 'tokyonight'
" let g:airline_powerline_fonts = 1

set modifiable

noremap <leader>z :bp<CR>
noremap <leader>x :bn<CR>

noremap <leader>c :bd<CR>

" Window 移動
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j

nnoremap <leader>w :w<CR>
nnoremap <leader>q :close<CR>

command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>', '<bang>')
function! s:ChangeCurrentDir(directory, bang)
  if a:directory == ''
    lcd %:p:h
  else
    execute 'lcd' . a:directory
  endif

  if a:bang == ''
    pwd
  endif
endfunction

" Change current directory.
nnoremap <silent> <leader>ch :<C-u>CD<CR>

" Change project root directory.
nnoremap <silent> <leader>cd :<C-u>Rooter<CR>

" Use rg command
if executable('rg')
  " set grepprg=rg\ -i\ -S
  set grepprg=rg\ --color=never
  " let g:ctrlp_use_caching = 0
  " let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
endif

" command! -nargs=+ Grep execute 'silent grep! <args>' | cw | redraw!
command! -nargs=+ Grep execute 'silent grep! <args>' | cw | redraw!

" NERDTree configuration
" nnoremap <silent><C-e> :NERDTreeToggle<CR>
" command Ntf NERDTreeFind

" let NERDTreeWinSize=50
" let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" let g:NERDTreeDirArrowExpandable = '▸'
" let g:NERDTreeDirArrowCollapsible = '▾'

let g:fern#renderer="devicons"
nnoremap <silent><C-e> :Fern . -reveal=% -drawer -width=50 -toggle<CR>

let g:ctrlp_match_window = 'results:50'
let g:ctrlp_lazy_update = 100

" LSP setting
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> <f2> <plug>(lsp-rename)
  inoremap <expr> <cr> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
"command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')
let g:lsp_log_file = ""

let g:lsp_diagnostics_enabled = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_popup_delay = 200
let g:lsp_text_edit_enabled = 0

" vimrooter setting
let g:rooter_cd_cmd = 'lcd'
let g:rooter_patterns = ['.git', '.git/', 'package.json', 'tsconfig.json']
let g:rooter_manual_only = 1

" nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>f :Files<CR>

let g:buffergator_viewport_split_policy = "B"

" rspec
let g:rails_projections = {
  \ "app/controllers/*_controller.rb": {
  \   "test": [
  \     "spec/requests/{}_controller_spec.rb",
  \     "spec/controllers/{}_controller_spec.rb"
  \   ],
  \ },
  \ "spec/requests/*_spec.rb": {
  \   "alternate": [
  \     "app/controllers/{}.rb",
  \   ],
  \ }}

" vista
let g:vista#renderer#enable_icon = 1
" let g:vista_default_executive = 'coc'
let g:vista_icon_indent = ["󳄀󳄂 ", "󳄁󳄂 "]
let g:vista#renderer#icons = {
            \ 'func':           "\Uff794",
            \ 'function':       "\Uff794",
            \ 'functions':      "\Uff794",
            \ 'var':            "\Uff71b",
            \ 'variable':       "\Uff71b",
            \ 'variables':      "\Uff71b",
            \ 'const':          "\Uff8ff",
            \ 'constant':       "\Uff8ff",
            \ 'method':         "\Uff6a6",
            \ 'package':        "\Ufe612",
            \ 'packages':       "\Ufe612",
            \ 'enum':           "\Uff435",
            \ 'enumerator':     "\Uff435",
            \ 'module':         "\Uff668",
            \ 'modules':        "\Uff668",
            \ 'type':           "\Ufe22b",
            \ 'typedef':        "\Ufe22b",
            \ 'types':          "\Ufe22b",
            \ 'field':          "\Uff93d",
            \ 'fields':         "\Uff93d",
            \ 'macro':          "\Uff8a3",
            \ 'macros':         "\Uff8a3",
            \ 'map':            "\Uffb44",
            \ 'class':          "\Uff9a9",
            \ 'augroup':        "\Uffb44",
            \ 'struct':         "\Uffb44",
            \ 'union':          "\Uffacd",
            \ 'member':         "\Uff02b",
            \ 'target':         "\Uff893",
            \ 'property':       "\Uffab6",
            \ 'interface':      "\Uffa52",
            \ 'namespace':      "\Uff475",
            \ 'subroutine':     "\Uff915",
            \ 'implementation': "\Uff87a",
            \ 'typeParameter':  "\Uff278",
            \ 'default':        "\Uff29c"
            \ }
