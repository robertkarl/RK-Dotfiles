### RK's crossplatform dotfiles repo - clone and run bootstrap.sh
The files here are intended to be basic and run on OS X and GNU/Linux systems.

To set up a new system with some basic vim, bash, and git dev customization:
- run `git clone https://github.com/robertkarl/RK-Dotfiles.git`
- run boostrap.sh
  - Creates a folder `~/dotfiles_old` and copies old .dotfiles here. For example if `~/.vim/` already exists it will be moved here by bootstrap.sh wholesale.
  - Copies dotfiles from this repo into `~/`

