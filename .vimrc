" Settings {{{ 
	" set encoding=utf-8
	set nocompatible
	filetype on
	filetype indent on
	syntax on
	set number
	set relativenumber
	"set cursorline
	"set cursorcolumn
	"set autoindent
	set smartindent
	set noexpandtab
	set shiftwidth=4
	set tabstop=4
	set softtabstop=0
	set scrolloff=10
	set nowrap
	set incsearch
	set smartcase
	set showmode
	set showmatch
	set hlsearch
	set history=1000
	" more wildmenu settings
	set wildmenu
	set wildmode=longest:full
	set wildignore+=*.o,*.pyc,*/.git/*
	set omnifunc=syntaxcomplete#Complete
	set noerrorbells
	set showmatch
	" set splitright
	set splitbelow
	set path+=.,**
	set dictionary=/usr/share/dict/british-english
	set nospell
	set spelllang+=fr
	set foldmethod=indent
	set foldnestmax=1
	set matchpairs+=<:>
	set undofile
	set nolist
	" set showbreak=↪\ 
	set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
	" set listchars=tab:⮕\ ,trail:◼,nbsp:•,extends:…,precedes:…
	set backupskip=/tep/*
	" set nobackup
	set undodir=~/.vim/tmp/undo//
	set backupdir=~/.vim/tmp/backup//
	set directory=~/.vim/tmp/swap//
	set backup
	set noswapfile
	let mapleader=','
	set pastetoggle=<F8>
	set autoread
	set conceallevel=1 
	set magic
	set backspace=indent,eol,start " make that backspace key work the way it should
	set shell=zsh
" }}}

" Apperance {{{
	" fixes different background color
	colorscheme dracula
	hi Normal guibg=NONE ctermbg=NONE
" }}}

" StatusBar {{{
	"clear status line
	set statusline=
	set statusline+=\ %F\ %m\ %Y\ %R
	set statusline+=%=
	set statusline+=\ %b\ 0x%B\ %l\ %c\ %p%%
	set laststatus=2
	" examples
	" set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
	" set statusline=%<%f\ %h%m%r%=%{fugitive#statusline()}\ \ %-14.(%l,%c%V%)\ %P
	" set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \ 
	" set statusline+=\ \ \ [%{&ff}/%Y] 
	" set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\ 
	" set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L	
" }}}

" Functions {{{
function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return '[PASTE]'
    else
        return ''
    endif
endfunction
" }}}

" {{{ Filetype changes 
	" 2 space tab for bash script files
	autocmd Filetype sh setlocal shiftwidth=2 tabstop=2 softtabstop=2
	" vim files have markers for folding
	autocmd Filetype vim setlocal foldmethod=marker foldnestmax=1 
	" auto comment line
	autocmd Filetype vim nmap ! I" <esc>
	autocmd Filetype vim imap :! jkI" jkA
	autocmd Filetype html set foldmethod=manual
	autocmd Filetype javascript setlocal omnifunc=javascriptcomplete#CompleteTags
	autocmd Filetype css setlocal omnifunc=csscomplete#CompleteTags
	autocmd Filetype python setlocal omnifunc=pythoncomplete#CompleteTags
	autocmd Filetype c setlocal omnifunc=ccomplete#CompleteTags
	autocmd Filetype php setlocal omnifunc=phpcomplete#CompletePHP
	" autocmd Filetype java setlocal omnifunc=javacomplete#CompleteTags
	autocmd Filetype java setlocal omnifunc=javacomplete#Complete
	autocmd Filetype java setlocal listchars=tab:\|\ 
	autocmd Filetype java hi! link SpecialKey FoldColumn
	autocmd Filetype markdown setlocal spell
	autocmd Filetype haskell set softtabstop=2
	autocmd Filetype haskell set shiftwidth=2
	autocmd Filetype haskell set tabstop=2
	autocmd Filetype haskell set expandtab
	autocmd Filetype python nnoremap <f5> :w <cr>:!clear <cr>:!python3 -i % <cr>
	autocmd Filetype haskell nnoremap <f5> :w <cr>:!clear <cr>:!runhaskell % <cr>
	autocmd Filetype php nnoremap <f5> :w <cr>:!clear <cr>:!php -a -d auto_prepend_file=% <cr>
	autocmd Filetype c nnoremap <f5> :w <cr>:!clear <cr>:!make && ./run<cr>
	autocmd Filetype c nnoremap <f6> :w <cr>:!clear <cr>:!gcc test.c && ./a.out<cr>
	autocmd Filetype json nnoremap pp :%!python -m json.tool<cr>

" }}}

" {{{ Stuff found  on SO 
au VimResized * exe "normal! \<c-w>="
augroup line_return
	au!
	au BufReadPost *
		\ if line("'\"") > 0 && line("'\"") <= line("$") |
		\	execute 'normal! g`"zvzz' |
		\ endif
augroup END
autocmd BufNewFile,BufRead *.psc set syntax=psc
set hls
let @/ = ""
" disable warnings
let s:IgnoreChange=0
autocmd! FileChangedRO * nested
    \ let s:IgnoreChange=1 |
    \ call system("p4 edit " . expand("%")) |
    \ set noreadonly
autocmd! FileChangedShell *
    \ if 1 == s:IgnoreChange |
    \   let v:fcs_choice="" |
    \   let s:IgnoreChange=0 |
    \ else |
    \   let v:fcs_choice="ask" |
    \ endif

au VimEnter * silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Return'
au VimLeave * silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
" }}}

" {{{ Snips
	autocmd Filetype vim inoremap {{{ {{{<CR><CR>" }}}<Esc>ki<Tab>
	autocmd Filetype c,cpp inoremap {      {}<Left>
	autocmd Filetype c,cpp inoremap {<CR>  {<CR>}<Esc>O
	autocmd Filetype c,cpp inoremap {{     {
	autocmd Filetype c,cpp inoremap {}     {}
	autocmd Filetype vim,html,php inoremap <      <><Left>
	autocmd Filetype vim,html,php inoremap <<CR>  <<CR>><Esc>O
	autocmd Filetype vim,html,php inoremap <<     <
	autocmd Filetype vim,html,php inoremap <>     <>
	autocmd Filetype c,cpp,python inoremap ()		()
	autocmd Filetype c,cpp,python inoremap (		()<Left>
	autocmd Filetype c,cpp,python inoremap (( 	(
	autocmd Filetype c,cpp inoremap #i #include <><Left>
	autocmd Filetype c,cpp inoremap #I #include ""<Left>
	autocmd Filetype c,cpp inoremap printf printf("z\n");<Esc>?z<cr>xi
	autocmd Filetype c,cpp inoremap intmain int main(int argc, char ** argv) {<CR>z;<CR>return 0;<CR>}<esc>?z<cr>xxI
	" autocmd Filetype c,python inoremap <expr> )  strpart(getline('.'), col('.')+1, 1) == ")" ? "here" : "there"
	" autocmd Filetype c,python inoremap <cr>>	><cr>
	autocmd Filetype c,cpp nnoremap <leader>f i/*!<cr>\ file filename<cr>\ author Samson Grice <gricemagic@cy-tech.fr><cr>\ version 0.1<cr>\ date <esc>:pu=strftime('%m/%d/%y')<cr>i<bs><esc>A<cr>\ brief z<cr><bs>*/<cr><esc>?z<cr>:nohl<cr>xA
	autocmd Filetype c,cpp nnoremap <leader>F i/*!<cr>\ file filename<cr>\ author Samson Grice <gricemagic@cy-tech.fr><cr>\ version 0.1<cr>\ date <esc>:pu=strftime('%m/%d/%y')<cr>i<bs><esc>A<cr>\ brief z<cr>\ param None<cr>\ return 0 if all good<cr><bs>*/<cr><esc>?z<cr>:nohl<cr>xA
	autocmd Filetype php inoremap ?php <?php<cr><cr><cr>?><esc>kI

	" doxycomments
	autocmd Filetype c,cpp nnoremap <leader>c :w<cr>:! generate-doxygen-comments.py %<cr><cr>
	autocmd Filetype c,cpp nnoremap <leader>d :w<cr>:! delete-doxygen-comments.py %<cr><cr>


