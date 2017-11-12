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
    git clone --recursive https://samueljon@github.com/samueljon/vim-config-and-plugin-sync.git ~/.vim
}

function stofna_vimrc () {
    ln -s ~/.vim/vimrc ~/.vimrc
}

function kanna_git () {
    which git
    if [ $? -eq 1 ];
    then
        echo "Þú þarft að setja inn git"
        exit 1
    fi
}

function setja_inn_vidbaetur() {
    vim +PluginInstall +qall
}

echo "***************************************************************************"
echo "Hef innsetningu á vim stillingum"
echo "***************************************************************************"
read -sn 1 -p "Ýttu á j til að halda áfram eða einhvern annan hnapp til að hætta við"
if [ "$REPLY" == "j" ];
then
    kanna_git

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

    setja_inn_vidbaetur

    echo "***************************************************************************"
    echo "* I haz success ! Fyrri stillingar afritaðar sem .vimrc.$DAGS og .vim.$DAGS"
    echo "***************************************************************************"
else
    echo "***************************************************************************"
    echo "Hætt var við innsetningu. Snökt :("
    echo "***************************************************************************"
fi
