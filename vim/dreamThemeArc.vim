" dreamThemeLight - Vim color file
" Legacy turquoise: #28daf2 orange: #ffb435 darkpurple: #8080ff potpourri: #ff0060

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

set t_Co=256
let g:colors_name = "dreamThemeArc"

hi Normal guifg=#f8f8f2 guibg=#272822 guisp=#272822 ctermfg=231 ctermbg=236
" hi Normal guifg=#073642 guibg=#fdf6e3 guisp=#fdf6e3 ctermfg=23 ctermbg=230 gui=NONE
hi Statement guifg=#ae81ff ctermfg=141 gui=NONE
hi Operator guifg=#ae81ff ctermfg=141 gui=NONE
hi Comment guifg=#a7a397 ctermfg=247 gui=NONE
hi Function guifg=#ff00d2 ctermfg=200 gui=NONE
hi Boolean guifg=#ff00d2 ctermfg=200 gui=NONE
hi String guifg=#ae81ff ctermfg=141 gui=NONE
hi PreProc guifg=#1ad0e8 ctermfg=51 gui=NONE
hi Number guifg=#1ad0e8 ctermfg=51 gui=NONE
hi Float guifg=#1ad0e8 ctermfg=51 gui=NONE
hi Search term=reverse guifg=#fdf6e3 guibg=#f92672 ctermfg=231 ctermbg=163 gui=NONE
hi iCursor guifg=#fdf6e3 guibg=#ff00d2 ctermfg=231 ctermbg=200
hi NonText guifg=#00ca6a gui=bold ctermfg=47
"hi CursorLine guifg=#bfbaac guibg=#eb9b15
"set guicursor+=i:ver100-iCursor
set guicursor+=i:iCursor
hi Cursor guifg=#fdf6e3 guibg=#28daf2 ctermfg=231 ctermbg=51
"hi CursorLine guifg=#192224 guibg=#ff0062 guisp=#ff0062 ctermfg=235 ctermbg=197 cterm=NONE
"hi CursorColumn guifg=#192224 guibg=#ff0062 guisp=#ff0062 ctermfg=235 ctermbg=197 cterm=NONE
"hi IncSearch guifg=#192224 guibg=#bfbaac guisp=#ff0060 gui=NONE ctermfg=235 ctermbg=197 cterm=NONE
hi Type guifg=#ff00d2 gui=NONE ctermfg=200
hi Tag guifg=#ff00d2 gui=NONE ctermfg=200
hi Visual guifg=#fdf6e3 guibg=#f92672 ctermfg=231 ctermbg=163
hi Identifier guifg=#ffb435 guibg=NONE gui=italic ctermfg=214
hi ErrorMsg guifg=#fdf6e3 guibg=#ffb435 gui=NONE  ctermfg=231 ctermbg=214
hi WarningMsg guifg=#fdf6e3 guibg=#ffb435 gui=NONE ctermfg=231 ctermbg=214
hi LineNr ctermfg=214 ctermbg=237 cterm=NONE guifg=#ffb435 guibg=NONE gui=NONE

"00CA6A Emerald
"hi Cursor ctermfg=235 ctermbg=231 cterm=NONE guifg=#272822 guibg=#f8f8f0 gui=NONE
"hi Visual ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#49483e gui=NONE
"hi CursorLine ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE guibg=#3c3d37 gui=NONE
"hi CursorColumn ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE guibg=#3c3d37 gui=NONE
"hi ColorColumn ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE guibg=#3c3d37 gui=NONE
"hi VertSplit ctermfg=241 ctermbg=241 cterm=NONE guifg=#64645e guibg=#64645e gui=NONE
"hi MatchParen ctermfg=197 ctermbg=NONE cterm=underline guifg=#f92672 guibg=NONE gui=underline
"hi StatusLine ctermfg=231 ctermbg=241 cterm=bold guifg=#f8f8f2 guibg=#64645e gui=bold
"hi StatusLineNC ctermfg=231 ctermbg=241 cterm=NONE guifg=#f8f8f2 guibg=#64645e gui=NONE
"hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
"hi PmenuSel ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#49483e gui=NONE
"hi IncSearch term=reverse cterm=reverse ctermfg=193 ctermbg=16 gui=reverse guifg=#C4BE89 guibg=#000000
"hi Search term=reverse cterm=NONE ctermfg=231 ctermbg=24 gui=NONE guifg=#f8f8f2 guibg=#204a87
"hi Directory ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
"hi Folded ctermfg=242 ctermbg=235 cterm=NONE guifg=#75715e guibg=#272822 gui=NONE
"hi SignColumn ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE guibg=#3c3d37 gui=NONE
"hi Normal ctermfg=231 ctermbg=235 cterm=NONE guifg=#f8f8f2 guibg=#272822 gui=NONE
"hi Boolean ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
"hi Character ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
"hi Comment ctermfg=242 ctermbg=NONE cterm=NONE guifg=#75715e guibg=NONE gui=NONE
"hi Conditional ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
"hi Constant ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
"hi Define ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
"hi DiffAdd ctermfg=231 ctermbg=64 cterm=bold guifg=#f8f8f2 guibg=#46830c gui=bold
"hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE guifg=#8b0807 guibg=NONE gui=NONE
"hi DiffChange ctermfg=NONE ctermbg=NONE cterm=NONE guifg=#f8f8f2 guibg=#243955 gui=NONE
"hi DiffText ctermfg=231 ctermbg=24 cterm=bold guifg=#f8f8f2 guibg=#204a87 gui=bold
"hi ErrorMsg ctermfg=231 ctermbg=197 cterm=NONE guifg=#f8f8f0 guibg=#f92672 gui=NONE
"hi WarningMsg ctermfg=231 ctermbg=197 cterm=NONE guifg=#f8f8f0 guibg=#f92672 gui=NONE
"hi Float ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
"hi Function ctermfg=148 ctermbg=NONE cterm=NONE guifg=#a6e22e guibg=NONE gui=NONE
"hi Identifier ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=italic
"hi Keyword ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
"hi Label ctermfg=186 ctermbg=NONE cterm=NONE guifg=#e6db74 guibg=NONE gui=NONE
"hi NonText ctermfg=59 ctermbg=236 cterm=NONE guifg=#49483e guibg=#31322c gui=NONE
"hi Number ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
"hi Operator ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
"hi PreProc ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
"hi Special ctermfg=231 ctermbg=NONE cterm=NONE guifg=#f8f8f2 guibg=NONE gui=NONE
"hi SpecialComment ctermfg=242 ctermbg=NONE cterm=NONE guifg=#75715e guibg=NONE gui=NONE
"hi SpecialKey ctermfg=59 ctermbg=237 cterm=NONE guifg=#49483e guibg=#3c3d37 gui=NONE
"hi Statement ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
"hi StorageClass ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=italic
"hi String ctermfg=186 ctermbg=NONE cterm=NONE guifg=#e6db74 guibg=NONE gui=NONE
"hi Tag ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
"hi Title ctermfg=231 ctermbg=NONE cterm=bold guifg=#f8f8f2 guibg=NONE gui=bold
"hi Todo ctermfg=95 ctermbg=NONE cterm=inverse,bold guifg=#75715e guibg=NONE gui=inverse,bold
"hi Type ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
"hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline

