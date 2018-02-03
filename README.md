# RK's crossplatform dotfiles repo

### Goals
- Allow quick bootstrapping of dotfiles on OS X and Linux.
- Avoid bashisms and don't use platform specific code unless needed.
- Source local config files if they are available. For example, machine-specific bash rules can be placed in
  `~/.bashprofile.local` and they'll be sourced.

### Features
- Detect existing dotfiles and don't clobber them; back them up to `~/dotfiles_old`
- `bootstrap.sh` prevents the user from running it twice by creating a killswitch file; the presence of `~/dotfiles/bootstrap_completed` halts `./bootstrap.sh`
- Using symbolic links allows the following workflow:

### Todo
- Allow configuration so that `~/dotfiles` is not hardcoded.

