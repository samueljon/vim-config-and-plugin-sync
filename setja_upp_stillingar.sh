#!/bin/bash

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
	 ln -s ~/vim/vimrc ~/.vimrc
}

read -sn 1 -p "Hef innsetningu á vim stillingum.\nÝttu á j til að halda áfram eða einhvern annan hnapp til að hætta við"
if [ $REPLY == 'j' ];
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
else
	echo "Hætt var við innsetningu"
fi
