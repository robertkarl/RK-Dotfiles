dir=~/dotfiles                   # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files=".inputrc .bash_profile .vimrc .vim .hgrc .gitconfig"

echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"
 
echo "Changing to the $dir directory"
cd $dir
echo "...done"
 
# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done
 
echo "Creating tmp vim files"
mkdir ~/.vimbackup ~/.vimtmp
source ~/.bash_profile

echo lulz
