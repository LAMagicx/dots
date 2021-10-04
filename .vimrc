" Start Screen {{{
fun! Start()
    " Don't run if: we have commandline arguments, we don't have an empty
    " buffer, if we've not invoked as vim or gvim, or if we'e start in insert mode
    if argc() || line2byte('$') != -1 || v:progname !~? '^[-gmnq]\=vim\=x\=\%[\.exe]$' || &insertmode
        return
    endif

    " Start a new buffer ...
    enew

    " ... and set some options for it
    setlocal
        \ bufhidden=wipe
        \ buftype=nofile
        \ nobuflisted
        \ nocursorcolumn
        \ nocursorline
        \ nolist
        \ nonumber
        \ noswapfile
        \ norelativenumber

    " Now we can just write to the buffer, whatever you want.
    " call append('$', "")
    " for line in split(system('fortune -a'), '\n')
    "     call append('$', '        ' . l:line)
    " endfor
    call append('$', "")
    for line in split(system('cat ~/.vim/vimscreen'), '\n')
        call append('$', '        ' . l:line)
    endfor
    call append('$', "")
    " No modifications to this buffer
    setlocal nomodifiable nomodified

    " When we go to insert mode start a new buffer, and start insert
    nnoremap <buffer><silent> e :enew<CR>
    nnoremap <buffer><silent> i :enew <bar> startinsert<CR>
    nnoremap <buffer><silent> o :enew <bar> startinsert<CR>
endfun

" Run after "doing all the startup stuff"
autocmd VimEnter * call Start()
" }}}

" Plugins {{{
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ycm-core/YouCompleteMe'
"Plugin 'ap/vim-css-color'
Plugin 'chrisbra/Colorizer' " SLOW!!
"Plugin 'lilydjwg/colorizer'
Plugin 'Chiel92/vim-autoformat'
Plugin 'vimsence/vimsence'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'lervag/vimtex'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ervandew/supertab'
Plugin 'KeitaNakamura/tex-conceal.vim'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
"Plugin 'pyarmak/vim-pandoc-live-preview'
Plugin 'lingnand/pandoc-preview.vim'
Plugin 'nbouscal/vim-stylish-haskell'
Plugin 'neovimhaskell/haskell-vim'

call vundle#end()            " required
filetype plugin indent on    " require
" }}}

" {{{ VimScence
let g:vimsence_client_id = '832028561921409104'
let g:vimsence_small_text = 'Vim'
let g:vimsence_small_image = 'vim'
let g:vimsence_editing_details = 'Fucking up: {}'
let g:vimsence_editing_state = 'Making some: {}'
let g:vimsence_file_explorer_text = 'Climbing trees'
let g:vimsence_file_explorer_details = 'Looking for files'
" }}}

" {{{ Vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
" set g:vimtex_complete_close_braces
let g:livepreview_previewer = 'zathura'
" }}}

" {{{ Snippets
set conceallevel=1
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsEditSplit="vertical"
" }}}

" {{{ YCM
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_filetype_blacklist = {
      \ 'vim': 1,
      \ 'tagbar': 1,
      \ 'notes': 1,
      \ 'unite': 1,
      \ 'text': 1,
      \ 'vimwiki': 1,
      \ 'pandoc': 1,
      \ 'infolog': 1,
      \ 'leaderf': 1,
      \ 'mail': 1,
      \}
" }}}

" {{{ Markdown
let g:pandoc_preview_pdf_cmd = "zathura"
nnoremap <leader>v :PandocPreview<cr>
let g:pandoc_preview_pdf_cmd = "pandoc -f markdown -t pdf --pdf-engine=xelatex"
let g:pandoc_generate_pdf_dir = "pdfs"
" }}}

" {{{ Inkscape
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>
" }}}

" {{{ netrw
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
"}}}

" Settings {{{
set encoding=utf-8
set nocompatible
syntax enable
filetype indent on
set relativenumber
set number
set expandtab
set tabstop=4 shiftwidth=4
set softtabstop=4
set smarttab
set autoindent
set autoread
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch
set wildmenu
set showmatch
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
set path+=**
set timeoutlen=1000
set ttimeoutlen=0
let &titlestring = "vim " . expand("%:t")
set title
let g:python3_host_prog="/usr/bin/python3"
let mapleader = "\\"
" }}}

" {{{ C Syntax
" let g:cpp_class_scope_highlight = 1
" let g:cpp_member_variable_highlight = 1
" let g:cpp_class_decl_highlight = 1
" let g:cpp_posix_standard = 1
" let g:cpp_experimental_simple_template_highlight = 0
" let g:cpp_experimental_template_highlight = 1
" let g:cpp_concepts_highlight = 1
" let g:cpp_no_function_highlight = 1

" }}}

" Colour {{{
colorscheme gruvbox
set background=dark
let g:airline_theme='term'
"let g:colorizer_auto_color = 1
autocmd Filetype css let g:colorizer_auto_color = 1
hi Normal guibg=NONE ctermbg=NONE
hi Folded guibg=NONE ctermbg=NONE
" }}}o

" {{{ Maps

noremap <F3> :Autoformat<CR>
noremap <leader>hl :nohl<cr>
inoremap jk <esc>

nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-j> <C-w><C-j>

nnoremap <S-Tab> <C-w>w

inoremap <C-l> <esc>[sz=1<CR>$i

nnoremap ; :

" }}}
 
" {{{ File Maps
" Inkscape shorcuts
autocmd Filetype tex,markdown,pandoc inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "%:p:h/figures/"'<CR><CR>:w<CR>ggVG<Esc>
autocmd Filetype tex,markdown,pandoc nnoremap <C-f> : silent exec '!inkscape-figures edit "%:p:h/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>
" Inkscape Figures shortcuts (optimized for Markdown)
" autocmd Filetype pandoc,markdown inoremap <C-f> <Esc>: silent exec '.!~/.vim/scripts/ink.py %:p:h "'.getline('.').'"'<CR><CR>:redraw!<CR>
autocmd Filetype tex,markdown set spell
autocmd Filetype tex,markdown set spelllang=uk
autocmd Filetype tex,markdown set spelllang+=fr
autocmd FileType help wincmd L
autocmd FileType python nnoremap <C-s> :w<CR>: silent exec '.!autopep8 -i %'<CR>L:e!<CR>L
"}}}

" {{{ Other

" W saves as sudo
command W w !sudo tee % > /dev/null
autocmd FileChangedShell * echohl WarningMsg | echo "File changed shell." | echohl None


hi! EndOfBuffer ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE 
"}}}

" {{{ PseudoCode highlighting
autocmd BufNewFile,BufRead *.psc set syntax=psc
" }}}

" vim:foldmethod=marker:foldlevel=0

