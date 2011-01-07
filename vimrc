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

" Birta tákn fyrir línubil, nbsp og tab
set list
set listchars=trail:⋅,nbsp:⋅,tab:▷⋅

" litaþema sjá :h colourscheme
colorscheme desert

"""""""""""""""""""""""""""""""""""""""""""""""""
" Sérsniðnir flýtilyklar
"""""""""""""""""""""""""""""""""""""""""""""""""
" Stilla svokallaðan leader lykil en hann er notaður
" til að ræsa viðbætur og aðra sérvirkni
" Dæmi ef jsbeautyfier er uppsett þá er hægt að 
" ræsa hann mv. neðangreint með ,ff 
let mapleader = ","
" Héreftir er hægt að nota <leader> sem tilvísun í , sem leader.