" }}}

" {{{ Maps 
	nnoremap ; :
	nnoremap <c-z> :so $MYVIMRC<CR>
	inoremap jk <esc>
	inoremap <c-return> <esc>o
	nnoremap n nzz
	nnoremap N Nzz
	nnoremap <c-j> <c-w>j
	nnoremap <c-k> <c-w>k
	nnoremap <c-h> <c-w>h
	nnoremap <c-l> <c-w>l
	tnoremap <c-j> <c-w>j
	tnoremap <c-k> <c-w>k
	tnoremap <c-h> <c-w>h
	tnoremap <c-l> <c-w>l
	nnoremap <M-j> 5j
	nnoremap <M-k> 5k
	nnoremap Q <esc>
	nnoremap H ^
	nnoremap L $
	cnoremap <c-a> <home>
	cnoremap <c-e> <end>
	vnoremap <leader>S y:execute @@<cr>
	nnoremap <leader>S ^vg_y:execute @@<cr>
	nnoremap <leader><Space> :let @/ = ""<cr>
	" inoremap <c-f> <c-x><c-f>
	nnoremap <Space><Space> %
	
	" toredo
	" nnoremap <c-up> <esc>
	" nnoremap <c-down> <esc>
	nnoremap <c-left> 5<c-w>>
	nnoremap <c-right> 5<c-w><
	" jumps to tag
	nnoremap <c-t><c-t> <c-]>
	" jumps back
	nnoremap <s-t> <c-t>
	" opens preview tag
	nnoremap <c-t><c-r> <c-w>}
	" closes preview tag
	nnoremap <c-t><c-f> <c-w><c-z>
	nnoremap <c-l> :!pandoc % -o out.pdf<cr><cr>

	imap <c-d> jk[s1z=wi

	map <leader>w :e ~/Tmp/buffer<cr>
	map <leader>x :e ~/Tmp/buffer.md<cr>
	map <leader>pp :setlocal paste!<cr>
	map <leader>l :setlocal list!<cr>

	nnoremap Q <nop>

	nnoremap K <nop>
	nnoremap <leader>k K

	nmap qg gqq
	nmap gQ VipJ

" }}}

" vim:foldmethod=marker:foldlevel=0:foldnestmax=1:formatoptions-=o
" usefull stuff
" https://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim/1220118#1220118
