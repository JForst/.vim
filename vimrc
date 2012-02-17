" Reformat paragraph
nnoremap Q gqap
vnoremap Q gq

" take indent for new line from previous line
set autoindent

" smart autoindenting for C programs
set smartindent

" highlight match while typing search pattern
set incsearch

"ignore case in search patterns
set ignorecase

" no ignore case when pattern has uppercase
set smartcase

" highlight matches with last search pattern
set nohlsearch

" show cursor line and column in the status line
set ruler

" message on status line to show current mode
set showmode

" briefly jump to matching bracket if insert one
set showmatch

" tenths of a second to show matching paren
set matchtime=3

" number of spaces that <Tab> in file uses
set tabstop=4

" number of spaces to use for (auto)indent step
set shiftwidth=4

" use spaces when <Tab> is inserted
set expandtab

" wrap long lines at a blank
set nolinebreak

" Ignore case in search patterns.
set ignorecase

" allow backspacing over the start of insert
set backspace=2

" the screen contents is NOT restored when exiting Vim
" set t_ti= t_te=
" use .viminfo file upon startup and exiting
set viminfo='50,\"50,n~/.viminfo

" don't give the intro message when starting Vim
set shortmess=I

" recognize function keys in Insert mode
set esckeys

" filetype recognition on
:filetype on
:filetype plugin on

set background=dark
syntax on


"pathogen for loading .vim/bundle plugins
" filetype off 
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" jf definitionen
colorscheme zenburn
"
"Y kopiert bis zum Ende der Zeile
map Y y$
"
"
" Paste Mode On/Off 
set pastetoggle=<F9> 

let paste_mode = 0 " 0 = normal, 1 = paste 
func! Paste_on_off() 
        if g:paste_mode == 0 
                set paste 
                let g:paste_mode = 1 
        else 
                set nopaste 
                let g:paste_mode = 0 
        endif   
        return 
endfunc

function! Komment()
  if getline(".") =~ '^#'
    let hls=@/
    s/^#//
    let @/=hls
  else
    let hls=@/
    s/^/#/
    let @/=hls
  endif
endfunction


" NERDTree auf F2
map <silent><F2> :NERDTreeToggle<CR>
map <silent> <F3> :call BufferList()<CR>
map <silent><F4> :call Komment()<CR>
map <F9> :call Paste_on_off()<CR> 
map <F10> :! perl -d % <CR>
map <F11> :! perl % <CR>

" syntaxhighlighting off im diff mdde
if &diff
syntax off
else
syntax on
endif

" perl
filetype plugin indent on
"
" perltidy
nnoremap ,pt :%!perltidy -q<cr> " only works in 'normal' mode
vnoremap ,pt :!perltidy -q<cr> " only works in 'visual' mode
"
" ctags
" suche Tags von . bis $HOME
set tags=./tags;$HOME
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" ctags automatisch nach Bufwrite aufrufen
" better manually or after git commit " au BufWritePost *.pl,*.pm,*.wiki silent! !ctags -R &
"
"ctags 
let tlist_vimwiki_settings = 'vimwiki;h:Headers'
"Taglist
"Toggle on <F8>
map <F8> :TlistToggle<cr>
"
function! OpenTlist()
    let myfile = expand("%")
    let myfiletype = expand("%:e")
    if myfiletype == "pl" || myfiletype == "pm" || myfiletype == "wiki"
        Tlist
    end
endfunction
"au BufRead * call OpenTlist()
"
" cpan App:Ack
" define Ex command "Ack" that searches using ack and displays the results
" lexpr fills the location list and jumps to the first location (file)
" lgete just fills the location list - no jumping

" the function which will be executed by the Ack command
function! Ack_Search(command)
    lgete system("ack --type-set TYPE=.wiki " . a:command)        "call ack ... 
                                            " including .wiki files
    lopen                                   "open location list under current window
                                            "- jumps to location list
    wincmd k                                "jump back to previous window
endfunction

" definiton of the Ack command
" -narags=+         arguments must be supplied, but any number are allowed
" -complete=file    file name completion
" <q-args>          quoted arguments for use in expressions

command! -nargs=+ -complete=file Ack call Ack_Search(<q-args>)


