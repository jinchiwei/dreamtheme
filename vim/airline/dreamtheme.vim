" dreamtheme - airline theme matching the dreamTheme colorscheme / brand palette
" turquoise = normal, deeppink = insert, blueviolet = visual, amber = command, coral = replace
" vim: tw=80 et sw=2 ts=2

" Colors {{{
let s:ink        = ['#14141C', 233]
let s:raised     = ['#1F1F29', 235]
let s:surface    = ['#2B2B32', 236]
let s:dim        = ['#7A7A8C', 244]
let s:text       = ['#E5E5EA', 254]
let s:turquoise  = ['#40E0D0',  80]
let s:deeppink   = ['#FF1493', 198]
let s:amber      = ['#F0C840', 221]
let s:blueviolet = ['#8A2BE2',  92]
let s:coral      = ['#FF7F50', 209]
"}}}

" Init {{{
" Translate color defs to airline format
fun! s:gen_def(fg, bg, ...)
  return [a:fg[0], a:bg[0], a:fg[1], a:bg[1], get(a:, 1, '')]
endfun
let s:bar_b = s:gen_def(s:text, s:surface)
let s:bar_c = s:gen_def(s:text, s:raised)
let g:airline#themes#dreamtheme#palette = {}
"}}}

" Modes {{{
" section a is the mode color; a modified buffer turns section c's text amber
fun! s:mode(name, fg, bg)
  let g:airline#themes#dreamtheme#palette[a:name] =
        \ airline#themes#generate_color_map(s:gen_def(a:fg, a:bg, 'bold'),
        \ s:bar_b, s:bar_c)
  let g:airline#themes#dreamtheme#palette[a:name . '_modified'] = {
        \ 'airline_c': s:gen_def(s:amber, s:raised) }
endfun
call s:mode('normal',      s:ink,  s:turquoise)
call s:mode('insert',      s:ink,  s:deeppink)
call s:mode('visual',      s:text, s:blueviolet)
call s:mode('replace',     s:ink,  s:coral)
call s:mode('commandline', s:ink,  s:amber)
"}}}

" Inactive {{{
let s:inactive = s:gen_def(s:dim, s:raised)
let g:airline#themes#dreamtheme#palette.inactive =
      \ airline#themes#generate_color_map(s:inactive, s:inactive, s:inactive)
let g:airline#themes#dreamtheme#palette.inactive_modified = {
      \ 'airline_c': s:gen_def(s:amber, s:raised) }
"}}}

" Warnings / errors (whitespace, linters) {{{
let s:warning = s:gen_def(s:ink, s:amber, 'bold')
let s:error   = s:gen_def(s:ink, s:deeppink, 'bold')
for s:m in keys(g:airline#themes#dreamtheme#palette)
  let g:airline#themes#dreamtheme#palette[s:m].airline_warning = s:warning
  let g:airline#themes#dreamtheme#palette[s:m].airline_error = s:error
endfor
"}}}

" Accents {{{
let g:airline#themes#dreamtheme#palette.accents = {
      \ 'red': [s:deeppink[0], '', s:deeppink[1], ''] }
"}}}
