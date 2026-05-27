" dreamTheme - vim colorscheme with light + dark support
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
  " dark palette (monokai-ish base, your neon accents)
  call s:Hi("Normal",      "#f8f8f2", "#272822", 231, 236, "NONE")
  call s:Hi("Comment",     "#a7a397", "NONE",    247, "NONE", "NONE")
  call s:Hi("Statement",   "#ae81ff", "NONE",    141, "NONE", "NONE")
  call s:Hi("Operator",    "#ae81ff", "NONE",    141, "NONE", "NONE")
  call s:Hi("Function",    "#ff00d2", "NONE",    200, "NONE", "NONE")
  call s:Hi("Boolean",     "#ff00d2", "NONE",    200, "NONE", "NONE")
  call s:Hi("Type",        "#ff00d2", "NONE",    200, "NONE", "NONE")
  call s:Hi("Tag",         "#ff00d2", "NONE",    200, "NONE", "NONE")
  call s:Hi("String",      "#ae81ff", "NONE",    141, "NONE", "NONE")
  call s:Hi("PreProc",     "#1ad0e8", "NONE",     51, "NONE", "NONE")
  call s:Hi("Number",      "#1ad0e8", "NONE",     51, "NONE", "NONE")
  call s:Hi("Float",       "#1ad0e8", "NONE",     51, "NONE", "NONE")
  call s:Hi("Identifier",  "#ffb435", "NONE",    214, "NONE", "italic")
  call s:Hi("Visual",      "#fdf6e3", "#f92672", 231, 163, "NONE")
  call s:Hi("Search",      "#fdf6e3", "#f92672", 231, 163, "NONE")
  call s:Hi("ErrorMsg",    "#fdf6e3", "#ffb435", 231, 214, "NONE")
  call s:Hi("WarningMsg",  "#fdf6e3", "#ffb435", 231, 214, "NONE")
  call s:Hi("NonText",     "#00ca6a", "NONE",     47, "NONE", "bold")
  call s:Hi("Cursor",      "#fdf6e3", "#28daf2", 231,  51, "NONE")
  call s:Hi("iCursor",     "#fdf6e3", "#ff00d2", 231, 200, "NONE")

  " ui groups to prevent end-of-buffer / empty-line weirdness
  call s:Hi("LineNr",      "#6e6b63", "#272822", 242, 236, "NONE")
  call s:Hi("CursorLineNr","#f8f8f2", "#272822", 231, 236, "bold")
  call s:Hi("SignColumn",  "NONE",    "#272822", "NONE", 236, "NONE")
  call s:Hi("VertSplit",   "#3f3f3f", "#272822", 238, 236, "NONE")
  call s:Hi("StatusLine",  "#f8f8f2", "#3f3f3f", 231, 238, "NONE")
  call s:Hi("StatusLineNC","#a7a397", "#3f3f3f", 247, 238, "NONE")
  call s:Hi("Pmenu",       "#f8f8f2", "#3f3f3f", 231, 238, "NONE")
  call s:Hi("PmenuSel",    "#272822", "#ffb435", 236, 214, "NONE")
  call s:Hi("EndOfBuffer", "#272822", "#272822", 236, 236, "NONE")
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
