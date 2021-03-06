set background=dark
hi clear

"if exists("syntax_on")
"    syntax reset
"endif

let colors_name="slate2"

hi Normal ctermbg=0 ctermfg=15 guibg=#181b1f guifg=#d0d0d0 gui=none
hi Cursor guibg=#c6e2ff guifg=#000000 gui=bold
hi CursorLine guibg=#333333
hi FoldColumn guibg=#363d45 guifg=fg gui=none
hi Folded guibg=#48525d guifg=fg gui=none
hi LineNr guibg=#24292e guifg=#666666 gui=none
hi NonText ctermfg=8 guibg=bg guifg=#878787 gui=bold
hi SignColumn guibg=#363d45 guifg=fg gui=none
hi StatusLine guibg=#9fb6cd guifg=#000000 gui=bold
hi StatusLineNC ctermbg=7 ctermfg=darkgray guibg=#6c7b8b guifg=#000000 gui=bold
hi VertSplit ctermbg=7 ctermfg=0 guibg=#6c7b8b guifg=#6c7b8b gui=bold
hi Visual ctermbg=7 ctermfg=0 guibg=#8598ac guifg=#000000 gui=bold
hi VisualNOS guibg=bg guifg=#8598ac gui=bold,underline
hi WildMenu guibg=#cccccc guifg=#000000 gui=bold

" Popup menu
hi Pmenu guifg=#d0d0d0 guibg=#4e5964 gui=none
hi PmenuSel guibg=#9fb6cd guifg=#000000 gui=none
hi PmenuThumb guibg=#6c7b8b gui=none

hi Directory guibg=bg guifg=#1e90ff gui=none
hi ErrorMsg guibg=#ee2c2c guifg=#ffffff gui=bold
hi DiffAdd guibg=#008b00 guifg=fg gui=none
hi DiffChange guibg=#00008b guifg=fg gui=none
hi DiffDelete guibg=#8b0000 guifg=fg gui=none
hi DiffText guibg=#00008b guifg=fg gui=bold
hi IncSearch guibg=#e7e7e7 guifg=#000000 gui=bold
hi ModeMsg guibg=bg guifg=fg gui=bold
hi MoreMsg guibg=bg guifg=#d0d097 gui=bold
hi Question guibg=bg guifg=#e0c07e gui=bold
hi Search guibg=#2f4f4f guifg=NONE
hi SpecialKey guibg=bg guifg=#a28b5b gui=none
hi Title guibg=bg guifg=#e7e7e7 gui=bold
hi WarningMsg guibg=bg guifg=#ee2c2c gui=bold

hi Comment guibg=bg guifg=#617183 gui=italic ctermfg=darkgray ctermbg=none
hi Constant guibg=bg guifg=#8fe779 gui=none
hi Error guibg=bg guifg=#ee2c2c gui=none
hi Identifier guibg=bg guifg=#7ee0ce gui=none
hi Ignore guibg=bg guifg=#373737 gui=none
hi lCursor guibg=fg guifg=bg gui=bold
hi PreProc guibg=bg guifg=#d7a0d7 gui=none
hi Special guibg=bg guifg=#e0c07e gui=none
hi Statement guibg=bg guifg=#7ec0ee gui=none
hi StorageClass guibg=bg guifg=#7ec0ee gui=none
hi Repeat guibg=bg guifg=#7ec0ee gui=none
hi Todo guibg=bg guifg=#bbbb87 gui=bold,underline
hi Type guibg=bg guifg=#f09479 gui=none
hi Underlined guibg=bg guifg=#1e90ff gui=underline

hi htmlBold guibg=bg guifg=fg gui=bold
hi htmlItalic guibg=bg guifg=fg gui=italic
hi htmlUnderline guibg=bg guifg=fg gui=underline
hi htmlBoldItalic guibg=bg guifg=fg gui=bold,italic
hi htmlBoldUnderline guibg=bg guifg=fg gui=bold,underline
hi htmlBoldUnderlineItalic guibg=bg guifg=fg gui=bold,underline,italic
hi htmlUnderlineItalic guibg=bg guifg=fg gui=underline,italic

" For showmarks plugin
hi ShowMarksHLl ctermbg=Yellow   ctermfg=Black  guibg=#6c8585    guifg=NONE
hi ShowMarksHLu ctermbg=Magenta  ctermfg=Black  guibg=#538585    guifg=NONE 

