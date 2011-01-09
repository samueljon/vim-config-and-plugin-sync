#!/bin/bash
# Höfundur: Samúel Jón Gunnarsson
# Lýsing: Setur .vim og .vimrc upp ásamt því að taka afrit 
# af fyrri stillingum.
#
# Todo: 
# Bæta við athugun á stýrikerfi og Git forritum
###########################################################
DAGS=`date +%y%m%d%H%M`

function saekja_config () {
	echo "Sæki stillingar frá github"
	git clone git@github.com:samueljon/vim-config-and-plugin-sync.git ~/.vim
	cd ~/.vim
	echo "Virkja viðbætur"
	git submodule init
	echo "Uppfæri/sæki viðbætur frá github"
	git submodule update
}

function stofna_vimrc () {
	 ln -s ~/.vim/vimrc ~/.vimrc
}

echo "***************************************************************************"
echo "Hef innsetningu á vim stillingum"
echo "***************************************************************************"
read -sn 1 -p "Ýttu á j til að halda áfram eða einhvern annan hnapp til að hætta við"
if [ "$REPLY" == "j" ];
then
	if [ -d ~/.vim ];
	then
		mv ~/.vim ~/.vim.$DAGS
		saekja_config
	else
		saekja_config
	fi

	if [ -f ~/.vimrc ];
	then
		mv ~/.vimrc ~/.vimrc.$DAGS
		stofna_vimrc
	else
		stofna_vimrc
	fi
	echo "***************************************************************************"
	echo "* I haz success ! Fyrri stillingar afritaðar sem .vimrc.$DAGS og .vim.$DAGS"
	echo "***************************************************************************"
else
	echo "***************************************************************************"
	echo "Hætt var við innsetningu. Snökt :("
	echo "***************************************************************************"
fi
