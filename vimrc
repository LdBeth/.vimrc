" The Beginning of Nightmare
" Maintainer:	Ldbeth <andpuke@foxmail.com>
" Last Change:	2017 Feb 14

" Basic Settings
set shortmess=atI
set enc=utf-8
colorscheme nightmare
set background=dark
let mapleader=","
autocmd BufWritePost $MYVIMRC source $MYVIMRC " Immediate Apply
" Editior
set startofline
set magic
set cursorline
set cursorcolumn
set scrolloff=3
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
"set lazyredraw
" Statuas Line
set ruler
set number
"set relativenumber
set hid
set showcmd
set showtabline=0
set laststatus=2
set ttimeoutlen=50
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
" Search
set ignorecase
set smartcase
set hlsearch
set incsearch
nmap <silent> <leader>m :nohlsearch<CR>
" Syntax
syntax on
syntax enable
set novisualbell
autocmd InsertLeave * se nocul " Highlight
autocmd InsertLeave * se cul " High
" Format
nnoremap <Bslash> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>
"set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set lbr
set tw=500
" Complete
set completeopt=preview,menu
set infercase
set showmatch
set wildmenu
" File
filetype off
filetype plugin on
filetype plugin indent on
set autoread
" Key Bindings
" Exit insert mode by typing fd
inoremap fd <Esc>
" Visual mode searching
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction
function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>
vnoremap <silent> gv :call VisualSelection('gv')<CR>
vnoremap <silent> <Space>r :call VisualSelection('replace')<CR>
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
" Hybird
imap <C-F> <Right>
imap <C-B> <Left>
imap <C-A> <Home>
imap <C-E> <End>
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
map <Tab>o :tabonly<CR>
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

" crontab Problem
autocmd filetype crontab setlocal nobackup nowritebackup


" Vim-Plug
" plugin from http://vim-scripts.org/vim/scripts.html
call plug#begin('~/.vim/plugged')

Plug 'Shougo/neocomplcache'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'vim-scripts/winmanager'
Plug 'The-NERD-tree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'EasyMotion'
Plug 'ctrlp.vim'
Plug 'TaskList.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'Limbo-syntax'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'

call plug#end()
" All of your Plugins must be added before the following line

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
" TAB Expand
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
" Clsoe popup by <Space>.
inoremap <expr><Space>  pumvisible() ? neocomplcache#close_popup() : "\<Space>"
" Settings
let g:neocomplcache_enable_at_startup = 1 " Start Neocomplcahce
let g:neocomplcache_enable_auto_select = 0 " Auto select candidates
let g:neocomplcache_enable_quick_match = 1 " Quick slect
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
" winmanager
"g:winManagerWindowLayout = 'The-NERD-tree,TagsExplorer|BufExplorer'
" The NERD tree
" Auto Starts
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Short Cuts
map <Leader>t :NERDTreeToggle<CR>
" Auto Close
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" vim-airline
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#bufferline#overwrite_variables = 1
let g:airline_powerline_fronts = 1
let g:airline_detect_spell=1
"function! HasPaste()
"    if &paste
"        return ' P'
"    en
"    return ' E'
"endfunction
"let g:airline_section_a = '%{bufnr("%")}%{HasPaste()}'
"function! Buf_total_num()
"    return len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
"endfunction
let g:airline_theme = 'distinguished'
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
" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" This is the end of the vimrc file.
