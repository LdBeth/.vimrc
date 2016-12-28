" The Beginning of Nightmare
" Maintainer:	Ldbeth <andpuke@foxmail.com>
" Last Change:	2016 Dec 28

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
set cursorcolumn
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
nmap <silent> <leader>m :nohlsearch<CR>
" Syntax
syntax enable
syntax on
set novisualbell
autocmd InsertLeave * se nocul " Highlight
autocmd InsertLeave * se cul " Highlight
" Format
nnoremap <Bslash> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>
set autoindent
set smarttab
set tabstop=4
set shiftwidth=4
" Complete
set completeopt=preview,menu
set infercase
set showmatch
set wildmenu
" File
filetype off
filetype plugin on
filetype plugin indent on
" Key Bindings
" Exit insert mode by typing fd
inoremap fd <Esc>
" Windows
map <Tab>j <C-w>j
map <Tab>k <C-w>k
map <Tab>l <C-w>l
map <Tab>h <C-w>h
map <Leader><Space> <C-w><C-w>
map <Tab>= <C-w>=
" Scroll
map <Leader>, <C-u>
map <Leader>. <C-d>
map <Leader>; <C-b>
map <Leader>' <C-f>
" Editior
map <Space>o o<Esc>
map <Space>O O<Esc>
map <Space>a a<CR><esc>
map <Space>i i<CR><esc>
" Splite
nnoremap <Leader>/ <C-w>v
nnoremap <Leader>- <C-w>s
" Quit
map <Leader>x :quit<CR>
map <Leader>X :qa!<CR>
map <Leader>q :x<CR>
map <Leader>d :close<CR>
map <Leader>o :only<CR>
map <Leader>s :w<CR>
" Switch Buffers
map <Leader>[ :bp<CR>
map <Leader>] :bn<CR>
" Tab
map <Tab><Tab> :tabnew<CR>
map <Tab>[ :tabp<CR>
map <Tab>] :tabn<CR>
" Tab Jump
map <Tab><Space> gt
map <Tab>1 1gt
map <Tab>2 2gt
map <Tab>3 3gt
map <Tab>4 4gt
map <Tab>5 5gt
map <Tab>6 6gt
map <Tab>7 7gt
map <Tab>8 8gt
map <Tab>9 9gt
map <Tab>0 10gt
" Run Command
map <Leader>cv :AsyncRun vmd<CR>
map <Leader>cf :AsyncRun open .<CR>
map <Leader>cr :!ranger<CR>
" Cope
map <Leader>ee :botright cope<CR>
map <Leader>e. :cn<CR>
map <Leader>e, :cp<CR>
" Zoom
function! Zoom ()
    " check if is the zoomed state (tabnumber > 1 && window == 1)
    if tabpagenr('$') > 1 && tabpagewinnr(tabpagenr(), '$') == 1
        let l:cur_winview = winsaveview()
        let l:cur_bufname = bufname('')
        tabclose

        " restore the view
        if l:cur_bufname == bufname('')
            call winrestview(cur_winview)
        endif
    else
        tab split
    endif
endfunction

nmap <leader>z :call Zoom()<CR>
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

" plugin from http://vim-scripts.org/vim/scripts.html
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
Plugin 'skywind3000/asyncrun.vim'
Plugin 'Limbo-syntax'

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
imap <C-f>     <Plug>(neosnippet_expand_or_jump)
smap <C-f>     <Plug>(neosnippet_expand_or_jump)
xmap <C-f>     <Plug>(neosnippet_expand_target)

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Clsoe popup by <Space>.
inoremap <expr><Space>  pumvisible() ? neocomplcache#close_popup() : "\<Space>"
" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
let g:neocomplcache_enable_at_startup = 1 " Start Neocomplcahce
let g:neocomplcache_enable_auto_select = 0 " Auto select candidates
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
map <Leader>n :NERDTreeToggle<CR>
" Auto Close
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" vim-airline
"let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fronts = 1
" EasyMotion
let g:EasyMotion_leader_key = "<Space>"
" ctrlp
let g:ctrlp_map = '<Space>p'
map <Space>s :CtrlPMRU<CR>
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm|DS_Store)$',
    \ 'file': '\v\.(so|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
" Tasklist
map <Leader>td <Plug>TaskList
let g:tlTokenList = ["FIXME", "TODO", "HACK", "NOTE", "WARN", "MODIFY"]
let g:tlWindowPosition = 1

" This is the end of the vimrc file.
