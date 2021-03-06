""""""""""""""""""""""""""""""""""""""""""""""""
" Höfundur: Samúel Jón Gunnarsson
" Lýsing: vim resource skrá aka vimrc
"
" Samsuða af stillingum meðal annars frá:
" Gavim - Gaveen's Vim Configuration: http://gaveen.owain.org/2009/07/my-vim-configuration.html
" Amix the luky stiff: http://amix.dk/blog/post/19486#The-ultimate-vim-configuration-vimrc
" vimcasts.org: http://vimcasts.org
"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Svo koma submodule-inn. 
"Plugin 'scrooloose/nerdcommenter'
"Plugin 'scrooloose/syntastic'
"Plugin 'godlygeek/tabular'
"Plugin 'nginx.vim'
"Plugin 'kchmck/vim-coffee-script'
"Plugin 'plasticboy/vim-markdown'
"Plugin 'hallettj/jslint.vim'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"Plugin 'puppetlabs/puppet-syntax-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
" https://github.com/w0rp/ale
Plugin 'w0rp/ale'
" https://github.com/itchyny/lightline.vim
Plugin 'itchyny/lightline.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" lesa inn staðbundnar vimrc stillingar ef þær finnast 
if filereadable(".vimrc.local")
    source .vimrc.local
endif
" Kannar hvort stýrikerfisumhverfi sé stillt í unicode og stillir
" fileencodings í samræmi við það sjá :h v:lang og :h fileencodings
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
    set fileencodings=ucs-bom,utf-8,latin1
endif
""""""""""""""""""""""""""""""""""""""""""""""""
" Grunnstillingar
" Ef þú vilt skoða nánari útlistun á hvað hver
" stilling gerir þá er hægt að lesa um þær í 
" skipana ham sbr. :h nocompatible mun sýna
" þér hjálpina um nocompatilbe og hvað hún gerir
""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible        " Nota sjálfgefin gildi frá vim í stað þess að vera samhæfður við vi.
set number              " Birta línunúmer
set ruler               " Sýna ávallt staðsetningu __cursor
set title               " Birta titil
set smarttab            " Virkja smarttab fídus 
set incsearch           " Virkja incremental search sem leitar í skjali meðan á innslætti stendur.
set wildmenu            " Aðstoð við að ljúka við orð (completion)
set t_Co=256    " terminal styður 256 liti
" Virkja liti skv. setningarfræði þegar terminal getur sýnt liti
" ásamt því að lýsa upp síðustu leitarskilyrði
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
    "set tb=icons,text
endif
set tags=tags;/

if has("gui_running")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
"        set guifont=Inconsolata\ for\ Powerline:h15
        set guioptions=T
    endif
endif

try
    colorscheme solarized
catch /^Vim\%((\a\+)\)\=:E185/
    " Mögulega setja annað colorscheme meðan solarized er ekki uppsett
    colorscheme default
endtry

" Birta tákn fyrir línubil, nbsp og tab
set list
set listchars=trail:⋅,nbsp:⋅,tab:▷⋅
set background=dark " Sjá readme f. litaþema solarized. Fyrir ljóst þema notið background=light
let &guicursor = &guicursor . ",a:blinkon0"	"Slökkvum á blikkandi bendli
" Show the current command in the lower right corner
set showcmd
" Show the current mode
set showmode
augroup indent_settings
    au!
    au BufEnter *.html setl autoindent smartindent
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""
" Skráarumsýsla og setningarfræði skráa 
" (files and syntax highlighting)
"""""""""""""""""""""""""""""""""""""""""""""""""
" Stilla samanbrot á kóða eftir setningarfræði tungumáls en bíðum með
" að virkja nema með zi, zr, zR ofl. samanbrotsskipunum. 
setlocal foldmethod=syntax
setlocal nofoldenable
filetype off
filetype indent on
filetype plugin on
"for Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_quiet_messages = {'level': 'warnings'}
"""""""""""""""""""""""""""""""""""""""""""""""""
" Sérsniðnir flýtilyklar
"""""""""""""""""""""""""""""""""""""""""""""""""
" Stilla svokallaðan leader lykil en hann er notaður
" til að ræsa viðbætur og aðra sérvirkni
" Dæmi ef jsbeautyfier er uppsett þá er hægt að 
" ræsa hann mv. neðangreint með ,ff 
let mapleader = ","
" Héreftir er hægt að nota <leader> sem tilvísun í , sem leader.
" Músaraðgerðir
"nnoremap <2-LeftMouse> <C-]> "Leyfir tvíklikk sem hoppar í taglist-a
"nnoremap <MiddleMouse> <C-T> "Hoppar tilbaka úr taglista
"set mouse=a 
""""""""""""""""""""""
" NERDTree Stillingar
""""""""""""""""""""""
nnoremap <leader>t :NERDTreeToggle<cr>	"Nota d sem flýtilykil

let NERDChristmasTree = 1               " Virkja liti í NERDTree
let NERDTreeHighlightCursorline = 1     " Lýsa upp bendil
let NERDTreeMapActivateNode='<CR>'      " Virkja Enter/Return til að opna greinar

" let Tlist_Ctags_Cmd = '/usr/local/bin/jsctags'

"let g:airline_enable_syntastice=1
"let g:airline_enable_fugutive=1
"let g:airline#extensions#tabline#enabled = 1


"set guifont=Inconsolata\ for\ Powerline:h15
"let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
set laststatus=2

setlocal spell spelllang=is

" GitGutter
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

" ALE
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title
" ALE config endar

" Lightline
" \ 'colorscheme': 'solarized',
let g:lightline = {
\ 'active': {
\   'left': [['mode', 'paste'], ['filename', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ }

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

autocmd User ALELint call s:MaybeUpdateLightline()

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction
"end thinline


" https://github.com/terryma/vim-multiple-cursors
" Default mapping
" let g:multi_cursor_next_key='<C-n>'
" let g:multi_cursor_prev_key='<C-p>'
" let g:multi_cursor_skip_key='<C-x>'
" let g:multi_cursor_quit_key='<Esc>'
"
" By default, the 'next' key is also used to enter multicursor mode. If you want
" to use a different key to start multicursor mode than for selecting the next
" location, do like the following:
"
" " Map start key separately from next key
" let g:multi_cursor_start_key='<F6>'
"
" Note that when multicursor mode is started, it selects current word without
" boundaries, i.e. it behaves like g*. If you want to use word boundaries in
" Normal mode (as * does) but still have old behaviour up your sleeve, you can
" do the following:
"
" let g:multi_cursor_start_key='g<C-n>'
" let g:multi_cursor_start_word_key='<C-n>'

" Tabular gist https://gist.github.com/tpope/287147 
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
    let p = '^\s*|\s.*\s|\s*$'
    if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
        Tabularize/|/l1
        normal! 0
        call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
endfunction

" Let's learn hjkl traversal
map <up> :echoerr "Stop being stupid"<CR>
map <down> :echoerr "Stop being stupid"<CR>
map <left> :echoerr "Stop being stupid"<CR>
map <right> :echoerr "Stop being stupid"<CR>
