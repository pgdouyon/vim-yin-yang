" YinYang - black/white color scheme

if (&background ==# "light" && get(g:, "colors_name", "") ==# "yin")
    runtime! colors/yang.vim
    finish
endif

highlight clear

if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "yin"


let s:palette = {}

let s:palette.black = [234, '#1c1c1c']
let s:palette.gray01 = [235, '#262626']
let s:palette.gray02 = [238, '#464646']
let s:palette.gray03 = [239, '#525252']
let s:palette.gray04 = [240, '#5e5e5e']
let s:palette.gray05 = [242, '#686868']
let s:palette.gray06 = [243, '#747474']
let s:palette.gray07 = [244, '#7c7c7c']
let s:palette.gray08 = [245, '#868686']
let s:palette.gray09 = [246, '#8e8e8e']
let s:palette.gray10 = [247, '#999999']
let s:palette.gray11 = [248, '#a0a0a0']
let s:palette.gray12 = [249, '#ababab']
let s:palette.gray13 = [250, '#b9b9b9']
let s:palette.gray14 = [251, '#c3c3c3']
let s:palette.gray15 = [254, '#e3e3e3']
let s:palette.white = [255, '#f7f7f7']

let s:palette.comments = [238, '#464646']

let s:palette.purple = [62, '#5f5fd7']
let s:palette.brown = [94, '#875f00']
let s:palette.blue = [24, '#005f87']
let s:palette.lightblue = [38, '#00afd7']
let s:palette.green = [29, '#00875f']
let s:palette.red = [88, '#870000']
let s:palette.magenta = [89, '#87005f']

if has("nvim") && (has("gui_running") || &termguicolors)
    let g:terminal_color_0 = s:palette.gray01[1]
    let g:terminal_color_1 = s:palette.gray06[1]
    let g:terminal_color_2 = s:palette.gray03[1]
    let g:terminal_color_3 = s:palette.gray11[1]
    let g:terminal_color_4 = s:palette.gray02[1]
    let g:terminal_color_5 = s:palette.gray08[1]
    let g:terminal_color_6 = s:palette.gray09[1]
    let g:terminal_color_7 = s:palette.gray13[1]
    let g:terminal_color_8 = s:palette.gray03[1]
    let g:terminal_color_9 = s:palette.gray10[1]
    let g:terminal_color_10 = s:palette.gray07[1]
    let g:terminal_color_11 = s:palette.gray15[1]
    let g:terminal_color_12 = s:palette.gray05[1]
    let g:terminal_color_13 = s:palette.gray12[1]
    let g:terminal_color_14 = s:palette.gray14[1]
    let g:terminal_color_15 = s:palette.white[1]
endif

function! s:hi(group, fg_color, bg_color, style)
    let highlight_command = ['hi', a:group]
    if !empty(a:fg_color)
        let [ctermfg, guifg] = a:fg_color
        call add(highlight_command, printf('ctermfg=%d guifg=%s', ctermfg, guifg))
    endif
    if !empty(a:bg_color)
        let [ctermbg, guibg] = a:bg_color
        call add(highlight_command, printf('ctermbg=%d guibg=%s', ctermbg, guibg))
    endif
    if !empty(a:style)
        call add(highlight_command, printf('cterm=%s gui=%s', a:style, a:style))
    endif
    execute join(highlight_command, ' ')
endfunction


call s:hi('Normal', s:palette.gray13, s:palette.black, '')
set background=dark

call s:hi('Constant', s:palette.gray05, [], 'bold')
call s:hi('String', s:palette.gray10, [], '')
call s:hi('Number', s:palette.gray05, [], '')

call s:hi('Identifier', s:palette.gray08, [], 'none')
call s:hi('Function', s:palette.gray08, [], '')

call s:hi('Statement', s:palette.gray04, [], 'bold')
call s:hi('Operator', s:palette.gray05, [], 'none')
call s:hi('Keyword', s:palette.gray04, [], '')

call s:hi('PreProc', s:palette.gray07, [], 'none')

call s:hi('Type', s:palette.gray05, [], '')

call s:hi('Special', s:palette.gray05, [], '')
call s:hi('SpecialComment', s:palette.comments, [], 'bold')

call s:hi('Title', s:palette.gray07, [], 'bold')
call s:hi('Todo', s:palette.purple, s:palette.black, '')
if has("nvim") || has("gui_running")
    call s:hi('Comment', s:palette.comments, [], 'italic')
else
    call s:hi('Comment', s:palette.comments, [], '')
endif

call s:hi('LineNr', s:palette.gray04, s:palette.gray01, 'none')
call s:hi('FoldColumn', s:palette.gray07, s:palette.gray01, 'none')
call s:hi('CursorLine', [], s:palette.gray01, 'none')
call s:hi('CursorLineNr', s:palette.gray14, s:palette.gray01, 'none')

call s:hi('Visual', s:palette.black, s:palette.gray06, '')
call s:hi('VisualNOS', s:palette.gray08, [], '')
call s:hi('Search', s:palette.gray01, s:palette.gray11, 'none')
call s:hi('IncSearch', s:palette.black, s:palette.gray07, 'bold')

call s:hi('SpellBad', s:palette.red, s:palette.black, 'undercurl')
call s:hi('SpellCap', s:palette.red, s:palette.black, 'undercurl')
call s:hi('SpellLocal', s:palette.red, s:palette.black, 'undercurl')
call s:hi('SpellRare', s:palette.brown, s:palette.black, 'undercurl')

call s:hi('Error', s:palette.red, s:palette.black, 'bold')
call s:hi('ErrorMsg', s:palette.red, s:palette.black, '')
call s:hi('WarningMsg', s:palette.brown, s:palette.black, '')
call s:hi('ModeMsg', s:palette.gray10, [], '')
call s:hi('MoreMsg', s:palette.gray10, [], '')

call s:hi('MatchParen', s:palette.magenta, s:palette.black, '')

call s:hi('Cursor', [], s:palette.gray12, '')
call s:hi('Underlined', s:palette.gray08, [], 'underline')
call s:hi('SpecialKey', s:palette.gray04, [], '')
call s:hi('NonText', s:palette.gray04, [], '')
call s:hi('Directory', s:palette.gray08, [], '')

call s:hi('Pmenu', s:palette.gray10, s:palette.gray03, 'none')
call s:hi('PmenuSbar', s:palette.black, s:palette.gray15, 'none')
call s:hi('PmenuSel', s:palette.gray03, s:palette.gray10, '')
call s:hi('PmenuThumb', s:palette.gray03, s:palette.gray09, 'none')

call s:hi('StatusLine', s:palette.gray11, s:palette.gray03, 'none')
call s:hi('StatusLineNC', s:palette.gray04, s:palette.gray01, 'none')
call s:hi('WildMenu', s:palette.gray08, [], '')
call s:hi('VertSplit', s:palette.gray03, s:palette.gray03, 'none')

call s:hi('DiffAdd', s:palette.black, s:palette.green, '')
call s:hi('DiffChange', s:palette.black, s:palette.blue, '')
call s:hi('DiffDelete', s:palette.black, s:palette.red, '')
call s:hi('DiffText', s:palette.black, s:palette.lightblue, '')
call s:hi('DiffAdded', s:palette.green, s:palette.black, '')
call s:hi('DiffChanged', s:palette.blue, s:palette.black, '')
call s:hi('DiffRemoved', s:palette.red, s:palette.black, '')

highlight! link Character Constant
highlight! link Float Number
highlight! link Boolean Number

highlight! link SignColumn FoldColumn
highlight! link ColorColumn FoldColumn
highlight! link CursorColumn CursorLine

highlight! link Folded LineNr
highlight! link Conceal Normal
highlight! link ErrorMsg Error

highlight! link Conditional Statement
highlight! link Repeat Statement
highlight! link Label Statement
highlight! link Exception Statement

highlight! link Include PreProc
highlight! link Define PreProc
highlight! link Macro PreProc
highlight! link PreCondit PreProc

highlight! link StorageClass Type
highlight! link Structure Type
highlight! link Typedef Type

highlight! link SpecialChar Special
highlight! link Tag Special
highlight! link Delimiter Special
highlight! link Debug Special
highlight! link Question Special

highlight! link TabLine StatusLineNC
highlight! link TabLineFill StatusLineNC
highlight! link TabLineSel StatusLine
