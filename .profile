#             ___
#       ____ |__ \ ____              _____      personal page: https://amtoine.github.io/ 
#      / __ `/_/ // __ \   ______   / ___/      github   page: https://github.com/amtoine 
#     / /_/ / __// / / /  /_____/  (__  )       my   dotfiles: https://github.com/amtoine/dotfiles 
#     \__,_/____/_/ /_/           /____/
#                           __ _ _
#                          / _(_) |
#          _ __  _ __ ___ | |_ _| | ___
#         | '_ \| '__/ _ \|  _| | |/ _ \
#      _  | |_) | | | (_) | | | | |  __/
#     (_) | .__/|_|  \___/|_| |_|_|\___|
#         | |
#         |_|
#
# full config can be found at: https://github.com/amtoine/dotfiles

# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

echo ".profile"
export BASH_SOURCED_FILES=".profile:$BASH_SOURCED_FILES"

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi


. /home/ants/torch/install/bin/torch-activate
