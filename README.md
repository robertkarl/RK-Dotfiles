# RK's crossplatform dotfiles repo

### Goals
- Allow quick bootstrapping of dotfiles on POSIX-like systems (OS X and Linux).
- Use symbolic links to a clone of this repo. For example the file `~/.vimrc` will be a symlink to a file in a working copy of this git repo.
- Make it difficult to accidentally delete data.
- Avoid bashisms and don't emit or use platform specific code unless needed.

### Features
- Detect existing dotfiles and don't clobber them; back them up to `~/dotfiles_old`
- `bootstrap.sh` prevents the user from running it twice by creating a killswitch file; the presence of `~/dotfiles/bootstrap_completed` halts `./bootstrap.sh`
- Using symbolic links allows the following workflow:

```
echo "alias ll='ls -al'" >> ~/.bash_profile # Actually edits the file ~/dotfiles/.bash_profile
cd ~/dotfiles
git commit
git push
```

### Usage
```
cd ~
git clone https://github.com/robertkarl/dotfiles.git
cd dotfiles
./bootstrap.sh
# Existing dotfiles that would have been clobbered have been copied to ~/dotfiles_old.
```

### Requirements and assumptions
- some kind of `sh` is available
- `~` expands to the user's home directory. This directory exists.
- `~/dotfiles` is a copy of this git repo.
- `~/dotfiles_old` does not exist; it will be created and will contain backups.

### Todo
- Allow configuration so that `~/dotfiles` is not hardcoded.

