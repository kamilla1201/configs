execute pathogen#infect()
syntax on
filetype plugin indent on

set nocompatible " disable the compatibility with vi

" open multiple files in separate tabs
nmap <c-f> :cs find g <c-r>=expand("<cword>")<cr><cr>
autocmd VimEnter * nested if argc() > 1 && !&diff | tab sball | tabfirst | endif

runtime bundle/cpp_cpplint.vim
set tags+=tags;~/workspace/nextunity_aslamk/

color desert

" Recommended Syntastic settings {{{

set statusline+=%#warningmsg#  " customize the text in the status line
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_java_maven_options = '-s /home/cyc/workspace/cyclone-controlpath/devops-scripts/settings.xml -Dmaven.repo.local=/home/cyc/.m2/repository'

" }}}

" Editing behaviour {{{
let mapleader = "`"

set mouse=a                                    " enable using the mouse if terminal emulator supports it (xterm does)
"if has('mouse')
"  set mouse=a
"endif
set showmatch                                  " set show matching parenthesis
set showcmd                                    " shows the current command
set hlsearch                                   " highlight search terms
set incsearch                                  " show search matches as you type
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

set tabstop=2                                  " a tab is four spaces
set shiftwidth=2                               " number of spaces to use for autoindenting
set smarttab                                   " insert tabs on the start of a line according to shiftwidth, not tabstop
set expandtab                                  " expand tabs by default (overloadable per file type later)
set smartindent
set ignorecase                                 " case-insensitive when searching for an all-lowercase string
set smartcase                                  " ignore case if search pattern is all lowercase, case-sensitive otherwise
set list                                       " show invisible chars
set listchars=tab:>-,trail:•,extends:»,precedes:«,nbsp:¬ " show invisible chars



match ErrorMsg '\s\+$' " highlight trail spaces
" set nolist                      " show invisible chars only for some file types

au FocusLost * :wa                             " save on losing focus

nnoremap <leader><space> :noh<cr>              " disable last search highlighting
nnoremap <leader>v V`]                         " reselect the text that was just pasted
" }}}

set pastetoggle=<F2>                           " when in insert mode, press <F2> to go to past with/without autoindentation

nnoremap <C-t> :tabnew<Space>
inoremap <C-t> <Esc>:tabnew<Space>

"nnoremap / /\v                                " use python regex
"vnoremap / /\v

noremap! <F1> <Esc>                            " Avoid accidental hits of F1 while aiming for Esc
noremap <F9> <Esc>:tabp<CR>
noremap <F10> <Esc>:tabn<CR>
noremap <F12> <Esc><C-W><C-W>

map <C-N> :NERDTree<CR>

map <leader>q <ESC>:q<CR>
map <leader>w <ESC>:w<CR>
map <leader>wq <ESC>:wq<CR>

" nnoremap d "_d                                 " delete without yank
" vnoremap d "_d

vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc> " make p in Visual mode replace the selected text with the yank register

" YankRing stuff
let g:yankring_history_dir = '$HOME/.vim/.tmp'
nnoremap <leader>l :YRShow<CR>


" Vim behaviour {{{
set switchbuf=useopen           " reveal already opened files from the quickfix window instead of opening new buffers
set history=1000                " remember more commands and search history
set undolevels=1000             " use many muchos levels of undo
" set noswapfile                  " do not write annoying intermediate swap files
set wildmenu                    " make tab completion for files/buffers act like bash
set wildmode=list:full          " show a list when pressing tab and complete first full match
set wildignore=*.swp,*.bak,*.pyc,*.class
" }}}


" Folding rules {{{
set foldenable                  " enable folding
" set foldcolumn=2                " add a fold column
set foldmethod=marker           " detect triple-{ style fold markers
set foldlevelstart=99           " start out with everything unfolded
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
                                " which commands trigger auto-unfold
function! MyFoldText()
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - 4
    return line . ' â€¦' . repeat(" ",fillcharcount) . foldedlinecount . ' '
endfunction
set foldtext=MyFoldText()

" Mappings to easily toggle fold levels
nnoremap z0 :set foldlevel=0<cr>
nnoremap z1 :set foldlevel=1<cr>
nnoremap z2 :set foldlevel=2<cr>
nnoremap z3 :set foldlevel=3<cr>
nnoremap z4 :set foldlevel=4<cr>
nnoremap z5 :set foldlevel=5<cr>
" }}}


" cscope {{{
"if has("cscope")
"   set csprg=/usr/bin/cscope
"   set csto=0
"   cs add /home/cyc/cscope/cyclone/cscope.out
"endif
" }}}


let g:pathogen_blacklist="syntastic,cscope"
nnoremap <leader>t :JavaSearch -s all -x declarations<cr>
nnoremap <leader>i :JavaImport<cr>
nnoremap <leader>g :JavaGet<cr>
nnoremap <leader>s :JavaSet<cr>
let g:EclimJavaSearchSingleResult='tabnew'
let g:EclimMakeLCD=1
set switchbuf+=usetab,newtab
let g:EclimFileTypeValidate=1

aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

