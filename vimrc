"""""""""""""""""""""""""""""""""""""""""""""""""
" Höfundur: Samúel Jón Gunnarsson
" Lýsing: vim resource skrá aka vimrc
"
" Samsuða af stillingum meðal annars frá:
" Gavim - Gaveen's Vim Configuration: http://gaveen.owain.org/2009/07/my-vim-configuration.html
" Amix the luky stiff: http://amix.dk/blog/post/19486#The-ultimate-vim-configuration-vimrc
" vimcasts.org: http://vimcasts.org
"
" Eftirfarandi viðbætur hefur mér þótt ágætt að nota í gegnum tíðina:
" NERDTree: https://github.com/scrooloose/nerdtree.git
" SnipMate: https://github.com/msanders/snipmate.vim/tree
" VimRails: http://github.com/tpope/vim-rails
" Fugitive: http://github.com/tpope/vim-fugitive
"
" Það fyrsta sem við viljum kalla á er pathogen til að hlaða inn
" viðbótum :
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
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
set t_Co=256            " terminal styður 256 liti
" Virkja liti skv. setningarfræði þegar terminal getur sýnt liti
" ásamt því að lýsa upp síðustu leitarskilyrði
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif
" Birta tákn fyrir línubil, nbsp og tab
set list
set listchars=trail:⋅,nbsp:⋅,tab:▷⋅
colorscheme desert 	" litaþema sjá :h colorscheme
let &guicursor = &guicursor . ",a:blinkon0"	"Slökkvum á blikkandi bendli
"""""""""""""""""""""""""""""""""""""""""""""""""
" Skráarumsýsla og setningarfræði skráa 
" (files and syntax highlighting)
"""""""""""""""""""""""""""""""""""""""""""""""""
" Stilla samanbrot á kóða eftir setningarfræði tungumáls en bíðum með
" að virkja nema með zi, zr, zR ofl. samanbrotsskipunum. 
setlocal foldmethod=syntax
setlocal nofoldenable
filetype plugin indent on
"""""""""""""""""""""""""""""""""""""""""""""""""
" Sérsniðnir flýtilyklar
"""""""""""""""""""""""""""""""""""""""""""""""""
" Stilla svokallaðan leader lykil en hann er notaður
" til að ræsa viðbætur og aðra sérvirkni
" Dæmi ef jsbeautyfier er uppsett þá er hægt að 
" ræsa hann mv. neðangreint með ,ff 
let mapleader = ","
" Héreftir er hægt að nota <leader> sem tilvísun í , sem leader.

""""""""""""""""""""""
" NERDTree Stillingar
""""""""""""""""""""""
nnoremap <leader>d :NERDTreeToggle<cr>	"Nota d sem flýtilykil

let NERDChristmasTree = 1               " Virkja liti í NERDTree
let NERDTreeHighlightCursorline = 1     " Lýsa upp bendil
let NERDTreeMapActivateNode='<CR>'      " Virkja Enter/Return til að opna greinar
