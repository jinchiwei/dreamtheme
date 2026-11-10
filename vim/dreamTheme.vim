" dreamTheme - vim colorscheme with light + dark support (dark tuned to the brand palette)
" usage: set background=dark|light then :colorscheme dreamTheme

hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "dreamTheme"

" helper for concise highlight definitions
function! s:Hi(group, guifg, guibg, ctermfg, ctermbg, gui) abort
  execute "hi" a:group
        \ "guifg=" . a:guifg . " guibg=" . a:guibg
        \ "ctermfg=" . a:ctermfg . " ctermbg=" . a:ctermbg
        \ "gui=" . a:gui . " cterm=" . a:gui
endfunction

if &background ==# "dark"
  " dark palette, brand colors in priority order:
  "   turquoise #40E0D0 (main: cursor, functions, numbers, selection in menus)
  "   deeppink  #FF1493 (keywords, operators, imports, visual selection, dividers, errors)
  "   amber     #F0C840 (identifiers, types, search, warnings)
  "   mediumorchid #BA55D3 for blueviolet text (strings); #8A2BE2 itself is too dark for text
  " canvas is transparent so the terminal background shows through
  " text #E5E5EA, dim #7A7A8C, faint #5A5A66, surface #2B2B32, raised #1F1F29, ink #14141C

  " syntax
  call s:Hi("Normal",      "#E5E5EA", "NONE",    254, "NONE", "NONE")
  call s:Hi("Comment",     "#7A7A8C", "NONE",    244, "NONE", "italic")
  call s:Hi("Statement",   "#FF1493", "NONE",    198, "NONE", "NONE")
  call s:Hi("Operator",    "#FF1493", "NONE",    198, "NONE", "NONE")
  call s:Hi("String",      "#BA55D3", "NONE",    134, "NONE", "NONE")
  call s:Hi("Function",    "#40E0D0", "NONE",     80, "NONE", "NONE")
  call s:Hi("Boolean",     "#FF1493", "NONE",    198, "NONE", "NONE")
  call s:Hi("Type",        "#F0C840", "NONE",    221, "NONE", "NONE")
  call s:Hi("Tag",         "#F0C840", "NONE",    221, "NONE", "NONE")
  call s:Hi("PreProc",     "#FF1493", "NONE",    198, "NONE", "NONE")
  call s:Hi("Number",      "#40E0D0", "NONE",     80, "NONE", "NONE")
  call s:Hi("Float",       "#40E0D0", "NONE",     80, "NONE", "NONE")
  call s:Hi("Constant",    "#40E0D0", "NONE",     80, "NONE", "NONE")
  call s:Hi("Character",   "#BA55D3", "NONE",    134, "NONE", "NONE")
  call s:Hi("Identifier",  "#F0C840", "NONE",    221, "NONE", "italic")
  call s:Hi("Special",     "#FF7F50", "NONE",    209, "NONE", "NONE")
  call s:Hi("Delimiter",   "#E5E5EA", "NONE",    254, "NONE", "NONE")
  call s:Hi("Underlined",  "#40E0D0", "NONE",     80, "NONE", "underline")
  call s:Hi("Todo",        "#14141C", "#F0C840", 233, 221, "bold")
  call s:Hi("Error",       "#14141C", "#FF1493", 233, 198, "NONE")
  call s:Hi("Title",       "#40E0D0", "NONE",     80, "NONE", "bold")
  call s:Hi("Directory",   "#40E0D0", "NONE",     80, "NONE", "NONE")

  " cursor + selection
  call s:Hi("Cursor",      "#14141C", "#40E0D0", 233,  80, "NONE")
  call s:Hi("iCursor",     "#14141C", "#FF1493", 233, 198, "NONE")
  call s:Hi("Visual",      "#14141C", "#FF1493", 233, 198, "NONE")
  call s:Hi("Search",      "#14141C", "#F0C840", 233, 221, "NONE")
  call s:Hi("IncSearch",   "#14141C", "#40E0D0", 233,  80, "bold")
  call s:Hi("CurSearch",   "#14141C", "#40E0D0", 233,  80, "bold")
  call s:Hi("Substitute",  "#14141C", "#40E0D0", 233,  80, "NONE")
  call s:Hi("MatchParen",  "#FF1493", "NONE",    198, "NONE", "bold,underline")
  call s:Hi("CursorLine",  "NONE",    "#1F1F29", "NONE", 235, "NONE")
  call s:Hi("CursorColumn","NONE",    "#1F1F29", "NONE", 235, "NONE")
  call s:Hi("ColorColumn", "NONE",    "#1F1F29", "NONE", 235, "NONE")
  call s:Hi("QuickFixLine","NONE",    "#2B2B32", "NONE", 236, "NONE")

  " messages
  call s:Hi("ErrorMsg",    "#FF1493", "NONE",    198, "NONE", "bold")
  call s:Hi("WarningMsg",  "#F0C840", "NONE",    221, "NONE", "bold")
  call s:Hi("MoreMsg",     "#40E0D0", "NONE",     80, "NONE", "NONE")
  call s:Hi("Question",    "#40E0D0", "NONE",     80, "NONE", "NONE")
  call s:Hi("ModeMsg",     "#E5E5EA", "NONE",    254, "NONE", "bold")

  " ui groups to prevent end-of-buffer / empty-line weirdness
  call s:Hi("LineNr",      "#5A5A66", "NONE",     59, "NONE", "NONE")
  call s:Hi("CursorLineNr","#40E0D0", "NONE",     80, "NONE", "bold")
  call s:Hi("SignColumn",  "NONE",    "NONE",  "NONE", "NONE", "NONE")
  call s:Hi("FoldColumn",  "#5A5A66", "NONE",     59, "NONE", "NONE")
  call s:Hi("Folded",      "#7A7A8C", "#1F1F29", 244, 235, "italic")
  call s:Hi("NonText",     "#5A5A66", "NONE",     59, "NONE", "NONE")
  call s:Hi("SpecialKey",  "#5A5A66", "NONE",     59, "NONE", "NONE")
  call s:Hi("Whitespace",  "#2B2B32", "NONE",    236, "NONE", "NONE")
  call s:Hi("EndOfBuffer", "#2B2B32", "NONE",    236, "NONE", "NONE")
  call s:Hi("VertSplit",   "#FF1493", "NONE",    198, "NONE", "NONE")
  call s:Hi("WinSeparator","#FF1493", "NONE",    198, "NONE", "NONE")
  call s:Hi("StatusLine",  "#E5E5EA", "#2B2B32", 254, 236, "NONE")
  call s:Hi("StatusLineNC","#7A7A8C", "#1F1F29", 244, 235, "NONE")
  call s:Hi("TabLine",     "#7A7A8C", "#1F1F29", 244, 235, "NONE")
  call s:Hi("TabLineFill", "NONE",    "#1F1F29", "NONE", 235, "NONE")
  call s:Hi("TabLineSel",  "#14141C", "#40E0D0", 233,  80, "bold")
  call s:Hi("WildMenu",    "#14141C", "#40E0D0", 233,  80, "bold")
  call s:Hi("Pmenu",       "#E5E5EA", "#1F1F29", 254, 235, "NONE")
  call s:Hi("PmenuSel",    "#14141C", "#40E0D0", 233,  80, "bold")
  call s:Hi("PmenuSbar",   "NONE",    "#2B2B32", "NONE", 236, "NONE")
  call s:Hi("PmenuThumb",  "NONE",    "#5A5A66", "NONE",  59, "NONE")
  call s:Hi("NormalFloat", "#E5E5EA", "#1F1F29", 254, 235, "NONE")
  call s:Hi("FloatBorder", "#FF1493", "NONE",    198, "NONE", "NONE")
  call s:Hi("FloatTitle",  "#40E0D0", "NONE",     80, "NONE", "bold")

  " diffs + git signs
  call s:Hi("DiffAdd",     "NONE",    "#0F3A37", "NONE",  23, "NONE")
  call s:Hi("DiffChange",  "NONE",    "#3A3418", "NONE",  58, "NONE")
  call s:Hi("DiffDelete",  "#FF1493", "#3A1028", 198,  52, "NONE")
  call s:Hi("DiffText",    "NONE",    "#6B5A1C", "NONE",  94, "bold")
  call s:Hi("Added",       "#40E0D0", "NONE",     80, "NONE", "NONE")
  call s:Hi("Changed",     "#F0C840", "NONE",    221, "NONE", "NONE")
  call s:Hi("Removed",     "#FF1493", "NONE",    198, "NONE", "NONE")

  " diagnostics (neovim; harmless in vim)
  call s:Hi("DiagnosticError", "#FF1493", "NONE", 198, "NONE", "NONE")
  call s:Hi("DiagnosticWarn",  "#F0C840", "NONE", 221, "NONE", "NONE")
  call s:Hi("DiagnosticInfo",  "#40E0D0", "NONE",  80, "NONE", "NONE")
  call s:Hi("DiagnosticHint",  "#BA55D3", "NONE", 134, "NONE", "NONE")
  call s:Hi("DiagnosticOk",    "#40E0D0", "NONE",  80, "NONE", "NONE")
  call s:Hi("LspReferenceText",  "NONE", "#2B2B32", "NONE", 236, "NONE")
  call s:Hi("LspReferenceRead",  "NONE", "#2B2B32", "NONE", 236, "NONE")
  call s:Hi("LspReferenceWrite", "NONE", "#2B2B32", "NONE", 236, "bold")

  " undercurls (guisp sets the curl color)
  hi SpellBad   gui=undercurl cterm=undercurl guisp=#FF1493
  hi SpellCap   gui=undercurl cterm=undercurl guisp=#F0C840
  hi SpellRare  gui=undercurl cterm=undercurl guisp=#BA55D3
  hi SpellLocal gui=undercurl cterm=undercurl guisp=#40E0D0
  hi DiagnosticUnderlineError gui=undercurl cterm=undercurl guisp=#FF1493
  hi DiagnosticUnderlineWarn  gui=undercurl cterm=undercurl guisp=#F0C840
  hi DiagnosticUnderlineInfo  gui=undercurl cterm=undercurl guisp=#40E0D0
  hi DiagnosticUnderlineHint  gui=undercurl cterm=undercurl guisp=#BA55D3
