#!/bin/bash
set -e

DOTFILESDIR=~/dotfiles
DOTFILES_BACKUP_DIR=~/dotfiles_old             # old dotfiles backup directory
DOTFILES_LIST=".inputrc .bash_profile .vimrc .gitconfig .gitignoreglobal"
BOOTSTRAP_COMPLETED_FILE="$DOTFILESDIR/bootstrap_completed"


if [ -f $BOOTSTRAP_COMPLETED_FILE ]; then
    echo "ERROR. Bootstrap already completed. (file BOOTSTRAP_COMPLETED_FILE exists)."
    exit -1
fi;

echo "Creating $DOTFILES_BACKUP_DIR for backup of any existing dotfiles in ~"
mkdir -p $DOTFILES_BACKUP_DIR
echo "...done"
 
for dfile in $DOTFILES_LIST; do
    if [ -L ~/$dfile ]; then
        echo "$dfile is a symbolic link; removing"
        rm ~/$dfile
    fi
    if [ -e ~/$dfile ]; then
        echo "backing up $DOTFILES_BACKUP_DIR/$dfile"
        mv ~/$dfile $DOTFILES_BACKUP_DIR
    fi

    echo "Symlinking $DOTFILESDIR/$dfile to home"
    ln -s $DOTFILESDIR/$dfile ~/$dfile
done

touch "$DOTFILESDIR/bootstrap_completed"
echo Bootstrapping completed

