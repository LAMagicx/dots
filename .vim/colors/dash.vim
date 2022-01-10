" Dash Color Scheme

" Configutation {{{

if !has('gui_running') && &t_Co != 88 && &t_Co != 256
	finish
endif

highlight clear

if exists('syntax on')
	syntax reset
endif

let g:colors_name='dash'

" Color Pallet {{{

let s:dc = {}

" Scheme Colors

" Pimary Colors
let s:dc.background = ['#1c1c1c', 234]
let s:dc.foreground = ['#e4e4e4', 254]

" Normal Colors
let s:dc.black =            ['#303030', 236]
let s:dc.red =              ['#ff8787', 210]
let s:dc.green =            ['#87ff87', 120]
let s:dc.blue =             ['#8787ff', 105]
let s:dc.yellow =           ['#ffafaf', 217]
let s:dc.magenta =          ['#afafff', 147]
let s:dc.cyan =             ['#afffaf', 157]
let s:dc.white =            ['#585858', 240]

" Bright Colors
let s:dc.bright_black =     ['#a8a8a8', 248]
let s:dc.bright_red =       ['#ff5f5f', 203]
let s:dc.bright_green =     ['#5fff5f', 83]
let s:dc.bright_blue =      ['#5f5fff', 63]
let s:dc.bright_yellow =    ['#ffaf5f', 215]
let s:dc.bright_magenta =   ['#af5fff', 135]
let s:dc.bright_cyan =      ['#5fffaf', 85]
let s:dc.bright_white =     ['#767676', 243]

let s:fg =				  s:dc.foreground
let s:bg =				  s:dc.background
let s:bg_light =    s:dc.bright_black
let s:comment =			s:dc.white
let s:sublte =			s:dc.black
let s:selection =		s:dc.bright_red
let s:fold =        s:dc.bright_black

let s:red =				s:dc.red
let s:green  =			s:dc.green
let s:yellow =			s:dc.yellow
let s:blue =			s:dc.blue
let s:magenta =			s:dc.magenta
let s:cyan =			s:dc.cyan
let s:white  =			s:dc.white

let s:bright_red =			s:dc.bright_red
let s:bright_green  =		s:dc.bright_green
let s:bright_yellow =		s:dc.bright_yellow
let s:bright_blue =			s:dc.bright_blue
let s:bright_magenta =		s:dc.bright_magenta
let s:bright_cyan =		  	s:dc.bright_cyan
let s:bright_white  =		s:dc.bright_white
let s:none =			["NONE", "NONE"]
  
" }}}

" Scripts {{{
" helper functions stolen from dracula 
let s:attrs = {
      \'bold': 'bold',
      \'italic': 'italic',
      \'underline': 'underline',
      \'undercurl': 'undercurl',
      \'inverse': 'inverse'}

function! s:h(scope, fg, ...) " bg, attr_list, special
  let l:fg = copy(a:fg)
  let l:bg = get(a:, 1, ['NONE', 'NONE'])

  let l:attr_list = filter(get(a:, 2, ['NONE']), 'type(v:val) == 1')
  let l:attrs = len(l:attr_list) > 0 ? join(l:attr_list, ',') : 'NONE'

  " If the UI does not have full support for special attributes (like underline and
  " undercurl) and the highlight does not explicitly set the foreground color,
  " make the foreground the same as the attribute color to ensure the user will
  " get some highlight if the attribute is not supported. The default behavior
  " is to assume that terminals do not have full support, but the user can set
  " the global variable `g:dracula_full_special_attrs_support` explicitly if the
  " default behavior is not desirable.
  let l:special = get(a:, 3, ['NONE', 'NONE'])
  " if l:special[0] !=# 'NONE' && l:fg[0] ==# 'NONE' && !g:dracula_full_special_attrs_support
  "   let l:fg[0] = l:special[0]
  "   let l:fg[1] = l:special[1]
  " endif

  let l:hl_string = [
        \ 'highlight', a:scope,
        \ 'guifg=' . l:fg[0], 'ctermfg=' . l:fg[1],
        \ 'guibg=' . l:bg[0], 'ctermbg=' . l:bg[1],
        \ 'gui=' . l:attrs, 'cterm=' . l:attrs,
        \ 'guisp=' . l:special[0],
        \]

  execute join(l:hl_string, ' ')
endfunction
  
" }}}

