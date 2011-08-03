""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GVIM Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guifont=Monospace\ 9

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax Highlight
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme desertEx
syntax on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set acd         "change to directory of file in buffer
set ai          "automatically set the indent of a new line
set ar          "automatically read a file when it was modified outside of Vim
set enc=utf-8   "character encoding used in Vim: 'latin1', 'utf-8', 'euc-jp', 'big5', etc.
set et          "expand <Tab> to spaces in Insert mode
set fdm=marker  "folding type: 'manual', 'indent', 'expr', 'marker' or 'syntax'
set fen         "set to display all folds open
set fenc=utf-8  "character encoding for the current file
set hi=20		"how many command lines are remembered
set hls         "highlight all matches for the last used search pattern
set mouse=a     "list of flags for using the mouse
set noeb        "ring the bell for error messages
set nowrap      "long lines wrap
set nu          "show the line number for each line
set spl=en      "list of accepted languages
set sw=4        "number of spaces used for each step of (auto)indent
set tenc=utf-8  "character encoding used by the terminal
set ts=4        "number of spaces a <Tab> in the text stands for
set vb t_vb=""  "use a visual bell instead of beeping

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTOCOMPLETE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SHELL
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-s> :shell<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TABS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <S-Up> :tabnew<CR>
map <S-Down> :tabclose<CR>
map <S-Left> :tabprevious<CR>
map <S-Right> :tabnext<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TAG-LIST
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Show_One_File = 1
let Tlist_Max_Submenu_Items = 50
nmap <C-F10> :TlistToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TREE NAVIGATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeShowHidden = 1
nmap <C-F12> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TOGGLE PANELS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F10> :TlistToggle<CR>:NERDTreeToggle<CR><C-w><C-w>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS BAR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l/%04L,%04v][%p%%]\ [LEN=%L]
set laststatus=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OTHER
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
match errorMsg /\s\+$/
nmap <C-S> :%s/\s\+$//<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PHP Utilities
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding shortcuts
autocmd FileType php set ts=2
autocmd FileType php map <S-f><S-o> O// {{{
autocmd FileType php map <S-f><S-c> o// }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PHP-DOC
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pdv_cfg_CommentHead = "/**"
let g:pdv_cfg_Comment1 = " * "
let g:pdv_cfg_Commentn = " * "
let g:pdv_cfg_CommentTail = " */"
let g:pdv_cfg_CommentSingle = "//"

" Default values
let g:pdv_cfg_Type="mixed"
let g:pdv_cfg_Package=""
let g:pdv_cfg_Version=""
let g:pdv_cfg_Author="Fabio Cicerchia <f.cicerchia@dnsee.com>"
let g:pdv_cfg_Copyright="Copyright (C) DNSEE"
let g:pdv_cfg_License="No License Used"

autocmd FileType php inoremap <C-P> :call PhpDocSingle()<CR>i
autocmd FileType php nnoremap <C-P> :call PhpDocSingle()<CR>
autocmd FileType php vnoremap <C-P> :call PhpDocRange()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PHP Utilities
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" run file with PHP CLI (CTRL-M)
autocmd FileType php noremap <C-E> :w!<CR>:!/usr/bin/php5 %<CR>
" PHP parser check (CTRL-L)
autocmd FileType php noremap <C-L> :w!<CR>:call ParserCheck()<CR>

function! ParserCheck()
    let msg = system("/usr/bin/php5 -l " . expand("%:p") . " | sed -r 's/\\n/\\r/'")
    if strpart(msg, 0, 29) != "No syntax errors detected in "
        echohl WarningMsg | echo msg | echohl None
    else
        echomsg "No syntax errors detected"
    end
endfun

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" C Utilities
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding shortcuts
autocmd FileType c map <S-f><S-o> O// {{{
autocmd FileType c map <S-f><S-c> o// }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JavaScript Utilities
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding shortcuts
autocmd FileType javascript map <S-f><S-o> O// {{{
autocmd FileType javascript map <S-f><S-c> o// }}}

autocmd FileType yml set ts=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Function AutoIncrement
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:I=0

function! INC(increment)
    let g:I=g:I+a:increment
    return g:I
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTAGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap <C-]> <C-o><C-]>
map <C-d> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
nmap <leader>g :silent !$HOME/.vim/ctags_update.sh<CR>
set tags=tags;/

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TASK LIST
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:tlWindowPosition = 1
"autocmd BufReadPost,BufWritePost *.php,*.js,*.html,*.css,*.sh,*.xml,*.yml execute ":TaskList"

set cursorline
hi CursorLine ctermbg=Black
hi LineNr ctermbg=White ctermfg=Black
