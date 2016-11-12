" The Beginning of Nightmare
" Maintainer:	Ldbeth <andpuke@foxmail.com>
" Last Change:	2016 Oct 18

" Basic Settings
set nocp
set shortmess=atI
set enc=utf-8
colorscheme nightmare
let mapleader=","
autocmd BufWritePost $MYVIMRC source $MYVIMRC " Immediate Apply
" Editior
set startofline
set magic
set cursorline
set scrolloff=3
" Statuas Line
set ruler
set number
set showcmd
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
" Search
set ignorecase
set smartcase
set hlsearch
set incsearch
" Syntax
syntax enable
syntax on
set novisualbell
autocmd InsertLeave * se nocul " Highlight
autocmd InsertLeave * se cul " Highlight
" Format
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>
set autoindent
set smarttab
set tabstop=4
" Complete
set completeopt=preview,menu
set infercase
set showmatch
set wildmenu
" File
filetype off
filetype plugin on
filetype plugin indent on
" Tmux
if exists('$TMUX')
	set term=screen-256color
endif

" Vundle
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Shougo/neocomplcache'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'vim-scripts/winmanager'
Plugin 'The-NERD-tree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'EasyMotion'
Plugin 'ctrlp.vim'
Plugin 'TaskList.vim'
"Plugin 'Syntastic'

" All of your Plugins must be added before the following line
call vundle#end()

" NFO
function! SetFileEncodings(encodings)
    let b:myfileencodingsbak=&fileencodings
    let &fileencodings=a:encodings
endfunction
function! RestoreFileEncodings()
    let &fileencodings=b:myfileencodingsbak
    unlet b:myfileencodingsbak
endfunction
au BufReadPre *.nfo call SetFileEncodings('cp437')|set ambiwidth=single
au BufReadPost *.nfo call RestoreFileEncodings()

" Plugin Settings
" Neocomplcahe
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Clsoe popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
let g:neocomplcache_enable_at_startup = 1 " Start Neocomplcahce
let g:neocomplcache_enable_auto_select = 1 " Auto select candidates
let g:neocomplcache_enable_quick_match = 1 " Quick slect
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
" winmanager
"g:winManagerWindowLayout = 'The-NERD-tree,TagsExplorer|BufExplorer'
" The NERD tree
" Auto Starts
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Short Cuts
map <Leader>z :NERDTreeToggle<CR>
" Auto Close
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" vim-airline
"let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fronts = 1
" EasyMotion
let g:EasyMotion_leader_key = '<Leader>'
" Tasklist
map <leader>td <Plug>TaskList