" Colors {{{

" Groups {{{
call s:h('DashRed',               s:red,      s:none)
call s:h('DashRedInverse',        s:none,     s:red)
call s:h('DashRedBold',           s:red,      s:none, [s:attrs.bold])
call s:h('DashRedUnderline',      s:red,      s:none, [s:attrs.underline])
call s:h('DashRedUnderCurl',      s:red,      s:none, [s:attrs.undercurl])
call s:h('DashRedItalic',         s:red,      s:none, [s:attrs.italic])
call s:h('DashGreen',             s:green,    s:none)
call s:h('DashGreenInverse',      s:none,     s:green)
call s:h('DashGreenBold',         s:green,    s:none, [s:attrs.bold])
call s:h('DashGreenItalic',       s:green,    s:none, [s:attrs.italic])
call s:h('DashGreenUnderline',    s:green,    s:none, [s:attrs.underline])
call s:h('DashGreenUndercurl',    s:green,    s:none, [s:attrs.undercurl])
call s:h('DashYellow',            s:yellow,   s:none)
call s:h('DashYellowInverse',     s:none,     s:yellow)
call s:h('DashYellowBold',        s:yellow,   s:none, [s:attrs.bold])
call s:h('DashYellowItalic',      s:yellow,   s:none, [s:attrs.italic])
call s:h('DashYellowUnderline',   s:yellow,   s:none, [s:attrs.underline])
call s:h('DashYellowUndercurl',   s:yellow,   s:none, [s:attrs.undercurl])
call s:h('DashBlue',              s:blue,     s:none)
call s:h('DashBlueInverse',       s:none,     s:blue)
call s:h('DashBlueBold',          s:blue,     s:none, [s:attrs.bold])
call s:h('DashBlueItalic',        s:blue,     s:none, [s:attrs.italic])
call s:h('DashBlueUnderline',     s:blue,     s:none, [s:attrs.underline])
call s:h('DashBlueUndercurl',     s:blue,     s:none, [s:attrs.undercurl])
call s:h('DashMagenta',           s:magenta,  s:none)
call s:h('DashMagentaInverse',    s:none,     s:magenta)
call s:h('DashMagentaBold',       s:magenta,  s:none, [s:attrs.bold])
call s:h('DashMagentaItalic',     s:magenta,  s:none, [s:attrs.italic])
call s:h('DashMagentaUnderline',  s:magenta,  s:none, [s:attrs.underline])
call s:h('DashMagentaUndercurl',  s:magenta,  s:none, [s:attrs.undercurl])
call s:h('DashCyan',              s:cyan,     s:none)
call s:h('DashCyanInverse',       s:none,     s:cyan)
call s:h('DashCyanBold',          s:cyan,     s:none, [s:attrs.bold])
call s:h('DashCyanItalic',        s:cyan,     s:none, [s:attrs.italic])
call s:h('DashCyanUnderline',     s:cyan,     s:none, [s:attrs.underline])
call s:h('DashCyanUndercurl',     s:cyan,     s:none, [s:attrs.undercurl])
call s:h('DashWhite',             s:white,    s:none)
call s:h('DashWhiteInverse',      s:none,     s:white)
call s:h('DashWhiteBold',         s:white,    s:none, [s:attrs.bold])
call s:h('DashWhiteItalic',       s:white,    s:none, [s:attrs.italic])
call s:h('DashWhiteUnderline',    s:white,    s:none, [s:attrs.underline])
call s:h('DashWhiteUndercurl',    s:white,    s:none, [s:attrs.undercurl])
call s:h('DashBrightRed',               s:bright_red,      s:none)
call s:h('DashBrightRedInverse',        s:none,     s:red)
call s:h('DashBrightRedBold',           s:bright_red,      s:none, [s:attrs.bold])
call s:h('DashBrightRedUnderline',      s:bright_red,      s:none, [s:attrs.underline])
call s:h('DashBrightRedUnderCurl',      s:bright_red,      s:none, [s:attrs.undercurl])
call s:h('DashBrightRedItalic',         s:bright_red,      s:none, [s:attrs.italic])
call s:h('DashBrightGreen',             s:bright_green,    s:none)
call s:h('DashBrightGreenInverse',      s:none,     s:green)
call s:h('DashBrightGreenBold',         s:bright_green,    s:none, [s:attrs.bold])
call s:h('DashBrightGreenItalic',       s:bright_green,    s:none, [s:attrs.italic])
call s:h('DashBrightGreenUnderline',    s:bright_green,    s:none, [s:attrs.underline])
call s:h('DashBrightGreenUndercurl',    s:bright_green,    s:none, [s:attrs.undercurl])
call s:h('DashBrightYellow',            s:bright_yellow,   s:none)
call s:h('DashBrightYellowInverse',     s:none,     s:yellow)
call s:h('DashBrightYellowBold',        s:bright_yellow,   s:none, [s:attrs.bold])
call s:h('DashBrightYellowItalic',      s:bright_yellow,   s:none, [s:attrs.italic])
call s:h('DashBrightYellowUnderline',   s:bright_yellow,   s:none, [s:attrs.underline])
call s:h('DashBrightYellowUndercurl',   s:bright_yellow,   s:none, [s:attrs.undercurl])
call s:h('DashBrightBlue',              s:bright_blue,     s:none)
call s:h('DashBrightBlueInverse',       s:none,     s:blue)
call s:h('DashBrightBlueBold',          s:bright_blue,     s:none, [s:attrs.bold])
call s:h('DashBrightBlueItalic',        s:bright_blue,     s:none, [s:attrs.italic])
call s:h('DashBrightBlueUnderline',     s:bright_blue,     s:none, [s:attrs.underline])
call s:h('DashBrightBlueUndercurl',     s:bright_blue,     s:none, [s:attrs.undercurl])
call s:h('DashBrightMagenta',           s:bright_magenta,  s:none)
call s:h('DashBrightMagentaInverse',    s:none,     s:magenta)
call s:h('DashBrightMagentaBold',       s:bright_magenta,  s:none, [s:attrs.bold])
call s:h('DashBrightMagentaItalic',     s:bright_magenta,  s:none, [s:attrs.italic])
call s:h('DashBrightMagentaUnderline',  s:bright_magenta,  s:none, [s:attrs.underline])
call s:h('DashBrightMagentaUndercurl',  s:bright_magenta,  s:none, [s:attrs.undercurl])
call s:h('DashBrightCyan',              s:bright_cyan,     s:none)
call s:h('DashBrightCyanInverse',       s:none,     s:cyan)
call s:h('DashBrightCyanBold',          s:bright_cyan,     s:none, [s:attrs.bold])
call s:h('DashBrightCyanItalic',        s:bright_cyan,     s:none, [s:attrs.italic])
call s:h('DashBrightCyanUnderline',     s:bright_cyan,     s:none, [s:attrs.underline])
call s:h('DashBrightCyanUndercurl',     s:bright_cyan,     s:none, [s:attrs.undercurl])
call s:h('DashBrightWhite',             s:bright_white,    s:none)
call s:h('DashBrightWhiteInverse',      s:none,     s:white)
call s:h('DashBrightWhiteBold',         s:bright_white,    s:none, [s:attrs.bold])
call s:h('DashBrightWhiteItalic',       s:bright_white,    s:none, [s:attrs.italic])
call s:h('DashBrightWhiteUnderline',    s:bright_white,    s:none, [s:attrs.underline])
call s:h('DashBrightWhiteUndercurl',    s:bright_white,    s:none, [s:attrs.undercurl])
" }}}