else
  " light palette (solarized light base + your accent hues)
  call s:Hi("Normal",      "#073642", "#fdf6e3",  23, 230, "NONE")
  call s:Hi("Comment",     "#93a1a1", "NONE",    109, "NONE", "NONE")
  call s:Hi("Statement",   "#6c71c4", "NONE",     61, "NONE", "NONE")
  call s:Hi("Operator",    "#6c71c4", "NONE",     61, "NONE", "NONE")
  call s:Hi("Function",    "#d33682", "NONE",    161, "NONE", "NONE")
  call s:Hi("Boolean",     "#d33682", "NONE",    161, "NONE", "NONE")
  call s:Hi("Type",        "#d33682", "NONE",    161, "NONE", "NONE")
  call s:Hi("Tag",         "#d33682", "NONE",    161, "NONE", "NONE")
  call s:Hi("String",      "#6c71c4", "NONE",     61, "NONE", "NONE")
  call s:Hi("PreProc",     "#2aa198", "NONE",     37, "NONE", "NONE")
  call s:Hi("Number",      "#2aa198", "NONE",     37, "NONE", "NONE")
  call s:Hi("Float",       "#2aa198", "NONE",     37, "NONE", "NONE")
  call s:Hi("Identifier",  "#b58900", "NONE",    136, "NONE", "italic")
  call s:Hi("Visual",      "#073642", "#eee8d5",  23, 187, "NONE")
  call s:Hi("Search",      "#fdf6e3", "#d33682", 230, 161, "NONE")
  call s:Hi("ErrorMsg",    "#fdf6e3", "#b58900", 230, 136, "NONE")
  call s:Hi("WarningMsg",  "#fdf6e3", "#b58900", 230, 136, "NONE")
  call s:Hi("NonText",     "#93a1a1", "NONE",    109, "NONE", "NONE")
  call s:Hi("Cursor",      "#fdf6e3", "#268bd2", 230,  33, "NONE")
  call s:Hi("iCursor",     "#fdf6e3", "#d33682", 230, 161, "NONE")

  call s:Hi("LineNr",      "#93a1a1", "#fdf6e3", 109, 230, "NONE")
  call s:Hi("CursorLineNr","#073642", "#fdf6e3",  23, 230, "bold")
  call s:Hi("SignColumn",  "NONE",    "#fdf6e3", "NONE", 230, "NONE")
  call s:Hi("VertSplit",   "#eee8d5", "#fdf6e3", 187, 230, "NONE")
  call s:Hi("StatusLine",  "#073642", "#eee8d5",  23, 187, "NONE")
  call s:Hi("StatusLineNC","#93a1a1", "#eee8d5", 109, 187, "NONE")
  call s:Hi("Pmenu",       "#073642", "#eee8d5",  23, 187, "NONE")
  call s:Hi("PmenuSel",    "#fdf6e3", "#268bd2", 230,  33, "NONE")
  call s:Hi("EndOfBuffer", "#fdf6e3", "#fdf6e3", 230, 230, "NONE")
endif

" cursor shape for insert mode (terminal)
set guicursor+=i:iCursor

" cleanup
delfunction s:Hi
