" DokuWiki syntax Vern Sun <s5unty@gmail.com>
" Vimwiki Home: http://code.google.com/p/vimwiki/

" text: **strong**
let g:vimwiki_rxBold = '\*\*[^*]\+\*\*'
let g:vimwiki_char_bold = '\*\*'

" text: ''emphasis''
let g:vimwiki_rxItalic = '\/\/[^/]\+\/\/'
let g:vimwiki_char_italic = '\/\/'

" text: '''''strong italic'''''
let g:vimwiki_rxBoldItalic = '\*\*\/\/[^/]\+\/\/\*\*'
let g:vimwiki_rxItalicBold = '\/\/\*\*[^*]\+\*\*\/\/'
let g:vimwiki_char_bolditalic = '\*\*\/\/'
let g:vimwiki_char_italicbold = '\/\/\*\*'

" text: `code`
let g:vimwiki_rxCode = '%%[^%]\+%%\|<nowiki>.\+<\/nowiki>'
let g:vimwiki_char_code = '%%\|<\/\?nowiki>'

" text: ~~deleted text~~
let g:vimwiki_rxDelText = '<del>.\+<\/del>'
let g:vimwiki_char_deltext = '<\/\?del>'

" text: ^superscript^
let g:vimwiki_rxSuperScript = '<sup>.\+<\/sup>'
let g:vimwiki_char_superscript = '<\/\?sup>'

" text: ,,subscript,,
let g:vimwiki_rxSubScript = '<sub>.\+<\/sub>'
let g:vimwiki_char_subscript = '<\/\?sub>'

" Header levels, 1-6
let g:vimwiki_rxH1 = '^\s*=\{6}[^=]\+.*[^=]\+=\{6}\s*$'
let g:vimwiki_rxH2 = '^\s*=\{5}[^=]\+.*[^=]\+=\{5}\s*$'
let g:vimwiki_rxH3 = '^\s*=\{4}[^=]\+.*[^=]\+=\{4}\s*$'
let g:vimwiki_rxH4 = '^\s*=\{3}[^=]\+.*[^=]\+=\{3}\s*$'
let g:vimwiki_rxH5 = '^\s*=\{2}[^=]\+.*[^=]\+=\{2}\s*$'
let g:vimwiki_rxH6 = '^\s*=\{2}[^=]\+.*[^=]\+=\{2}\s*$'
let g:vimwiki_rxHeader = '\%('.g:vimwiki_rxH1.'\)\|'.
      \ '\%('.g:vimwiki_rxH2.'\)\|'.
      \ '\%('.g:vimwiki_rxH3.'\)\|'.
      \ '\%('.g:vimwiki_rxH4.'\)\|'.
      \ '\%('.g:vimwiki_rxH5.'\)\|'.
      \ '\%('.g:vimwiki_rxH6.'\)'
let g:vimwiki_char_header = '\%(^\s*=\+\)\|\%(=\+\s*$\)'

" TODO Tables. 
let g:vimwiki_rxTable = ''

" Bulleted list items start with whitespace(s), then '*'
" highlight only bullets and digits.
let g:vimwiki_rxListBullet = '^\(\s\{2}\|\t\+\)\*\+\([^*]*$\)\@='
let g:vimwiki_rxListNumber = '^\(\s\{2}\|\t\+\)-\+'

let g:vimwiki_rxListDefine = '^\(\s\{2}\|\t\+\)[^*-]\+.*$'

" Preformatted text
let g:vimwiki_rxPreStart = '<code>\|<code\s\+[^>]\+>'
let g:vimwiki_rxPreEnd = '<\/code>'