" background
call s:h('DashBg', s:none, s:bg)
" foreground
call s:h('DashFg', s:fg, s:none)
call s:h('DashFgBg', s:fg, s:bg_light)
call s:h('Default', s:fg, s:bg)
call s:h('DashPop', s:fg, s:none, [s:attrs.bold])
call s:h('DashCursor', s:none, s:none, [s:attrs.inverse])
call s:h('DashSpell', s:none, s:none, [s:attrs.underline], s:red)
" comment
call s:h('DashComment', s:comment, s:none)
" selection
call s:h('DashSelection', s:none, s:none, [s:attrs.inverse])
call s:h('DashSearch', s:red, s:none, [s:attrs.bold, s:attrs.underline])
" sublte
call s:h('DashSublte', s:sublte, s:none)
" error
call s:h('DashError', s:none, s:none, [], s:red)
call s:h('DashNone', s:none, s:none)
call s:h('DashHide', s:bg, s:none)
" others
call s:h('DashBoundry', s:comment, s:none)
call s:h('DashStatus', s:red, s:none)
call s:h('DashFold', s:fold, s:none)

" }}}

" Matches {{{

syntax match Operators '+'
syntax match Operators '-'
syntax match Operators '*'
syntax match Operators '\(^\|[^\/]\)\zs\/\ze\($\|[^\/]\)'
syntax match Operators '%'
syntax match Logic '&&'
syntax match Logic '||'
syntax match Logic ' and '
syntax match Logic ' or '
syntax region Brackets matchgroup=Function start=+TestFun\s*(+ end=+)$+ contains=ALL keepend

