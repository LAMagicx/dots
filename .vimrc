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
	set expandtab
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
	set dictionary=/usr/share/dict/english
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
    set modeline
	set magic
    set mouse=""
	set backspace=indent,eol,start " make that backspace key work the way it should
	set shell=zsh
    " adds a vertical colum for line width
    set colorcolumn=120
    " removes conceal for current line
    set concealcursor-=n
" }}}

" Apperance {{{
	" fixes different background color
	colorscheme snazzy
	hi Normal guibg=NONE ctermbg=NONE
    hi LineNr guibg=NONE ctermbg=NONE
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
	autocmd Filetype javascript setlocal sw=2
	autocmd Filetype css setlocal omnifunc=csscomplete#CompleteTags
	autocmd Filetype python setlocal omnifunc=python3complete#Complete
	autocmd Filetype c setlocal omnifunc=ccomplete#CompleteTags
	autocmd Filetype php setlocal omnifunc=phpcomplete#CompletePHP
	" autocmd Filetype java setlocal omnifunc=javacomplete#CompleteTags
	autocmd Filetype java setlocal omnifunc=javacomplete#Complete
	" autocmd Filetype java setlocal listchars=tab:\|\ 
	autocmd Filetype java hi! link SpecialKey FoldColumn
    autocmd Filetype markdown inoremap <buffer><silent><unique> ~~~ ~~~<Enter>~~~<Up>
    autocmd Filetype markdown inoremap <buffer><silent><unique> ``` ```<Enter>```<Up>
	autocmd Filetype markdown setlocal spell
	autocmd Filetype markdown setlocal wrap
	autocmd Filetype markdown nnoremap ze ]s
	autocmd Filetype markdown nnoremap za [s
	autocmd Filetype markdown setlocal spell
	autocmd Filetype markdown set complete+=k
	autocmd Filetype markdown setlocal linebreak
	autocmd Filetype markdown nnoremap <expr> k v:count == 0 ? 'gk' : 'k'
    autocmd Filetype markdown nnoremap <expr> j v:count == 0 ? 'gj' : 'j'
	autocmd Filetype haskell set softtabstop=2
	autocmd Filetype haskell set shiftwidth=2
	autocmd Filetype haskell set tabstop=2
	autocmd Filetype haskell set expandtab
	" autocmd Filetype python nnoremap <f5> :w <cr>:!clear <cr>:!python3 -i % <cr>
    autocmd FileType python map <buffer> <F5> :w<CR>:botright term ipython3 -i %<CR>
    autocmd FileType python map <buffer> <F9> :w<CR>:exec '!ipython3' shellescape(@%, 1)<CR>
	autocmd Filetype python nnoremap <f5> :w <cr>:!clear <cr>:!python3 -i % <cr>
	autocmd Filetype haskell nnoremap <f5> :w <cr>:!clear <cr>:!runhaskell % <cr>
	autocmd Filetype php nnoremap <f5> :w <cr>:!clear <cr>:!php -a -d auto_prepend_file=% <cr>
	autocmd Filetype c nnoremap <leader>m :w <cr>:!clear <cr>:!make && ./Main<cr>
	autocmd Filetype gdshader nnoremap <leader>m :w <cr>:!clear <cr>:!make && ./Main
	autocmd Filetype c nnoremap <f6> :w <cr>:!clear <cr>:!gcc test.c && ./a.out<cr>
	autocmd Filetype json nnoremap pp :%!python -m json.tool<cr>
    autocmd Filetype yaml setlocal ts=2 sts=2 sw=2 expandtab
    " autocmd Filetype python setlocal formatprg=autopep8\ -
    autocmd Filetype python nnoremap gq :w<cr>:!black %<cr>

    " Typing hilight 
    autocmd Filetype python syn match Type '\<List\>'
    autocmd Filetype python syn match Type '\<Tuple\>'
    autocmd Filetype python syn match Type '\<Set\>'
    autocmd Filetype python syn match Type '\<Dict\>'
    autocmd Filetype python syn match Type '\<Deque\>'
    autocmd Filetype python syn match Type '\<FrozenSet\>'
    autocmd Filetype python syn match Type '\<Sequence\>'
    autocmd Filetype python syn match Type '\<Iterable\>'
    autocmd Filetype python syn match Type '\<Iterator\>'
    autocmd Filetype python syn match Type '\<Mapping\>'
    autocmd Filetype python syn match Type '\<Any\>'
    autocmd Filetype python syn match Type '\<Union\>'
    autocmd Filetype python syn match Type '\<Optional\>'
    autocmd Filetype python syn match Type '\<Type\>'
    autocmd Filetype python syn match Type '\<Callable\>'
    autocmd Filetype python syn match Type '\<Generator\>'
    autocmd Filetype python syn match Type '\<AsyncGenerator\>'
    autocmd Filetype python syn match Type '\<Awaitable\>'
    autocmd Filetype python syn match Type '\<Coroutine\>'
    autocmd Filetype python syn match Type '\<Generic\>'
    autocmd Filetype python syn match Type '\<Protocol\>'
    autocmd Filetype python syn match Type '\<DataFrame\>'



" }}}

" {{{ Stuff found  on SO 

nnoremap <leader>c :call ToggleNumbering()<CR>

let g:number_toggle = 0

function! ToggleNumbering()
    if g:number_toggle == 0
        set number relativenumber
        let g:number_toggle = 1
    else
        set nonumber norelativenumber
        let g:number_toggle = 0
    endif
endfunction

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

function! s:spell_rotate(dir, visual) abort
  if a:visual
    " Restore selection.  This line is seen throughout the function if the
    " selection is cleared right before a potential return.
    normal! gv
    if getline("'<") != getline("'>")
      echo 'Spell Rotate: can''t give suggestions for multiple lines'
      return
    endif
  endif

  if !&spell
    echo 'Spell Rotate: spell not enabled.'
    return
  endif

  " Keep the view to restore after a possible jump using the change marks.
  let view = winsaveview()
  let on_spell_word = 0

  if exists('b:_spell') && getline("'[") == getline("']")
    let bounds = b:_spell.bounds
    " Confirm that the cursor is between the bounds being tracked.
    let on_spell_word = bounds[0][0] == bounds[1][0]
          \ && view.lnum == bounds[0][0]
          \ && view.col >= bounds[0][1]
          \ && view.col <= bounds[1][1]
  endif

  " Make sure the correct register is used
  let register = &clipboard == 'unnamed'
        \ ? '*' : &clipboard == 'unnamedplus'
        \ ? '+' : '"'

  " Store the text in the unnamed register.  Note that yanking will clear
  " the visual selection.
  if on_spell_word
    if a:visual
      keepjumps normal! y
    else
      keepjumps normal! `[v`]y
    endif
    call winrestview(view)
  elseif a:visual
    keepjumps normal! y
  else
    keepjumps normal! viwy
  endif

  let cword = getreg(register)

  if !on_spell_word || b:_spell.alts[b:_spell.index] != cword
    " Start a new list of suggestions.  The word being replaced will
    " always be at index 0.
    let spell_list = [cword] + spellsuggest(cword)
    let b:_spell = {
          \ 'index': 0,
          \ 'bounds': [[0, 0], [0, 0]],
          \ 'cword': cword,
          \ 'alts': spell_list,
          \ 'n_alts': len(spell_list),
          \ }

    if len(b:_spell.alts) > 1
      " Do something to change the buffer and force a new undo point to be
      " created.  This is because `undojoin` is used below and it won't
      " work if we're not at the last point of the undo history.
      if a:visual
        normal! xP
      else
        normal! ix
        normal! x
      endif
    endif
  endif

  if a:visual
    normal! gv
  endif

  if len(b:_spell.alts) < 2
    echo 'Spell Rotate: No suggestions'
    return
  endif

  " Force the next changes to be part of the last undo point
  undojoin

  " Setup vim-repeat if it exists.
  silent! call repeat#set(printf("\<Plug>(SpellRotate%s%s)",
        \ a:dir < 0 ? 'Backward' : 'Forward', a:visual ? 'V' : ''))

  " Get the suggested, previous, and next text
  let i = (b:_spell.index + (a:dir * v:count1)) % b:_spell.n_alts
  if i < 0
    let i += b:_spell.n_alts
  endif

  let next = (i + 1) % b:_spell.n_alts
  let prev = (i - 1) % b:_spell.n_alts
  if prev < 0
    let prev += b:_spell.n_alts
  endif

  let next_word = b:_spell.alts[next]
  let prev_word = b:_spell.alts[prev]

  let b:_spell.index = i
  call setreg(register, b:_spell.alts[i])

  if a:visual
    normal! p`[v`]
  else
    keepjumps normal! gvp
  endif

  " Keep the original word in the unnamed register
  call setreg(register, b:_spell.cword)

  let b:_spell.bounds = [
        \ getpos(a:visual ? "'<" : "'[")[1:2],
        \ getpos(a:visual ? "'>" : "']")[1:2],
        \ ]

  echon printf('Suggestion %*s of %s for "', strlen(b:_spell.n_alts - 1), b:_spell.index, b:_spell.n_alts - 1)
  echohl Title
  echon b:_spell.cword
  echohl None
  echon '":  '

  if a:dir < 0
    echohl String
  else
    echohl Comment
  endif
  echon prev_word
  echohl None

  echon ' < '

  echohl Keyword
  echon b:_spell.alts[i]
  echohl None

  echon ' > '

  if a:dir > 0
    echohl String
  else
    echohl Comment
  endif
  echon next_word
  echohl None

  redraw
endfunction


function! s:spell_rotate_suball() abort
  if !exists('b:_spell') || len(b:_spell.alts) < 2
    return
  endif
  execute '%s/'.b:_spell.cword.'/'.b:_spell.alts[b:_spell.index].'/g'
endfunction


command! SpellRotateSubAll call s:spell_rotate_suball()

nnoremap <silent> <Plug>(SpellRotateForward) :<c-u>call <sid>spell_rotate(v:count1, 0)<cr>
nnoremap <silent> <Plug>(SpellRotateBackward) :<c-u>call <sid>spell_rotate(-v:count1, 0)<cr>
vnoremap <silent> <Plug>(SpellRotateForwardV) :<c-u>call <sid>spell_rotate(v:count1, 1)<cr>
vnoremap <silent> <Plug>(SpellRotateBackwardV) :<c-u>call <sid>spell_rotate(-v:count1, 1)<cr>

nmap <silent> zn <Plug>(SpellRotateForward)
nmap <silent> zp <Plug>(SpellRotateBackward)
vmap <silent> zn <Plug>(SpellRotateForwardV)
vmap <silent> zp <Plug>(SpellRotateBackwardV)

if has ('autocmd') " Remain compatible with earlier versions
 augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
  augroup END
endif " has autocmd


" }}}

" {{{ Snips
	autocmd Filetype vim inoremap {{{ " {{{<CR><CR>" }}}<Esc>ki<Tab>
	autocmd Filetype c,cpp, gdshader inoremap {      {}<Left>
	autocmd Filetype c,cpp, gdshader inoremap {<CR>  {<CR>}<Esc>O
	autocmd Filetype c,cpp, gdshader inoremap {{     {
	autocmd Filetype c,cpp, gdshader inoremap {}     {}
	" autocmd Filetype vim,html,php inoremap <      <><Left>
	" autocmd Filetype vim,html,php inoremap <<CR>  <<CR>><Esc>O
	" autocmd Filetype vim,html,php inoremap <<     <
	" autocmd Filetype vim,html,php inoremap <>     <>
	" autocmd Filetype c,cpp,python inoremap ()		()
	" autocmd Filetype c,cpp,python inoremap (		()<Left>
	" autocmd Filetype c,cpp,python inoremap (( 	(
	autocmd Filetype c,cpp inoremap #i #include <><Left>
	autocmd Filetype c,cpp inoremap #I #include ""<Left>
	autocmd Filetype c,cpp inoremap printf printf("z\n");<Esc>?z<cr>xi
	autocmd Filetype c,cpp inoremap intmain int main(int argc, char ** argv) {<CR>z;<CR>return 0;<CR>}<esc>?z<cr>xxI
	" autocmd Filetype c,python inoremap <expr> )  strpart(getline('.'), col('.')+1, 1) == ")" ? "here" : "there"
	" autocmd Filetype c,python inoremap <cr>>	><cr>
	autocmd Filetype c,cpp nnoremap <leader>f i/*!<cr>\ file filename<cr>\ author Samson Grice <gricemagic@cy-tech.fr><cr>\ version 0.1<cr>\ date <esc>:pu=strftime('%m/%d/%y')<cr>i<bs><esc>A<cr>\ brief z<cr><bs>*/<cr><esc>?z<cr>:nohl<cr>xA
	autocmd Filetype c,cpp nnoremap <leader>F i/*!<cr>\ file filename<cr>\ author Samson Grice <gricemagic@cy-tech.fr><cr>\ version 0.1<cr>\ date <esc>:pu=strftime('%m/%d/%y')<cr>i<bs><esc>A<cr>\ brief z<cr>\ param None<cr>\ return 0 if all good<cr><bs>*/<cr><esc>?z<cr>:nohl<cr>xA
	autocmd Filetype php inoremap ?php <?php<cr><cr><cr>?><esc>kI
    autocmd Filetype python inoremap [<CR> [<CR>]<esc>O
    autocmd Filetype python inoremap __name __name__ == "__main__":<cr>

    autocmd Filetype pdf nnoremap <c-l> :!pandoc % -o out.pdf<cr><cr>

	" doxycomments
	autocmd Filetype c,cpp nnoremap <leader>c :w<cr>:! generate-doxygen-comments.py %<cr><cr>
	autocmd Filetype c,cpp nnoremap <leader>d :w<cr>:! delete-doxygen-comments.py %<cr><cr>

    autocmd Filetype markdown nnoremap <leader>d :put =strftime('%b %d %H:%M:%S')<cr>kdd^i## jk$a
    autocmd Filetype markdown imap <leader>d <esc>:put =strftime('%b %d %H:%M:%S')<cr>kdd^i## jk$a
" }}}

" {{{ Maps 
	nnoremap ; :
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
    nnoremap <leader><leader> :%s/\v,( )@!/, /g<cr>
	vnoremap <leader>S y:execute @@<cr>
	nnoremap <leader>S ^vg_y:execute @@<cr>
	nnoremap <leader><Space> :let @/ = ""<cr>
	" inoremap <c-f> <c-x><c-f>
	nnoremap <Space><Space> %
    " nnoremap <s-c-r> :so ~/.vimrc<cr>
    nnoremap <c-z> :so ~/.vimrc <cr>
    nnoremap <leader>t :vertical botright term<cr>
    vnoremap w iw
    nnoremap * *:nohl<cr>
	
	" toredo
	" nnoremap <c-up> <esc>
	" nnoremap <c-down> <esc>
	nnoremap <c-right> 5<c-w><
	nnoremap <c-left> 5<c-w>>
	" jumps to tag
	nnoremap <c-t><c-t> <c-]>
	" jumps back
	nnoremap <s-t> <c-t>
	" opens preview tag
	nnoremap <c-t><c-r> <c-w>}
	" closes preview tag
	nnoremap <c-t><c-f> <c-w><c-z>

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

    imap <c-h> <Left>
    imap <c-l> <Right>
    

    vnoremap <leader>h :s/\%V[0-9a-fA-F]\+/\=str2nr(submatch(0), 16)/g<cr>

    " Tab navigation like Firefox.
    nnoremap <C-S-tab> :tabprevious<CR>
    nnoremap <C-tab>   :tabnext<CR>
    inoremap <C-S-tab> <Esc>:tabprevious<CR>i
    inoremap <C-tab>   <Esc>:tabnext<CR>i

" }}}

" usefull stuff
" https://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim/1220118#1220118
" vim:foldmethod=marker:foldlevel=0:foldnestmax=1:formatoptions-=o
