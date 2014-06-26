"""""""""""""""""""""""""""""""""""""""""""""""""
" Höfundur: Samúel Jón Gunnarsson
" Lýsing: vim resource skrá aka vimrc
"
" Samsuða af stillingum meðal annars frá:
" Gavim - Gaveen's Vim Configuration: http://gaveen.owain.org/2009/07/my-vim-configuration.html
" Amix the luky stiff: http://amix.dk/blog/post/19486#The-ultimate-vim-configuration-vimrc
" vimcasts.org: http://vimcasts.org
"
" Það fyrsta sem við viljum kalla á er vundle til að hlaða inn
" viðbótum :
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
" Svo koma submodule-inn. 
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-haml'
Bundle 'altercation/vim-colors-solarized'
Bundle 'plasticboy/vim-markdown'
Bundle 'hallettj/jslint.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'puppetlabs/puppet-syntax-vim'
Bundle 'bling/vim-airline'
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
	"  set tb=icons,text
endif
set tags=tags;/

if has("gui_running")
	let s:uname = system("uname")
	if s:uname == "Darwin\n"
		set guifont=Inconsolata\ for\ Powerline:h15
	endif
endif

" Birta tákn fyrir línubil, nbsp og tab
set list
set listchars=trail:⋅,nbsp:⋅,tab:▷⋅
set background=dark " Sjá readme f. litaþema solarized. Fyrir ljóst þema notið background=light
colorscheme solarized " litaþema sjá :h colorscheme
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
nnoremap <2-LeftMouse> <C-]> "Leyfir tvíklikk sem hoppar í taglist-a
nnoremap <MiddleMouse> <C-T> "Hoppar tilbaka úr taglista
set mouse=a 
""""""""""""""""""""""
" NERDTree Stillingar
""""""""""""""""""""""
nnoremap <leader>t :NERDTreeToggle<cr>	"Nota d sem flýtilykil

let NERDChristmasTree = 1               " Virkja liti í NERDTree
let NERDTreeHighlightCursorline = 1     " Lýsa upp bendil
let NERDTreeMapActivateNode='<CR>'      " Virkja Enter/Return til að opna greinar

" let Tlist_Ctags_Cmd = '/usr/local/bin/jsctags'

let g:airline_enable_syntastice=1
let g:airline_enable_fugutive=1
let g:airline#extensions#tabline#enabled = 1


set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8


setlocal spell spelllang=is