" }}}
" }}}

" Highlights {{{
" by alphabetical order

hi! link Boolean                    Constant
hi! link Character                  DashCyan
hi! link ColorColumn                Default
hi! link Comment                    DashComment
hi! link Conceal                    Default
hi! link Conditional                DashBrightYellow
hi! link Constant                   DashBrightMagenta
hi! link Cursor                     DashCursor
" hi! link vCursor                  Cursor
" hi! link iCursor                  Cursor
" hi! link lCursor                  Cursor
hi! link CursorColumn               Default
hi! link CursorLine                 Default
hi! link CursorLineNr               DashRedBold
hi! link Debug                      DashError
hi! link Define                     PreProc
hi! link Delimiter                  DashFg
hi! link DiffAdd                    Default
hi! link DiffChange                 Default
hi! link DiffDelete                 Default
hi! link DiffRemoved                Default
hi! link DiffText                   Default
hi! link Directory                  DashGreen
hi! link Error                      DashError
hi! link ErrorMsg                   DashError
hi! link Exception                  Statement
hi! link Float                      Constant
hi! link FoldColumn                 Default
hi! link Folded                     DashFold
hi! link Function                   DashBrightRed
hi! link Identifier                 Function
hi! link Ignore                     DashHide
hi! link IncSearch                  DashBrightRedBold
hi! link Include                    DashCyan
" in vim  help pages :
hi! link helpHyperTextJump          DashCyan
hi! link helpCommand                Default
hi! link helpExample                DashGreen
hi! link helpBacktick               Default
hi! link Keyword                    Label
hi! link Label                      DashCyan
hi! link LineNr                     DashBoundry
hi! link Logic                      Operators
hi! link Macro                      PreProc
hi! link NonText                    DashHide
hi! link Normal                     DashFg
hi! link Number                     Constant
hi! link Operator                   Statment
hi! link Operators                  DashCyan
hi! link Pmenu                      DashPop
hi! link PmenuSbar                  Default
hi! link PmenuSel                   DashSelection
hi! link PmenuThumb                 Default
hi! link PreCondit                  DashGreen
hi! link PreProc                    DashYellow
hi! link Question                   Default
hi! link QuickFixLine               Default
hi! link Repeat                     Statement
hi! link Search                     DashSearch
hi! link SignColumn                 Default
hi! link Special                    DashCyan
hi! link SpecialChar                DashBlue
hi! link SpecialComment             DashCyanInverse
hi! link SpecialKey                 DashRed
hi! link SpellBad                   DashSpell
hi! link SpellCap                   SpellBad
hi! link SpellLocal                 SpellBad
hi! link SpellRare                  SpellBad
hi! link Statement                  DashRed
hi! link StatusLine                 DashStatus
hi! link StatusLineNC               DashFg
hi! link StatusLineTerm             StatusLine
hi! link StatusLineTermNC           DashFg
hi! link StorageClass               Type
hi! link String                     DashGreen
hi! link Structure                  DashRed
hi! link TabLine                    Default
hi! link TabLineFill                Default
hi! link TabLineSel                 Default
hi! link Tag                        Default
hi! link Title                      DashRedBold
hi! link Todo                       DashSublte
hi! link ToolbarButton              Default
hi! link ToolbarLine                Default
hi! link Type                       DashYellow
hi! link Typedef                    Type
hi! link VertSplit                  DashSublte
hi! link Visual                     DashSelection
hi! link VisualNOS                  Default
hi! link Underlined                 DashRedUnderline
hi! link WarningMsg                 DashError
hi! link WildMenu                   DashPop
hi! link helpBackt                  Default
hi! link vimBufnrWarn               Default
hi! link vimWarn                    DashNone
  
" }}}

" vim: foldmethod=marker tabstop=2 softtabstop=2 shiftwidth=2 foldlevel=0 et:

