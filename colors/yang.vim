" YinYang - black/white color scheme

if (&background ==# "dark" && get(g:, "colors_name", "") ==# "yang")
    runtime! colors/yin.vim
    finish
endif

highlight clear

if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "yang"


let s:palette = {}

let s:palette.white = [254, '#f7f7f7']
let s:palette.gray14 = [253, '#e3e3e3']
let s:palette.gray13 = [250, '#b9b9b9']
let s:palette.gray12 = [249, '#ababab']
let s:palette.gray11 = [248, '#a0a0a0']
let s:palette.gray10 = [247, '#999999']
let s:palette.gray09 = [246, '#8e8e8e']
let s:palette.gray08 = [245, '#868686']
let s:palette.gray07 = [244, '#7c7c7c']
let s:palette.gray06 = [243, '#747474']
let s:palette.gray05 = [242, '#686868']
let s:palette.gray04 = [241, '#5e5e5e']
let s:palette.gray03 = [239, '#525252']
let s:palette.gray02 = [238, '#464646']
let s:palette.gray01 = [235, '#252525']
let s:palette.black = [233, '#101010']

let s:palette.cyan = [66, '#008080']
let s:palette.purple = [98, '#5f5fd7']
let s:palette.brown = [130, '#875f00']
let s:palette.blue = [67, '#005faf']
let s:palette.green = [65, '#00875f']
let s:palette.red = [88, '#870000']
let s:palette.pink = [171, '#870000']
let s:palette.magenta = [125, '#87005f']


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


call s:hi('Normal', s:palette.gray03, s:palette.white, '')
set background=light

call s:hi('String', s:palette.gray06, [], '')
call s:hi('SpecialChar', s:palette.gray04, [], '')
call s:hi('Number', s:palette.gray08, [], '')
call s:hi('Constant', s:palette.gray08, [], 'bold')
call s:hi('Character', s:palette.gray07, [], 'bold')

call s:hi('Title', s:palette.gray05, [], 'bold')
call s:hi('Comment', s:palette.gray11, [], '')
call s:hi('SpecialComment', s:palette.gray11, [], 'bold')
call s:hi('Todo', s:palette.purple, s:palette.white, '')

call s:hi('LineNr', s:palette.gray12, s:palette.gray14, '')
call s:hi('FoldColumn', [], s:palette.gray14, '')
call s:hi('CursorLine', [], s:palette.gray14, 'none')
call s:hi('CursorLineNr', s:palette.gray07, s:palette.gray14, '')

call s:hi('Visual', [], s:palette.gray14, '')
call s:hi('VisualNOS', s:palette.gray07, [], '')
call s:hi('Search', s:palette.gray14, s:palette.gray10, 'none')
call s:hi('IncSearch', s:palette.pink, s:palette.white, 'bold')

call s:hi('SpellBad', s:palette.red, s:palette.white, 'undercurl')
call s:hi('SpellCap', s:palette.red, s:palette.white, 'undercurl')
call s:hi('SpellLocal', s:palette.red, s:palette.white, 'undercurl')
call s:hi('SpellRare', s:palette.brown, s:palette.white, 'undercurl')

call s:hi('Error', s:palette.red, s:palette.white, 'bold')
call s:hi('ErrorMsg', s:palette.red, s:palette.white, '')
call s:hi('WarningMsg', s:palette.brown, s:palette.white, '')
call s:hi('ModeMsg', s:palette.gray09, [], '')
call s:hi('MoreMsg', s:palette.gray09, [], '')

call s:hi('Include', s:palette.black, [], '')
call s:hi('Define', s:palette.gray05, [], 'none')
call s:hi('Macro', s:palette.gray04, [], '')
call s:hi('PreCondit', s:palette.gray02, s:palette.white, 'bold')
call s:hi('PreProc', s:palette.gray07, [], 'bold')

call s:hi('Identifier', s:palette.gray05, [], 'none')
call s:hi('Function', s:palette.gray04, [], '')
call s:hi('Keyword', s:palette.gray05, [], '')
call s:hi('Operator', s:palette.black, [], 'none')
call s:hi('MatchParen', s:palette.magenta, s:palette.white, '')

call s:hi('Type', s:palette.gray02, [], 'none')
call s:hi('Typedef', s:palette.gray02, [], 'bold')
call s:hi('StorageClass', s:palette.gray02, [], '')
call s:hi('Structure', s:palette.gray01, [], 'bold')

call s:hi('Conditional', s:palette.gray08, [], 'bold')
call s:hi('Label', s:palette.gray06, [], '')
call s:hi('Special', s:palette.gray05, [], '')
call s:hi('Statement', s:palette.gray01, [], '')
call s:hi('Tag', s:palette.gray06, [], '')

call s:hi('Cursor', s:palette.white, s:palette.gray11, '')
call s:hi('Underlined', s:palette.gray07, [], 'underline')
call s:hi('SpecialKey', s:palette.gray12, [], '')
call s:hi('NonText', s:palette.gray12, [], '')
call s:hi('Directory', s:palette.gray07, [], '')

call s:hi('Pmenu', s:palette.gray04, s:palette.gray13, 'none')
call s:hi('PmenuSbar', s:palette.white, s:palette.gray01, 'none')
call s:hi('PmenuSel', s:palette.gray13, s:palette.gray04, '')
call s:hi('PmenuThumb', s:palette.gray13, s:palette.gray03, 'none')

call s:hi('StatusLine', s:palette.gray03, s:palette.gray12, 'none')
call s:hi('StatusLineNC', s:palette.gray12, s:palette.gray14, 'none')
call s:hi('WildMenu', s:palette.gray07, [], '')
call s:hi('VertSplit', s:palette.gray12, s:palette.gray12, 'none')

call s:hi('DiffAdd', s:palette.white, s:palette.green, '')
call s:hi('DiffChange', s:palette.white, s:palette.blue, '')
call s:hi('DiffDelete', s:palette.white, s:palette.red, '')
call s:hi('DiffText', s:palette.blue, s:palette.white, 'underline')


highlight! link Float Number
highlight! link Boolean Number

highlight! link SignColumn CursorLine
highlight! link ColorColumn CursorLine
highlight! link CursorColumn CursorLine

highlight! link Folded LineNr
highlight! link Conceal Normal
highlight! link ErrorMsg Error

highlight! link Repeat Conditional
highlight! link Exception Conditional

highlight! link Debug Special
highlight! link Question Special
highlight! link Delimiter Special

highlight! link TabLine StatusLineNC
highlight! link TabLineFill StatusLineNC
highlight! link TabLineSel StatusLine

highlight! link DiffAdded DiffAdd
highlight! link DiffChanged DiffChange
highlight! link DiffRemoved DiffDelete


" RAINBOW PARENTHESES
let g:rbpt_colorpairs = [
            \ s:palette.cyan,
            \ s:palette.gray04,
            \ s:palette.purple,
            \ s:palette.green,
            \ s:palette.blue,
            \ s:palette.red,
            \ s:palette.pink,
            \ s:palette.brown,
            \ ]
