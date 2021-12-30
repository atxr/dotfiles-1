#! /usr/bin/env bash
#             ___
#       ____ |__ \ ____              _____      personal page: https://a2n-s.github.io/ 
#      / __ `/_/ // __ \   ______   / ___/      github   page: https://github.com/a2n-s 
#     / /_/ / __// / / /  /_____/  (__  )       my   dotfiles: https://github.com/a2n-s/dotfiles 
#     \__,_/____/_/ /_/           /____/
#         _            __        ____              __
#        (_)___  _____/ /_____ _/ / /        _____/ /_
#       / / __ \/ ___/ __/ __ `/ / /        / ___/ __ \
#      / / / / (__  ) /_/ /_/ / / /   _    (__  ) / / /
#     /_/_/ /_/____/\__/\__,_/_/_/   (_)  /____/_/ /_/
#
# Description:  TODO
# Dependencies: TODO
# License:      https://github.com/a2n-s/dotfiles/LICENSE 
# Contributors: Stevan Antoine

################################################################################################
## Some color definitions ######################################################################
################################################################################################
# Reset
Off=$(printf '\033[0m')        # Text Reset
# Regular Colors
Blk=$(printf '\033[0;30m')     # Black
Red=$(printf '\033[0;31m')     # Red
Grn=$(printf '\033[0;32m')     # Green
Ylw=$(printf '\033[0;33m')     # Yellow
Blu=$(printf '\033[0;34m')     # Blue
Pur=$(printf '\033[0;35m')     # Purple
Cyn=$(printf '\033[0;36m')     # Cyan
Wht=$(printf '\033[0;37m')     # White
# Bold
BBlk=$(printf '\033[1;30m')    # Black
BRed=$(printf '\033[1;31m')    # Red
BGrn=$(printf '\033[1;32m')    # Green
BYlw=$(printf '\033[1;33m')    # Yellow
BBlu=$(printf '\033[1;34m')    # Blue
BPur=$(printf '\033[1;35m')    # Purple
BCyn=$(printf '\033[1;36m')    # Cyan
BWht=$(printf '\033[1;37m')    # White
# Underline
UBlk=$(printf '\033[4;30m')    # Black
URed=$(printf '\033[4;31m')    # Red
UGrn=$(printf '\033[4;32m')    # Green
UYlw=$(printf '\033[4;33m')    # Yellow
UBlu=$(printf '\033[4;34m')    # Blue
UPur=$(printf '\033[4;35m')    # Purple
UCyn=$(printf '\033[4;36m')    # Cyan
UWht=$(printf '\033[4;37m')    # White
# Background
OBlk=$(printf '\033[40m')      # Black
ORed=$(printf '\033[41m')      # Red
OGrn=$(printf '\033[42m')      # Green
OYlw=$(printf '\033[43m')      # Yellow
OBlu=$(printf '\033[44m')      # Blue
OPur=$(printf '\033[45m')      # Purple
OCyn=$(printf '\033[46m')      # Cyan
OWht=$(printf '\033[47m')      # White
# High Intensity
IBlk=$(printf '\033[0;90m')    # Black
IRed=$(printf '\033[0;91m')    # Red
IGrn=$(printf '\033[0;92m')    # Green
IYlw=$(printf '\033[0;93m')    # Yellow
IBlu=$(printf '\033[0;94m')    # Blue
IPur=$(printf '\033[0;95m')    # Purple
ICyn=$(printf '\033[0;96m')    # Cyan
IWht=$(printf '\033[0;97m')    # White
# Bold High Intensity
BIBlk=$(printf '\033[1;90m')   # Black
BIRed=$(printf '\033[1;91m')   # Red
BIGrn=$(printf '\033[1;92m')   # Green
BIYlw=$(printf '\033[1;93m')   # Yellow
BIBlu=$(printf '\033[1;94m')   # Blue
BIPur=$(printf '\033[1;95m')   # Purple
BICyn=$(printf '\033[1;96m')   # Cyan
BIWht=$(printf '\033[1;97m')   # White
# High Intensity backgrounds
OIBlk=$(printf '\033[0;100m')  # Black
OIRed=$(printf '\033[0;101m')  # Red
OIGrn=$(printf '\033[0;102m')  # Green
OIYlw=$(printf '\033[0;103m')  # Yellow
OIBlu=$(printf '\033[0;104m')  # Blue
OIPur=$(printf '\033[0;105m')  # Purple
OICyn=$(printf '\033[0;106m')  # Cyan
OIWht=$(printf '\033[0;107m')  # White

################################################################################################
## 'Global constants' definitions ##############################################################
################################################################################################
# Specific color use. #
#######################
Err=$IRed  # errors
Wrn=$IYlw  # warnings
Crt=$Red   # critical
Cmd=$IBlu  # command
Src=$Pur   # source
Dst=$Grn   # destination
Nrm=$IWht  # normal
Pmt=$Cyn   # prompt
Pkg=$Ylw   # package
Tip=$IGrn  # tip
Url=$IYlw  # url

Normal="${Nrm}[.]${Off}"
Prompt="${Pmt}[?]${Off}"
Warning="${Wrn}[*]${Off}"
Critic="${Crt}[-]${Off}"
Error="${Err}[!]${Off}"

#######################
# all the repos I use #
#######################
# for repo in ${repos[@]}; do
#   git -C $repo rmtv | sed 's/.*\s\+\(.*\)\s\+.*/\1/' | uniq
# done
repositories=()
repositories+=("prog/sketchbook/FastLED-basics git@github.com:s-marley/FastLED-basics.git ")
repositories+=("prog/scsc/fil-rouge git@github.com:a2n-s/fil-rouge.git git@github.com:iScsc/fil-rouge.git")
repositories+=("prog/scsc/fgk git@github.com:a2n-s/fgk.git ")
repositories+=("prog/swarm-rescue-g1 git@github.com:a2n-s/swarm-rescue-g1.git git@github.com:atxr/swarm-rescue-g1.git")
repositories+=("sup/tatami https://github.com/a2n-s/tatami.git ")
repositories+=("sup/machine-learning git@github.com:a2n-s/machine-learning.git git@github.com:SupaeroDataScience/machine-learning.git")
repositories+=("sup/imgDesc git@github.com:a2n-s/imgDesc.git ")
repositories+=("sup/flatland-project git@github.com:abfariah/flatland-project.git https://github.com/SupaeroDataScience/flatland-project")
repositories+=("sup/deep-learning git@github.com:a2n-s/deep-learning.git git@github.com:SupaeroDataScience/deep-learning.git")
repositories+=("sup/stochastic git@github.com:a2n-s/stochastic.git https://github.com/SupaeroDataScience/stochastic.git")
repositories+=("sup/mcdm git@github.com:a2n-s/mcdm.git ")
repositories+=("surf git@github.com:a2n-s/surf.git git://git.suckless.org/surf")
repositories+=("yay-git https://aur.archlinux.org/yay-git.git ")
repositories+=("polybar git@github.com:a2n-s/polybar-themes.git git@github.com:adi1090x/polybar-themes.git")
repositories+=("lazycli git@github.com:jesseduffield/lazycli.git ")
repositories+=("dmscripts git@github.com:a2n-s/dmscripts.git https://gitlab.com/dwt1/dmscripts.git")
repositories+=("dmenu git@github.com:a2n-s/dmenu.git git://git.suckless.org/dmenu")
repositories+=("tabbed git@github.com:a2n-s/tabbed.git git://git.suckless.org/tabbed")
repositories+=("slock git@github.com:a2n-s/slock.git https://git.suckless.org/slock")
repositories+=("bash-insulter git@github.com:a2n-s/bash-insulter.git ")
repositories+=("kitty git@github.com:a2n-s/kitty.git git@github.com:kovidgoyal/kitty.git")
repositories+=("Neovim-from-scratch git@github.com:LunarVim/Neovim-from-scratch.git ")
repositories+=("oh-my-bash git@github.com:a2n-s/oh-my-bash.git git@github.com:ohmybash/oh-my-bash.git")
repositories+=("uzbl git://github.com/uzbl/uzbl.git ")
repositories+=("oh-my-fish git@github.com:a2n-s/oh-my-fish.git git@github.com:oh-my-fish/oh-my-fish.git")
repositories+=("a2n-s git@github.com:a2n-s/a2n-s.git ")
repositories+=("wallpapers git@github.com:a2n-s/wallpapers.git ")
repositories+=("oh-my-zsh git@github.com:a2n-s/ohmyzsh.git git@github.com:ohmyzsh/ohmyzsh.git")
repositories+=("sites/nereuxofficial.github.io git@github.com:Nereuxofficial/nereuxofficial.github.io.git ")
repositories+=("sites/a2n-s.github.io/themes/hugo-theme-terminal git@github.com:a2n-s/hugo-theme-terminal.git git@github.com:panr/hugo-theme-terminal.git")
repositories+=("sites/a2n-s.github.io git@github.com:a2n-s/a2n-s.github.io.git ")
repositories+=("dotfiles/atxr_dotfiles https://github.com/atxr/dotfiles.git ")
repositories+=("research/playground_env git@github.com:flowersteam/playground_env.git ")
repositories+=("research/Imagine https://github.com/flowersteam/Imagine.git ")
repositories+=("research/imagineXdial https://github.com/SuReLI/imagineXdial.git ")
repositories+=("research/gym_ma_toy https://github.com/MehdiZouitine/gym_ma_toy ")
repositories+=("research/learning-to-communicate-pytorch https://github.com/minqi/learning-to-communicate-pytorch.git ")

###############
# my scripts. #
###############
scripts=()
scripts+=("_countdown.sh")
scripts+=("_parse_git_info.sh")
scripts+=("_shortwd.sh")
scripts+=("_stopwatch.sh")
scripts+=("dmrun.sh")
scripts+=("lfrun.sh")
scripts+=("list.git-repos.diagnostic.sh")
scripts+=("misc.nvim-renaming.sh")
scripts+=("prompt.sh")
scripts+=("repo.info.sh")
scripts+=("screenshot.sh")
scripts+=("slock-cst.sh")
scripts+=("spectrWM-baraction.sh")
scripts+=("togkb.sh")
scripts+=("tr2md.sh")
scripts+=("upl.sh")
scripts+=("wvenv.sh")
scripts+=("xtcl.sh")
scripts+=("ytdl.sh")

##########################
# installation constants #
##########################
DIR=`pwd`
HDIR="$HOME"
CDIR=".config"
SDIR="scripts"
RDIR="repos"

################################################################################################

################################################################################################
## script installation functions ###############################################################
################################################################################################
install_script() {
  if [[ -f "$HDIR/$SDIR/$1" ]]; then
    echo "$HDIR/$SDIR/$1 already exists"
    if [[ -f "$DIR/old/$SDIR/$1" ]]; then
      read -p "$Prompt ${Crt}backup already exists...${Off} [1|o] Override backup. [2|k] Keep backup file. "
      case "$REPLY" in
        1|"o")  echo "${Crt}mv ${Src}$HDIR/$SDIR/$1 ${Dst}$DIR/old/$SDIR/$1${Off}"
                mv $HDIR/$SDIR/$1 $DIR/old/$SDIR/$1
        ;;
        2|"k")  echo "${Wrn}Keeping previous backup file.${Off}"
        ;;
        *) echo "${Wrn}Keeping previous backup file.${Off}"
        ;;
      esac
    else
      echo "${Crt}mv ${Src}$HDIR/$SDIR/$1 ${Dst}$DIR/old/$SDIR/$1${Off}"
      mv $HDIR/$SDIR/$1 $DIR/old/$SDIR/$1
    fi
    echo "${Cmd}cp -rf ${Src}$DIR/$SDIR/$1 ${Dst}$HDIR/$SDIR/$1${Off}"
    cp -rf $DIR/$SDIR/$1 $HDIR/$SDIR/$1
  else
    echo "${Cmd}cp -rf ${Src}$DIR/$SDIR/$1 ${Dst}$HDIR/$SDIR/$1${Off}"
    cp -rf $DIR/$SDIR/$1 $HDIR/$SDIR/$1
  fi
}
install_scripts() {
	echo -e "\n$Normal Installing scripts..."
	if [[ -d "$HDIR/$SDIR" ]]; then
		echo "${Wrn}$HDIR/$SDIR exists, prepairing backup${Off}"
		echo "${Wrn}mkdir -p $DIR/old/$SDIR${Off}"
		mkdir -p $DIR/old/$SDIR
	else
		echo "${Wrn}$HDIR/$SDIR does not exist${Off}"
		echo "${Wrn}mkdir -p $HDIR/$SDIR${Off}"
		mkdir -p $HDIR/$SDIR
	fi
  for script in ${scripts[@]}; do
    install_script $script
    echo "${Tip}[!!] Doc for this particular script is available at ${Url}https://a2n-s.github.io/public/doc/config/scripts/$script ${Off}"
  done
}

################################################################################################
## general configuration files installation functions ##########################################
################################################################################################
# tools #
#########
install_dir() {
  if [[ -d "$HDIR/$1" ]]; then
    echo "${Wrn}$HDIR/$1 already exists${Off}"
    if [[ -d "$DIR/old/$1" ]]; then
      read -p "$Prompt ${Crt}backup already exists...${Off} [1|o] Override backup. [2|k] Keep backup file. "
      case "$REPLY" in
        1|"o")  echo "${Crt}mv ${Src}$HDIR/$1/* ${Dst}$DIR/old/$1${Off}"
                mv $HDIR/$1/* $DIR/old/$1
        ;;
        2|"k")  echo "${Wrn}Keeping previous backup file.${Off}"
        ;;
        *) echo "${Wrn}Keeping previous backup file.${Off}"
        ;;
      esac
    else
      echo "${Wrn}mkdir -p $DIR/old/$1${Off}"
      mkdir -p $DIR/old/$1
      echo "${Crt}mv ${Src}$HDIR/$1/* ${Dst}$DIR/old/$1${Off}"
      mv $HDIR/$1/* $DIR/old/$1
    fi
    echo "${Cmd}cp -rf ${Src}$DIR/$1/* ${Dst}$HDIR/$1${Off}"
    cp -rf $DIR/$1/* $HDIR/$1
  else
    echo "${Wrn}$HDIR/$1 does not exist${Off}"
    echo "${Wrn}mkdir -p $HDIR/$1${Off}"
    mkdir -p $HDIR/$1
    echo "${Cmd}cp -rf ${Src}$DIR/$1/* ${Dst}$HDIR/$1${Off}"
    cp -rf $DIR/$1/* $HDIR/$1
  fi
}
install_file() {
  if [[ -f "$HDIR/$1" ]]; then
    echo "$HDIR/$1 already exists"
    if [[ -f "$DIR/old/$1" ]]; then
      read -p "$Prompt ${Crt}backup already exists...${Off} [1|o] Override backup. [2|k] Keep backup 1. "
      case "$REPLY" in
        1|"o")  echo "${Crt}mv ${Src}$HDIR/$1 ${Dst}$DIR/old/$1${Off}"
                mv $HDIR/$1 $DIR/old/$1
        ;;
        2|"k")  echo "${Wrn}Keeping previous backup 1.${Off}"
        ;;
        *) echo "${Wrn}Keeping previous backup 1.${Off}"
        ;;
      esac
    else
      echo "${Crt}mv ${Src}$HDIR/$1 ${Dst}$DIR/old/$1${Off}"
      mv $HDIR/$1 $DIR/old/$1
    fi
    echo "${Cmd}cp -rf ${Src}$DIR/$1 ${Dst}$HDIR/$1${Off}"
    cp -rf $DIR/$1 $HDIR/$1
  else
    echo "${Cmd}cp -rf ${Src}$DIR/$1 ${Dst}$HDIR/$1${Off}"
    cp -rf $DIR/$1 $HDIR/$1
  fi
}
###########################################################
# all the different configurations in their own functions #
###########################################################
install_git() {
  install_file ".gitconfig"
  echo "${Cmd}sudo pacman -Syu ${Pkg}git${Off}"
  sudo pacman -Syu git
  
  echo "${Tip}[!!] Doc for this particular config is available at ${Url}https://a2n-s.github.io/public/doc/config/dotfiles/git ${Off}"
}
install_htop() {
  install_dir ".config/htop"
  echo "${Cmd}sudo pacman -Syu ${Pkg}htop${Off}"
  sudo pacman -Syu htop
  echo "${Tip}[!!] Doc for this particular config is available at ${Url}https://a2n-s.github.io/public/doc/config/dotfiles/htop ${Off}"
}
install_bash() {
  install_file ".bash_logout"
  install_file ".bash_profile"
  install_file ".bashrc"
  install_file ".profile"
  echo "${Cmd}sudo pacman -Syu ${Pkg}ponysay fortune${Off}"
  sudo pacman -Syu ponysay fortune
  if [[ -d $HDIR/$RDIR/oh-my-bash ]]; then
    echo "${Wrn}$HDIR/$RDIR/oh-my-bash already exists${Off}"
    echo "${Wrn}please backup $HDIR/$RDIR/oh-my-bash before trying again${Off}"
  else
    echo "${Cmd}git clone git://github.com/a2n-s/oh-my-bash.git $HDIR/$RDIR/oh-my-bash${Off}"
    git clone git://github.com/a2n-s/oh-my-bash.git $HDIR/$RDIR/oh-my-bash
  fi
  echo "${Cmd}sudo wget -O /etc/bash.command-not-found https://raw.githubusercontent.com/hkbakke/bash-insulter/master/src/bash.command-not-found${Off}"
  sudo wget -O /etc/bash.command-not-found https://raw.githubusercontent.com/hkbakke/bash-insulter/master/src/bash.command-not-found
  echo "${Cmd}pip install virtualenvwrapper${Off}"
  pip install virtualenvwrapper
  echo "${Cmd}yay -S ${Pkg}shell-color-scripts${Off}"
  yay -S shell-color-scripts
  echo "${Tip}[!!] Do not forget to source your ~/.bashrc for the config to take full effect.${Off}"
  echo "${Tip}[!!] Doc for this particular config is available at ${Url}https://a2n-s.github.io/public/doc/config/dotfiles/bash ${Off}and ${Url}https://a2n-s.github.io/public/doc/config/bash ${Off}"
}
install_starship() {
  install_file ".config/starship.toml"
  echo "${Cmd}yay -S ${Pkg}nerd-fonts-mononoki${Off}"
  yay -S nerd-fonts-mononoki
  echo "${Cmd}sudo pacman -Syu ${Pkg}starship${Off}"
  sudo pacman -Syu starship
  echo "${Tip}[!!] Do not forget to source your ~/.bashrc for the config to take full effect.${Off}"
  echo "${Tip}[!!] Doc for this particular config is available at ${Url}https://a2n-s.github.io/public/doc/config/dotfiles/starship ${Off}"
}
install_neofetch() {
  install_dir ".config/neofetch"
  echo "${Cmd}sudo pacman -Syu ${Pkg}neofetch pr${Off}"
  sudo pacman -Syu neofetch pr
  echo "${Tip}[!!] Doc for this particular config is available at ${Url}https://a2n-s.github.io/public/doc/config/dotfiles/neofetch ${Off}"
}
install_vim() {
  install_file ".vimrc"
  echo "${Cmd}sudo pacman -Syu ${Pkg}vim${Off}"
  sudo pacman -Syu vim
  echo "${Cmd}mkdir -p $HDIR/.vim $HDIR/.vim/autoload $HDIR/.vim/backup $HDIR/.vim/color $HDIR/.vim/plugged${Off}"
  mkdir -p $HDIR/.vim $HDIR/.vim/autoload $HDIR/.vim/backup $HDIR/.vim/color $HDIR/.vim/plugged
  echo "${Cmd}curl -fLo $HDIR/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim${Off}"
  curl -fLo $HDIR/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  echo "${Cmd}curl -fLo $HDIR/.vim/colors/molokai.vim --create-dirs https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim${Off}"
  curl -fLo $HDIR/.vim/colors/molokai.vim --create-dirs https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
  # run :PlugInstall in vim
  echo "${Tip}[!!] To install the plugins, run vim and then :PlugInstall in the command line.${Off}"
  echo "${Tip}[!!] Doc for this particular config is available at ${Url}https://a2n-s.github.io/public/doc/config/dotfiles/vim ${Off}"
}
install_neovim() {
  echo "${Cmd}sudo pacman -Syu ${Pkg}nvim${Off}"
  sudo pacman -Syu nvim
  if [[ -d $HDIR/.config/nvim ]]; then
    echo "${Wrn}$HDIR/.config/nvim already exists${Off}"
    echo "${Wrn}please backup $HDIR/.config/nvim before trying again${Off}"
  else
    echo "${Cmd}git clone https://github.com/a2n-s/neovim $HDIR/.config/nvim${Off}"
    git clone https://github.com/a2n-s/neovim $HDIR/.config/nvim
  fi
  echo "${Tip}[!!] You are encouraged to backup your plugins and LSP servers, usually located in ~/.local/share/nvim if any at all.${Off}"
  echo "${Tip}[!!] Run nvim at least once to install plugins.${Off}"
  echo "${Tip}[!!] Run :LSPInstallInfo or press <space>lI to enter the same menu. Then select the servers you want with i to install or u to update.${Off}"
  echo "${Tip}[!!] Doc for this particular config is available at ${Url}https://a2n-s.github.io/public/doc/config/neovim ${Off}"
}
install_x() {
  install_file ".xinitrc"
  echo "${Cmd}sudo pacman -Syu ${Pkg}xorg picom${Off}"
  sudo pacman -Syu xorg picom
  echo "${Tip}[!!] Do not forget to restart your session for x config to kick in. If it does not:${Off}"
  echo "${Tip}[!!]   - check that the uncommented windows manager in ~/.xinitrc is installed and ready to run${Off}"
  echo "${Tip}[!!]   - you can always fallback to other ttys of your machine. It might be by pressing <ctrl-alt-fn> where n is the number of the tty.${Off}"
  echo "${Tip}[!!]     The default, and the one which is running ~/.xinitrc, is tty1. I have 6 ttys on my machine. There x won't bother anyone!${Off}"
  echo "${Tip}[!!] Doc for this particular config is available at ${Url}https://a2n-s.github.io/public/doc/config/dotfiles/x ${Off}"
}
install_bspwm() {
  install_dir ".config/bspwm"
  install_dir ".config/sxhkd"
  echo "${Cmd}sudo pacman -Syu ${Pkg}bspwm feh${Off}"
  sudo pacman -Syu bspwm feh
  echo "${Cmd}sudo pacman -Syu ${Pkg}sxhkd${Off}"
  sudo pacman -Syu sxhkd
  echo "${Tip}[!!] Be sure to restart you x server or at least bspwm and sxhkd for the config to take full effect.${Off}"
  echo "${Tip}[!!] Doc for this particular config is available at ${Url}https://a2n-s.github.io/public/doc/config/dotfiles/bspwm ${Off}and ${Url}https://a2n-s.github.io/public/doc/config/dotfiles/sxhkd ${Off}"
}
install_spectrwm() {
  install_dir ".config/spectrwm"
  echo "${Cmd}sudo pacman -Syu ${Pkg}spectrwm${Off}"
  sudo pacman -Syu spectrwm
  echo "${Tip}[!!] Be sure to restart you x server or at least spectrwm for the config to take full effect.${Off}"
  echo "${Tip}[!!] Doc for this particular config is available at ${Url}https://a2n-s.github.io/public/doc/config/dotfiles/spectrwm ${Off}"
}
install_alacritty() {
  install_dir ".config/alacritty"
  echo "${Cmd}yay -S ${Pkg}nerd-fonts-mononoki${Off}"
  yay -S nerd-fonts-mononoki
  echo "${Cmd}sudo pacman -Syu ${Pkg}alacritty${Off}"
  sudo pacman -Syu alacritty
  echo "${Tip}[!!] Be sure to restart the right terminal emulator for the config to take full effect.${Off}"
  echo "${Tip}[!!] You might need to tell youre wm to use alacritty as default, or just run alacritty in your previous terminal.${Off}"
  echo "${Tip}[!!] Doc for this particular config is available at ${Url}https://a2n-s.github.io/public/doc/config/dotfiles/alacritty ${Off}"
}
install_kitty() {
  install_dir ".config/kitty"
  if [[ -d $HDIR/$RDIR/kitty ]]; then
    echo "${Wrn}$HDIR/$RDIR/kitty already exists${Off}"
    echo "${Wrn}please backup $HDIR/$RDIR/kitty before trying again${Off}"
  else
    echo "${Cmd}git clone https://github.com/a2n-s/kitty $HDIR/$RDIR/kitty${Off}"
    git clone https://github.com/a2n-s/kitty $HDIR/$RDIR/kitty
  fi
  echo "${Cmd}cd $HDIR/$RDIR/kitty${Off}"
  cd $HDIR/$RDIR/kitty
  echo "${Cmd}git checkout main${Off}"
  git checkout main
  echo "${Cmd}make${Off}"
  make
  echo "${Cmd}ln -s ./kitty/launcher/kitty /usr/bin/kitty${Off}"
  ln -s ./kitty/launcher/kitty /usr/bin/kitty
  echo "${Tip}[!!] Be sure to restart the right terminal emulator for the config to take full effect.${Off}"
  echo "${Tip}[!!] You might need to tell youre wm to use kitty as default, or just run kitty in your previous terminal.${Off}"
  echo "${Tip}[!!] Doc for this particular config is available at ${Url}https://a2n-s.github.io/public/doc/config/kitty ${Off}"
}
install_nitrogen() {
  install_dir ".config/nitrogen"
  echo "${Cmd}sudo pacman -Syu ${Pkg}nitrogen${Off}"
  sudo pacman -Syu nitrogen
  echo "${Tip}[!!] You might need to run nitrogen once to setup it and/or restart your wm for the wallpaper to kick in.${Off}"
  echo "${Tip}[!!] Doc for this particular config is available at ${Url}https://a2n-s.github.io/public/doc/config/dotfiles/nitrogen ${Off}"
}
install_slock() {
  if [[ -d $HDIR/$RDIR/slock ]]; then
    echo "${Wrn}$HDIR/$RDIR/slock already exists${Off}"
    echo "${Wrn}please backup $HDIR/$RDIR/slock before trying again${Off}"
  else
    echo "${Cmd}git clone https://github.com/a2n-s/slock $HDIR/$RDIR/slock${Off}"
    git clone https://github.com/a2n-s/slock $HDIR/$RDIR/slock
  fi
  echo "${Cmd}cd $HDIR/$RDIR/slock${Off}"
  cd $HDIR/$RDIR/slock
  echo "${Cmd}git checkout main${Off}"
  git checkout main
  echo "${Cmd}make clean install${Off}"
  make clean install
  echo "${Tip}[!!] Doc for this particular config is available at ${Url}https://a2n-s.github.io/public/doc/config/slock ${Off}"
}
install_xscreensaver() {
  install_file ".xscreensaver"
  echo "${Cmd}sudo pacman -Syu ${Pkg}xscreensaver${Off}"
  sudo pacman -Syu xscreensaver
  echo "${Tip}[!!] Doc for this particular config is available at ${Url}https://a2n-s.github.io/public/doc/config/dotfiles/xscreensaver ${Off}"
}
install_polybar() {
  echo "${Cmd}sudo pacman -Syu ${Pkg}polybar${Off}"
  sudo pacman -Syu polybar
  if [[ -d $HDIR/$RDIR/polybar ]]; then
    echo "${Wrn}$HDIR/$RDIR/polybar already exists${Off}"
    echo "${Wrn}please backup $HDIR/$RDIR/polybar before trying again${Off}"
  else
    echo "${Cmd}git clone --depth=1 https://github.com/a2n-s/polybar-themes.git $HDIR/$RDIR/polybar${Off}"
    git clone --depth=1 https://github.com/a2n-s/polybar-themes.git $HDIR/$RDIR/polybar
  fi
  echo "${Cmd}chmod +x $HDIR/$RDIR/polybar/setup.sh${Off}"
  chmod +x $HDIR/$RDIR/polybar/setup.sh
  echo "${Cmd}$HDIR/$RDIR/polybar/setup.sh${Off}"
  $HDIR/$RDIR/polybar/setup.sh
  echo "${Tip}[!!] Do not forget to launch the bar by either running my bspwm config or running \`bash \$HOME/.config/polybar/launch.sh --forest &\`${Off}"
  echo "${Tip}[!!] Doc for this particular config is available at ${Url}https://a2n-s.github.io/public/doc/config/polybar ${Off}"
}
install_vifm() {
  install_dir ".config/vifm"
  echo "${Cmd}sudo pacman -Syu ${Pkg}vifm${Off}"
  sudo pacman -Syu vifm
  echo "${Tip}[!!] Doc for this particular config is available at ${Url}https://a2n-s.github.io/public/doc/config/dotfiles/vifm ${Off}"
}
install_tmux() {
  install_file ".tmux.conf"
  echo "${Cmd}sudo pacman -Syu ${Pkg}tmux${Off}"
  sudo pacman -Syu tmux
  echo "${Tip}[!!] Doc for this particular config is available at ${Url}https://a2n-s.github.io/public/doc/config/dotfiles/tmux ${Off}"
}
install_surf() {
  install_dir ".config/surf"
  if [[ -d $HDIR/$RDIR/surf ]]; then
    echo "${Wrn}$HDIR/$RDIR/surf already exists${Off}"
    echo "${Wrn}please backup $HDIR/$RDIR/surf before trying again${Off}"
  else
    echo "${Cmd}git clone https://github.com/a2n-s/surf $HDIR/$RDIR/surf${Off}"
    git clone https://github.com/a2n-s/surf $HDIR/$RDIR/surf
  fi
  echo "${Cmd}cd $HDIR/$RDIR/surf${Off}"
  cd $HDIR/$RDIR/surf
  echo "${Cmd}git checkout main${Off}"
  git checkout main
  echo "${Cmd}make clean install${Off}"
  make clean install
  echo "${Tip}[!!] Doc for this particular config is available at ${Url}https://a2n-s.github.io/public/doc/config/surf ${Off}"
}
install_tabbed() {
  if [[ -d $HDIR/$RDIR/tabbed ]]; then
    echo "${Wrn}$HDIR/$RDIR/tabbed already exists${Off}"
    echo "${Wrn}please backup $HDIR/$RDIR/tabbed before trying again${Off}"
  else
    echo "${Cmd}git clone https://github.com/a2n-s/tabbed $HDIR/$RDIR/tabbed${Off}"
    git clone https://github.com/a2n-s/tabbed $HDIR/$RDIR/tabbed
  fi
  echo "${Cmd}cd $HDIR/$RDIR/tabbed${Off}"
  cd $HDIR/$RDIR/tabbed
  echo "${Cmd}git checkout main${Off}"
  git checkout main
  echo "${Cmd}make clean install${Off}"
  make clean install
  echo "${Tip}[!!] Doc for this particular config is available at ${Url}https://a2n-s.github.io/public/doc/config/tabbed ${Off}"
}
install_wallpapers() {
  if [[ -d $HDIR/$RDIR/wallpapers ]]; then
    echo "${Wrn}$HDIR/$RDIR/wallpapers already exists${Off}"
    echo "${Wrn}please backup $HDIR/$RDIR/wallpapers before trying again${Off}"
  else
    echo "${Cmd}git clone https://github.com/a2n-s/wallpaper $HDIR/$RDIR/wallpapers${Off}"
    git clone https://github.com/a2n-s/wallpaper $HDIR/$RDIR/wallpapers
  fi
  echo "${Tip}[!!] Doc for this particular config is available at ${Url}https://a2n-s.github.io/public/doc/config/wallpapers ${Off}"
}
install_dmenu() {
  if [[ -d $HDIR/$RDIR/dmenu ]]; then
    echo "${Wrn}$HDIR/$RDIR/dmenu already exists${Off}"
    echo "${Wrn}please backup $HDIR/$RDIR/dmenu before trying again${Off}"
  else
    echo "${Cmd}git clone https://github.com/a2n-s/dmenu $HDIR/$RDIR/dmenu${Off}"
    git clone https://github.com/a2n-s/dmenu $HDIR/$RDIR/dmenu
  fi
  echo "${Cmd}cd $HDIR/$RDIR/dmenu${Off}"
  cd $HDIR/$RDIR/dmenu
  echo "${Cmd}git checkout main${Off}"
  git checkout main
  echo "${Cmd}make clean install${Off}"
  make clean install
  echo "${Tip}[!!] Doc for this particular config is available at ${Url}https://a2n-s.github.io/public/doc/config/dmenu ${Off}"
}
install_dmscripts() {
  install_dir ".config/dmscripts"
  if [[ -d $HDIR/$RDIR/dmscripts ]]; then
    echo "${Wrn}$HDIR/$RDIR/dmscripts already exists${Off}"
    echo "${Wrn}please backup $HDIR/$RDIR/dmscripts before trying again${Off}"
  else
    echo "${Cmd}git clone https://github.com/a2n-s/dmscripts $HDIR/$RDIR/dmscripts${Off}"
    git clone https://github.com/a2n-s/dmscripts $HDIR/$RDIR/dmscripts
  fi
  echo "${Tip}[!!] Doc for this particular config is available at ${Url}https://a2n-s.github.io/public/doc/config/dmscripts ${Off}"
}
install_fish() {
  install_dir ".config/fish"
  echo "${Cmd}sudo pacman -Syu ${Pkg}fish${Off}"
  sudo pacman -Syu fish
  if [[ -d $HDIR/$RDIR/oh-my-fish ]]; then
    echo "${Wrn}$HDIR/$RDIR/oh-my-fish already exists${Off}"
    echo "${Wrn}please backup $HDIR/$RDIR/oh-my-fish before trying again${Off}"
  else
    echo "${Cmd}git clone git://github.com/a2n-s/oh-my-fish.git $HDIR/$RDIR/oh-my-fish${Off}"
    git clone git://github.com/a2n-s/oh-my-fish.git $HDIR/$RDIR/oh-my-fish
  fi
  echo "${Tip}[!!] Doc for this particular config is available at ${Url}https://a2n-s.github.io/public/doc/config/fish ${Off}"
}
install_lazygit() {
  install_dir ".config/lazygit"
  echo "${Cmd}sudo pacman -Syu ${Pkg}lazygit${Off}"
  sudo pacman -Syu lazygit
  echo "${Tip}[!!] Doc for this particular config is available at ${Url}https://a2n-s.github.io/public/doc/config/dotfiles/lazygit ${Off}(${Red}NOT AVAILABLE FOR NOW${Off})"
}
install_lf() {
  install_dir ".config/lf"
  echo "${Cmd}yay -S ${Pkg}lf${Off}"
  yay -S lf
  echo "${Tip}[!!] Doc for this particular config is available at ${Url}https://a2n-s.github.io/public/doc/config/dotfiles/lf ${Off}(${Red}NOT AVAILABLE FOR NOW${Off})"
}
install_mpd() {
  install_dir ".config/mpd"
  echo "${Cmd}sudo pacman -Syu ${Pkg}mpd${Off}"
  sudo pacman -Syu mpd
  echo "${Tip}[!!] Doc for this particular config is available at ${Url}https://a2n-s.github.io/public/doc/config/dotfiles/mpd ${Off}(${Red}NOT AVAILABLE FOR NOW${Off})"
}
install_mpv() {
  install_dir ".config/mpv"
  echo "${Cmd}sudo pacman -Syu ${Pkg}mpv${Off}"
  sudo pacman -Syu mpv
  echo "${Tip}[!!] Doc for this particular config is available at ${Url}https://a2n-s.github.io/public/doc/config/dotfiles/mpv ${Off}(${Red}NOT AVAILABLE FOR NOW${Off})"
}
install_ncmpcpp() {
  install_dir ".config/ncmpcpp"
  echo "${Cmd}sudo pacman -Syu ${Pkg}ncmpcpp${Off}"
  sudo pacman -Syu ncmpcpp
  echo "${Tip}[!!] Doc for this particular config is available at ${Url}https://a2n-s.github.io/public/doc/config/dotfiles/ncmpcpp ${Off}(${Red}NOT AVAILABLE FOR NOW${Off})"
}
install_tigrc() {
  install_dir ".config/tigrc"
  echo "${Cmd}sudo pacman -Syu ${Pkg}tig${Off}"
  sudo pacman -Syu tig
  echo "${Tip}[!!] Doc for this particular config is available at ${Url}https://a2n-s.github.io/public/doc/config/dotfiles/tig ${Off}(${Red}NOT AVAILABLE FOR NOW${Off})"
}
install_zsh() {
  install_file ".zshrc"
  echo "${Cmd}sudo pacman -Syu ${Pkg}zsh${Off}"
  sudo pacman -Syu zsh
  if [[ -d $HDIR/$RDIR/oh-my-zsh ]]; then
    echo "${Wrn}$HDIR/$RDIR/oh-my-zsh already exists${Off}"
    echo "${Wrn}please backup $HDIR/$RDIR/oh-my-zsh before trying again${Off}"
  else
    echo "${Cmd}git clone git://github.com/a2n-s/ohmyzsh.git $HDIR/$RDIR/oh-my-zsh${Off}"
    git clone git://github.com/a2n-s/ohmyzsh.git $HDIR/$RDIR/oh-my-zsh
  fi
  echo "${Tip}[!!] Doc for this particular config is available at ${Url}https://a2n-s.github.io/public/doc/config/zsh ${Off}"
}
install_configs() {
  prompt_for_install_and_install "install_git"          "Install config for git?"
  prompt_for_install_and_install "install_htop"         "Install config for htop?"
  prompt_for_install_and_install "install_bash"         "Install config for bash?"
  prompt_for_install_and_install "install_fish"         "Install config for fish?"
  prompt_for_install_and_install "install_zsh"          "Install config for zsh?"
  prompt_for_install_and_install "install_starship"     "Install config for starship?"
  prompt_for_install_and_install "install_neofetch"     "Install config for neofetch?"
  prompt_for_install_and_install "install_vim"          "Install config for vim?"
  prompt_for_install_and_install "install_neovim"       "Install config for neovim?"
  prompt_for_install_and_install "install_x"            "Install config for x?"
  prompt_for_install_and_install "install_bspwm"        "Install config for bspwm?"
  prompt_for_install_and_install "install_spectrwm"     "Install config for spectrwm?"
  prompt_for_install_and_install "install_alacritty"    "Install config for alacritty?"
  prompt_for_install_and_install "install_kitty"        "Install config for kitty?"
  prompt_for_install_and_install "install_nitrogen"     "Install config for nitrogen?"
  prompt_for_install_and_install "install_slock"        "Install config for slock?"
  prompt_for_install_and_install "install_xscreensaver" "Install config for xscreensaver?"
  prompt_for_install_and_install "install_polybar"      "Install config for polybar?"
  prompt_for_install_and_install "install_vifm"         "Install config for vifm?"
  prompt_for_install_and_install "install_lf"           "Install config for lf?"
  prompt_for_install_and_install "install_surf"         "Install config for surf?"
  prompt_for_install_and_install "install_tabbed"       "Install config for tabbed?"
  prompt_for_install_and_install "install_wallpapers"   "Install config for wallpapers?"
  prompt_for_install_and_install "install_dmenu"        "Install config for dmenu?"
  prompt_for_install_and_install "install_dmscripts"    "Install config for dmscripts?"
  prompt_for_install_and_install "install_lazygit"      "Install config for lazygit?"
  prompt_for_install_and_install "install_tigrc"        "Install config for tigrc?"
  prompt_for_install_and_install "install_tmux"         "Install config for tmux?"
  prompt_for_install_and_install "install_mpd"          "Install config for mpd?"
  prompt_for_install_and_install "install_mpv"          "Install config for mpv?"
  prompt_for_install_and_install "install_ncmpcpp"      "Install config for ncmpcpp?"
}

################################################################################################
## standalone repos installation functions #####################################################
################################################################################################
install_repo() {
  if [[ -d $HDIR/$RDIR/$1 ]]; then
    echo "${Wrn}$HDIR/$RDIR/$1 already exists${Off}"
    echo "${Wrn}please backup $HDIR/$RDIR/$1 before trying again${Off}"
  else
    echo "${Crt}$HDIR/$RDIR/$1 does not exist${Off}"
    echo "${Wrn}mkdir -p $HDIR/$RDIR/$(dirname $1)${Off}"
    mkdir -p $HDIR/$RDIR/$(dirname $1)
    echo -e "${Cmd}git clone ${Src}$2 ${Dst}$HDIR/$RDIR/$1${Off}"
    git clone $2 $HDIR/$RDIR/$1
    if [[ ! $3 == "" ]]; then
      echo -e "${Cmd}git -C ${Dst}$HDIR/$RDIR/$1 ${Cmd}remote add upstream ${Src}$3${Off}"
      git -C $HDIR/$RDIR/$1 remote add upstream $3
      echo -e "${Cmd}git -C ${Dst}$HDIR/$RDIR/$1 ${Cmd}fetch upstream --prune${Off}"
      git -C $HDIR/$RDIR/$1 fetch upstream --prune
    fi
  fi
}
install_repos() {
	echo -e "\n$Normal Installing repos..."
  for repository in "${repositories[@]}"; do
    install_repo $repository
  done
}

################################################################################################
## font installation functions #################################################################
################################################################################################
install_font() {
	echo -ne "\n$Normal Available soon..."
}
install_fonts() {
	echo -ne "\n$Normal Installing fonts..."
	echo -e "\n$Normal Available soon..."
}

################################################################################################
## tools ans wrapping up #######################################################################
################################################################################################
prompt_for_install_and_install() {
  echo ""
  read -p "$Prompt $2 ${Cyn}(y/n/q)${Off} "
  case "$REPLY" in
    "y")  $1
    ;;
    "n")  echo "$Warning Skipping!"
    ;;
    "q")  echo "$Critic Aborting!"
          exit 1
    ;;
    *) echo -e "$Error Invalid Option, Skipping..."
    ;;
  esac
}

init_CFG() {
  CFG["REPO:prog/sketchbook/FastLED-basics"]="none"
  CFG["REPO:prog/scsc/fil-rouge"]="none"
  CFG["REPO:prog/scsc/fgk"]="none"
  CFG["REPO:prog/swarm-rescue-g1"]="none"
  CFG["REPO:sup/tatami"]="none"
  CFG["REPO:sup/machine-learning"]="none"
  CFG["REPO:sup/imgDesc"]="none"
  CFG["REPO:sup/flatland-project"]="none"
  CFG["REPO:sup/deep-learning"]="none"
  CFG["REPO:sup/stochastic"]="none"
  CFG["REPO:sup/mcdm"]="none"
  CFG["REPO:surf"]="none"
  CFG["REPO:yay-git"]="none"
  CFG["REPO:polybar"]="none"
  CFG["REPO:lazycli"]="none"
  CFG["REPO:dmscripts"]="none"
  CFG["REPO:dmenu"]="none"
  CFG["REPO:tabbed"]="none"
  CFG["REPO:slock"]="none"
  CFG["REPO:bash-insulter"]="none"
  CFG["REPO:kitty"]="none"
  CFG["REPO:Neovim-from-scratch"]="none"
  CFG["REPO:oh-my-bash"]="none"
  CFG["REPO:uzbl"]="none"
  CFG["REPO:oh-my-fish"]="none"
  CFG["REPO:a2n-s"]="none"
  CFG["REPO:wallpapers"]="none"
  CFG["REPO:oh-my-zsh"]="none"
  CFG["REPO:sites/nereuxofficial.github.io"]="none"
  CFG["REPO:sites/a2n-s.github.io/themes/hugo-theme-terminal"]="none"
  CFG["REPO:sites/a2n-s.github.io"]="none"
  CFG["REPO:dotfiles/atxr_dotfiles"]="none"
  CFG["REPO:research/playground_env"]="none"
  CFG["REPO:research/Imagine"]="none"
  CFG["REPO:research/imagineXdial"]="none"
  CFG["REPO:research/gym_ma_toy"]="none"
  CFG["REPO:research/learning-to-communicate-pytorch"]="none"

  CFG["SCRIPT:_countdown.sh"]="none"
  CFG["SCRIPT:_parse_git_info.sh"]="none"
  CFG["SCRIPT:_shortwd.sh"]="none"
  CFG["SCRIPT:_stopwatch.sh"]="none"
  CFG["SCRIPT:dmrun.sh"]="none"
  CFG["SCRIPT:lfrun.sh"]="none"
  CFG["SCRIPT:list.git-repos.diagnostic.sh"]="none"
  CFG["SCRIPT:misc.nvim-renaming.sh"]="none"
  CFG["SCRIPT:prompt.sh"]="none"
  CFG["SCRIPT:repo.info.sh"]="none"
  CFG["SCRIPT:screenshot.sh"]="none"
  CFG["SCRIPT:slock-cst.sh"]="none"
  CFG["SCRIPT:spectrWM-baraction.sh"]="none"
  CFG["SCRIPT:togkb.sh"]="none"
  CFG["SCRIPT:tr2md.sh"]="none"
  CFG["SCRIPT:upl.sh"]="none"
  CFG["SCRIPT:wvenv.sh"]="none"
  CFG["SCRIPT:xtcl.sh"]="none"
  CFG["SCRIPT:ytdl.sh"]="none"

  CFG["CONFIG:git"]="none"
  CFG["CONFIG:htop"]="none"
  CFG["CONFIG:bash"]="none"
  CFG["CONFIG:fish"]="none"
  CFG["CONFIG:zsh"]="none"
  CFG["CONFIG:starship"]="none"
  CFG["CONFIG:neofetch"]="none"
  CFG["CONFIG:vim"]="none"
  CFG["CONFIG:neovim"]="none"
  CFG["CONFIG:x"]="none"
  CFG["CONFIG:bspwm"]="none"
  CFG["CONFIG:spectrwm"]="none"
  CFG["CONFIG:alacritty"]="none"
  CFG["CONFIG:kitty"]="none"
  CFG["CONFIG:nitrogen"]="none"
  CFG["CONFIG:slock"]="none"
  CFG["CONFIG:xscreensaver"]="none"
  CFG["CONFIG:polybar"]="none"
  CFG["CONFIG:vifm"]="none"
  CFG["CONFIG:lf"]="none"
  CFG["CONFIG:surf"]="none"
  CFG["CONFIG:tabbed"]="none"
  CFG["CONFIG:wallpapers"]="none"
  CFG["CONFIG:dmenu"]="none"
  CFG["CONFIG:dmscripts"]="none"
  CFG["CONFIG:lazygit"]="none"
  CFG["CONFIG:tigrc"]="none"
  CFG["CONFIG:tmux"]="none"
  CFG["CONFIG:mpd"]="none"
  CFG["CONFIG:mpv"]="none"
  CFG["CONFIG:ncmpcpp"]="none"
}


install () {
  echo "$Normal ${Cmd}install ${Src}$1${Off}"; 
}

restore () {
  echo "$Warning restore process NOT IMPLEMENTED YET, stay tuned."
}

################################################################################################
## main ########################################################################################
################################################################################################
main() {
	cat <<- EOF
$Normal Installing config...${Src}
  source: $DIR${Dst}
  destination: $HDIR${Off}

EOF

  if [[ ! -d "$DIR/old" ]]; then
    echo "${Wrn}mkdir -p $DIR/old${Off}"
    mkdir -p $DIR/old
  fi
  if [[ ! -d "$DIR/old/.config" ]]; then
    echo "${Wrn}mkdir -p $DIR/old/.config${Off}"
    mkdir -p $DIR/old/.config
  fi
  for cfg in $(cat $tmpfile | grep -v "^\s*#" | grep -v "^\s*$" | grep -v "^discard" | sed 's/^/"/; s/$/"/; s/ /-/'); do
    cmd=$(echo $cfg | sed 's/"//g; s/-/ /' | awk '{print $1}')
    arg=$(echo $cfg | sed 's/"//g; s/-/ /' | awk '{print $2}')
    case $cmd in
      install|i|inst|add|deploy|test) install $arg ;;
      restore|remove|rm|delete|del|r) restore $arg ;;
      *)                              echo "$Warning Unknown command ${Pkg}$cmd${Off} for ${Cyn}$arg${Off}";;
    esac
  done
  # echo $options
  # echo "POSITIONAL | ${POSITIONAL[@]}"
  echo -e "\n$Normal Bye bye!!"
}

################################################################################################
## define and parse the flags and arguments ####################################################
################################################################################################
# define flags. #
#################
options=$(getopt -a -l help -o h \
                    -l prog/sketchbook/FastLED-basics                   \
                    -l prog/scsc/fil-rouge                              \
                    -l prog/scsc/fgk                                    \
                    -l prog/swarm-rescue-g1                             \
                    -l sup/tatami                                       \
                    -l sup/machine-learning                             \
                    -l sup/imgDesc                                      \
                    -l sup/flatland-project                             \
                    -l sup/deep-learning                                \
                    -l sup/stochastic                                   \
                    -l sup/mcdm                                         \
                    -l surf                                             \
                    -l yay-git                                          \
                    -l polybar                                          \
                    -l lazycli                                          \
                    -l dmscripts                                        \
                    -l dmenu                                            \
                    -l tabbed                                           \
                    -l slock                                            \
                    -l bash-insulter                                    \
                    -l kitty                                            \
                    -l Neovim-from-scratch                              \
                    -l oh-my-bash                                       \
                    -l uzbl                                             \
                    -l oh-my-fish                                       \
                    -l a2n-s                                            \
                    -l wallpapers                                       \
                    -l oh-my-zsh                                        \
                    -l sites/nereuxofficial.github.io                   \
                    -l sites/a2n-s.github.io/themes/hugo-theme-terminal \
                    -l sites/a2n-s.github.io                            \
                    -l dotfiles/atxr_dotfiles                           \
                    -l research/playground_env                          \
                    -l research/Imagine                                 \
                    -l research/imagineXdial                            \
                    -l research/gym_ma_toy                              \
                    -l research/learning-to-communicate-pytorch         \
                    -l _countdown.sh                                    \
                    -l _parse_git_info.sh                               \
                    -l _shortwd.sh                                      \
                    -l _stopwatch.sh                                    \
                    -l dmrun.sh                                         \
                    -l lfrun.sh                                         \
                    -l list.git-repos.diagnostic.sh                     \
                    -l misc.nvim-renaming.sh                            \
                    -l prompt.sh                                        \
                    -l repo.info.sh                                     \
                    -l screenshot.sh                                    \
                    -l slock-cst.sh                                     \
                    -l spectrWM-baraction.sh                            \
                    -l togkb.sh                                         \
                    -l tr2md.sh                                         \
                    -l upl.sh                                           \
                    -l wvenv.sh                                         \
                    -l xtcl.sh                                          \
                    -l ytdl.sh                                          \
                    -l git                                              \
                    -l htop                                             \
                    -l bash                                             \
                    -l fish                                             \
                    -l zsh                                              \
                    -l starship                                         \
                    -l neofetch                                         \
                    -l vim                                              \
                    -l neovim                                           \
                    -l x                                                \
                    -l bspwm                                            \
                    -l spectrwm                                         \
                    -l alacritty                                        \
                    -l kitty                                            \
                    -l nitrogen                                         \
                    -l slock                                            \
                    -l xscreensaver                                     \
                    -l polybar                                          \
                    -l vifm                                             \
                    -l lf                                               \
                    -l surf                                             \
                    -l tabbed                                           \
                    -l wallpapers                                       \
                    -l dmenu                                            \
                    -l dmscripts                                        \
                    -l lazygit                                          \
                    -l tigrc                                            \
                    -l tmux                                             \
                    -l mpd                                              \
                    -l mpv                                              \
                    -l ncmpcpp                                          \
                    -- "$@")
[ $? -eq 0 ] || {
    echo "Incorrect options provided"
    exit 1
}
eval set -- "$options"

declare -A CFG
init_CFG
########################
# parse regular flags. #
########################
POSITIONAL=()
while true; do
  case "$1" in
  --prog/sketchbook/FastLED-basics)                    CFG["REPO:prog/sketchbook/FastLED-basics"]="restore";;
  --prog/scsc/fil-rouge)                               CFG["REPO:prog/scsc/fil-rouge"]="restore";;
  --prog/scsc/fgk)                                     CFG["REPO:prog/scsc/fgk"]="restore";;
  --prog/swarm-rescue-g1)                              CFG["REPO:prog/swarm-rescue-g1"]="restore";;
  --sup/tatami)                                        CFG["REPO:sup/tatami"]="restore";;
  --sup/machine-learning)                              CFG["REPO:sup/machine-learning"]="restore";;
  --sup/imgDesc)                                       CFG["REPO:sup/imgDesc"]="restore";;
  --sup/flatland-project)                              CFG["REPO:sup/flatland-project"]="restore";;
  --sup/deep-learning)                                 CFG["REPO:sup/deep-learning"]="restore";;
  --sup/stochastic)                                    CFG["REPO:sup/stochastic"]="restore";;
  --sup/mcdm)                                          CFG["REPO:sup/mcdm"]="restore";;
  --surf)                                              CFG["REPO:surf"]="restore";;
  --yay-git)                                           CFG["REPO:yay-git"]="restore";;
  --polybar)                                           CFG["REPO:polybar"]="restore";;
  --lazycli)                                           CFG["REPO:lazycli"]="restore";;
  --dmscripts)                                         CFG["REPO:dmscripts"]="restore";;
  --dmenu)                                             CFG["REPO:dmenu"]="restore";;
  --tabbed)                                            CFG["REPO:tabbed"]="restore";;
  --slock)                                             CFG["REPO:slock"]="restore";;
  --bash-insulter)                                     CFG["REPO:bash-insulter"]="restore";;
  --kitty)                                             CFG["REPO:kitty"]="restore";;
  --Neovim-from-scratch)                               CFG["REPO:Neovim-from-scratch"]="restore";;
  --oh-my-bash)                                        CFG["REPO:oh-my-bash"]="restore";;
  --uzbl)                                              CFG["REPO:uzbl"]="restore";;
  --oh-my-fish)                                        CFG["REPO:oh-my-fish"]="restore";;
  --a2n-s)                                             CFG["REPO:a2n-s"]="restore";;
  --wallpapers)                                        CFG["REPO:wallpapers"]="restore";;
  --oh-my-zsh)                                         CFG["REPO:oh-my-zsh"]="restore";;
  --sites/nereuxofficial.github.io)                    CFG["REPO:sites/nereuxofficial.github.io"]="restore";;
  --sites/a2n-s.github.io/themes/hugo-theme-terminal)  CFG["REPO:sites/a2n-s.github.io/themes/hugo-theme-terminal"]="restore";;
  --sites/a2n-s.github.io)                             CFG["REPO:sites/a2n-s.github.io"]="restore";;
  --dotfiles/atxr_dotfiles)                            CFG["REPO:dotfiles/atxr_dotfiles"]="restore";;
  --research/playground_env)                           CFG["REPO:research/playground_env"]="restore";;
  --research/Imagine)                                  CFG["REPO:research/Imagine"]="restore";;
  --research/imagineXdial)                             CFG["REPO:research/imagineXdial"]="restore";;
  --research/gym_ma_toy)                               CFG["REPO:research/gym_ma_toy"]="restore";;
  --research/learning-to-communicate-pytorch)          CFG["REPO:research/learning-to-communicate-pytorch"]="restore";;
  --_countdown.sh)                                     CFG["SCRIPT:_countdown.sh"]="restore";;
  --_parse_git_info.sh)                                CFG["SCRIPT:_parse_git_info.sh"]="restore";;
  --_shortwd.sh)                                       CFG["SCRIPT:_shortwd.sh"]="restore";;
  --_stopwatch.sh)                                     CFG["SCRIPT:_stopwatch.sh"]="restore";;
  --dmrun.sh)                                          CFG["SCRIPT:dmrun.sh"]="restore";;
  --lfrun.sh)                                          CFG["SCRIPT:lfrun.sh"]="restore";;
  --list.git-repos.diagnostic.sh)                      CFG["SCRIPT:list.git-repos.diagnostic.sh"]="restore";;
  --misc.nvim-renaming.sh)                             CFG["SCRIPT:misc.nvim-renaming.sh"]="restore";;
  --prompt.sh)                                         CFG["SCRIPT:prompt.sh"]="restore";;
  --repo.info.sh)                                      CFG["SCRIPT:repo.info.sh"]="restore";;
  --screenshot.sh)                                     CFG["SCRIPT:screenshot.sh"]="restore";;
  --slock-cst.sh)                                      CFG["SCRIPT:slock-cst.sh"]="restore";;
  --spectrWM-baraction.sh)                             CFG["SCRIPT:spectrWM-baraction.sh"]="restore";;
  --togkb.sh)                                          CFG["SCRIPT:togkb.sh"]="restore";;
  --tr2md.sh)                                          CFG["SCRIPT:tr2md.sh"]="restore";;
  --upl.sh)                                            CFG["SCRIPT:upl.sh"]="restore";;
  --wvenv.sh)                                          CFG["SCRIPT:wvenv.sh"]="restore";;
  --xtcl.sh)                                           CFG["SCRIPT:xtcl.sh"]="restore";;
  --ytdl.sh)                                           CFG["SCRIPT:ytdl.sh"]="restore";;
  --git)                                               CFG["CONFIG:git"]="restore";;
  --htop)                                              CFG["CONFIG:htop"]="restore";;
  --bash)                                              CFG["CONFIG:bash"]="restore";;
  --fish)                                              CFG["CONFIG:fish"]="restore";;
  --zsh)                                               CFG["CONFIG:zsh"]="restore";;
  --starship)                                          CFG["CONFIG:starship"]="restore";;
  --neofetch)                                          CFG["CONFIG:neofetch"]="restore";;
  --vim)                                               CFG["CONFIG:vim"]="restore";;
  --neovim)                                            CFG["CONFIG:neovim"]="restore";;
  --x)                                                 CFG["CONFIG:x"]="restore";;
  --bspwm)                                             CFG["CONFIG:bspwm"]="restore";;
  --spectrwm)                                          CFG["CONFIG:spectrwm"]="restore";;
  --alacritty)                                         CFG["CONFIG:alacritty"]="restore";;
  --kitty)                                             CFG["CONFIG:kitty"]="restore";;
  --nitrogen)                                          CFG["CONFIG:nitrogen"]="restore";;
  --slock)                                             CFG["CONFIG:slock"]="restore";;
  --xscreensaver)                                      CFG["CONFIG:xscreensaver"]="restore";;
  --polybar)                                           CFG["CONFIG:polybar"]="restore";;
  --vifm)                                              CFG["CONFIG:vifm"]="restore";;
  --lf)                                                CFG["CONFIG:lf"]="restore";;
  --surf)                                              CFG["CONFIG:surf"]="restore";;
  --tabbed)                                            CFG["CONFIG:tabbed"]="restore";;
  --wallpapers)                                        CFG["CONFIG:wallpapers"]="restore";;
  --dmenu)                                             CFG["CONFIG:dmenu"]="restore";;
  --dmscripts)                                         CFG["CONFIG:dmscripts"]="restore";;
  --lazygit)                                           CFG["CONFIG:lazygit"]="restore";;
  --tigrc)                                             CFG["CONFIG:tigrc"]="restore";;
  --tmux)                                              CFG["CONFIG:tmux"]="restore";;
  --mpd)                                               CFG["CONFIG:mpd"]="restore";;
  --mpv)                                               CFG["CONFIG:mpv"]="restore";;
  --ncmpcpp)                                           CFG["CONFIG:ncmpcpp"]="restore";;

  -h|--help)
cat | less <<- EOF
repo:  help -o h
repo:  prog/sketchbook/FastLED-basics
repo:  prog/scsc/fil-rouge
repo:  prog/scsc/fgk
repo:  prog/swarm-rescue-g1
repo:  sup/tatami
repo:  sup/machine-learning
repo:  sup/imgDesc
repo:  sup/flatland-project
repo:  sup/deep-learning
repo:  sup/stochastic
repo:  sup/mcdm
repo:  surf
repo:  yay-git
repo:  polybar
repo:  lazycli
repo:  dmscripts
repo:  dmenu
repo:  tabbed
repo:  slock
repo:  bash-insulter
repo:  kitty
repo:  Neovim-from-scratch
repo:  oh-my-bash
repo:  uzbl
repo:  oh-my-fish
repo:  a2n-s
repo:  wallpapers
repo:  oh-my-zsh
repo:  sites/nereuxofficial.github.io
repo:  sites/a2n-s.github.io/themes/hugo-theme-terminal
repo:  sites/a2n-s.github.io
repo:  dotfiles/atxr_dotfiles
repo:  research/playground_env
repo:  research/Imagine
repo:  research/imagineXdial
repo:  research/gym_ma_toy
repo:  research/learning-to-communicate-pytorch
script:  _countdown.sh
script:  _parse_git_info.sh
script:  _shortwd.sh
script:  _stopwatch.sh
script:  dmrun.sh
script:  lfrun.sh
script:  list.git-repos.diagnostic.sh
script:  misc.nvim-renaming.sh
script:  prompt.sh
script:  repo.info.sh
script:  screenshot.sh
script:  slock-cst.sh
script:  spectrWM-baraction.sh
script:  togkb.sh
script:  tr2md.sh
script:  upl.sh
script:  wvenv.sh
script:  xtcl.sh
script:  ytdl.sh
config:  git
config:  htop
config:  bash
config:  fish
config:  zsh
config:  starship
config:  neofetch
config:  vim
config:  neovim
config:  x
config:  bspwm
config:  spectrwm
config:  alacritty
config:  kitty
config:  nitrogen
config:  slock
config:  xscreensaver
config:  polybar
config:  vifm
config:  lf
config:  surf
config:  tabbed
config:  wallpapers
config:  dmenu
config:  dmscripts
config:  lazygit
config:  tigrc
config:  tmux
config:  mpd
config:  mpv
config:  ncmpcpp
EOF
exit
      ;;

  --)
    shift
    break
    ;;
  esac
  shift
done
################################################
# parse flags treated as positional arguments. #
################################################
for posi in $(echo $options | sed 's/.*--//'); do POSITIONAL+=("$posi"); done
for posi in "${POSITIONAL[@]}"; do
  case "$posi" in
  "'+prog/sketchbook/FastLED-basics'")                    CFG["REPO:prog/sketchbook/FastLED-basics"]="install";;
  "'+prog/scsc/fil-rouge'")                               CFG["REPO:prog/scsc/fil-rouge"]="install";;
  "'+prog/scsc/fgk'")                                     CFG["REPO:prog/scsc/fgk"]="install";;
  "'+prog/swarm-rescue-g1'")                              CFG["REPO:prog/swarm-rescue-g1"]="install";;
  "'+sup/tatami'")                                        CFG["REPO:sup/tatami"]="install";;
  "'+sup/machine-learning'")                              CFG["REPO:sup/machine-learning"]="install";;
  "'+sup/imgDesc'")                                       CFG["REPO:sup/imgDesc"]="install";;
  "'+sup/flatland-project'")                              CFG["REPO:sup/flatland-project"]="install";;
  "'+sup/deep-learning'")                                 CFG["REPO:sup/deep-learning"]="install";;
  "'+sup/stochastic'")                                    CFG["REPO:sup/stochastic"]="install";;
  "'+sup/mcdm'")                                          CFG["REPO:sup/mcdm"]="install";;
  "'+surf'")                                              CFG["REPO:surf"]="install";;
  "'+yay-git'")                                           CFG["REPO:yay-git"]="install";;
  "'+polybar'")                                           CFG["REPO:polybar"]="install";;
  "'+lazycli'")                                           CFG["REPO:lazycli"]="install";;
  "'+dmscripts'")                                         CFG["REPO:dmscripts"]="install";;
  "'+dmenu'")                                             CFG["REPO:dmenu"]="install";;
  "'+tabbed'")                                            CFG["REPO:tabbed"]="install";;
  "'+slock'")                                             CFG["REPO:slock"]="install";;
  "'+bash-insulter'")                                     CFG["REPO:bash-insulter"]="install";;
  "'+kitty'")                                             CFG["REPO:kitty"]="install";;
  "'+Neovim-from-scratch'")                               CFG["REPO:Neovim-from-scratch"]="install";;
  "'+oh-my-bash'")                                        CFG["REPO:oh-my-bash"]="install";;
  "'+uzbl'")                                              CFG["REPO:uzbl"]="install";;
  "'+oh-my-fish'")                                        CFG["REPO:oh-my-fish"]="install";;
  "'+a2n-s'")                                             CFG["REPO:a2n-s"]="install";;
  "'+wallpapers'")                                        CFG["REPO:wallpapers"]="install";;
  "'+oh-my-zsh'")                                         CFG["REPO:oh-my-zsh"]="install";;
  "'+sites/nereuxofficial.github.io'")                    CFG["REPO:sites/nereuxofficial.github.io"]="install";;
  "'+sites/a2n-s.github.io/themes/hugo-theme-terminal'")  CFG["REPO:sites/a2n-s.github.io/themes/hugo-theme-terminal"]="install";;
  "'+sites/a2n-s.github.io'")                             CFG["REPO:sites/a2n-s.github.io"]="install";;
  "'+dotfiles/atxr_dotfiles'")                            CFG["REPO:dotfiles/atxr_dotfiles"]="install";;
  "'+research/playground_env'")                           CFG["REPO:research/playground_env"]="install";;
  "'+research/Imagine'")                                  CFG["REPO:research/Imagine"]="install";;
  "'+research/imagineXdial'")                             CFG["REPO:research/imagineXdial"]="install";;
  "'+research/gym_ma_toy'")                               CFG["REPO:research/gym_ma_toy"]="install";;
  "'+research/learning-to-communicate-pytorch'")          CFG["REPO:research/learning-to-communicate-pytorch"]="install";;
  "'+_countdown.sh'")                                     CFG["SCRIPT:_countdown.sh"]="install";;
  "'+_parse_git_info.sh'")                                CFG["SCRIPT:_parse_git_info.sh"]="install";;
  "'+_shortwd.sh'")                                       CFG["SCRIPT:_shortwd.sh"]="install";;
  "'+_stopwatch.sh'")                                     CFG["SCRIPT:_stopwatch.sh"]="install";;
  "'+dmrun.sh'")                                          CFG["SCRIPT:dmrun.sh"]="install";;
  "'+lfrun.sh'")                                          CFG["SCRIPT:lfrun.sh"]="install";;
  "'+list.git-repos.diagnostic.sh'")                      CFG["SCRIPT:list.git-repos.diagnostic.sh"]="install";;
  "'+misc.nvim-renaming.sh'")                             CFG["SCRIPT:misc.nvim-renaming.sh"]="install";;
  "'+prompt.sh'")                                         CFG["SCRIPT:prompt.sh"]="install";;
  "'+repo.info.sh'")                                      CFG["SCRIPT:repo.info.sh"]="install";;
  "'+screenshot.sh'")                                     CFG["SCRIPT:screenshot.sh"]="install";;
  "'+slock-cst.sh'")                                      CFG["SCRIPT:slock-cst.sh"]="install";;
  "'+spectrWM-baraction.sh'")                             CFG["SCRIPT:spectrWM-baraction.sh"]="install";;
  "'+togkb.sh'")                                          CFG["SCRIPT:togkb.sh"]="install";;
  "'+tr2md.sh'")                                          CFG["SCRIPT:tr2md.sh"]="install";;
  "'+upl.sh'")                                            CFG["SCRIPT:upl.sh"]="install";;
  "'+wvenv.sh'")                                          CFG["SCRIPT:wvenv.sh"]="install";;
  "'+xtcl.sh'")                                           CFG["SCRIPT:xtcl.sh"]="install";;
  "'+ytdl.sh'")                                           CFG["SCRIPT:ytdl.sh"]="install";;
  "'+git'")                                               CFG["CONFIG:git"]="install";;
  "'+htop'")                                              CFG["CONFIG:htop"]="install";;
  "'+bash'")                                              CFG["CONFIG:bash"]="install";;
  "'+fish'")                                              CFG["CONFIG:fish"]="install";;
  "'+zsh'")                                               CFG["CONFIG:zsh"]="install";;
  "'+starship'")                                          CFG["CONFIG:starship"]="install";;
  "'+neofetch'")                                          CFG["CONFIG:neofetch"]="install";;
  "'+vim'")                                               CFG["CONFIG:vim"]="install";;
  "'+neovim'")                                            CFG["CONFIG:neovim"]="install";;
  "'+x'")                                                 CFG["CONFIG:x"]="install";;
  "'+bspwm'")                                             CFG["CONFIG:bspwm"]="install";;
  "'+spectrwm'")                                          CFG["CONFIG:spectrwm"]="install";;
  "'+alacritty'")                                         CFG["CONFIG:alacritty"]="install";;
  "'+kitty'")                                             CFG["CONFIG:kitty"]="install";;
  "'+nitrogen'")                                          CFG["CONFIG:nitrogen"]="install";;
  "'+slock'")                                             CFG["CONFIG:slock"]="install";;
  "'+xscreensaver'")                                      CFG["CONFIG:xscreensaver"]="install";;
  "'+polybar'")                                           CFG["CONFIG:polybar"]="install";;
  "'+vifm'")                                              CFG["CONFIG:vifm"]="install";;
  "'+lf'")                                                CFG["CONFIG:lf"]="install";;
  "'+surf'")                                              CFG["CONFIG:surf"]="install";;
  "'+tabbed'")                                            CFG["CONFIG:tabbed"]="install";;
  "'+wallpapers'")                                        CFG["CONFIG:wallpapers"]="install";;
  "'+dmenu'")                                             CFG["CONFIG:dmenu"]="install";;
  "'+dmscripts'")                                         CFG["CONFIG:dmscripts"]="install";;
  "'+lazygit'")                                           CFG["CONFIG:lazygit"]="install";;
  "'+tigrc'")                                             CFG["CONFIG:tigrc"]="install";;
  "'+tmux'")                                              CFG["CONFIG:tmux"]="install";;
  "'+mpd'")                                               CFG["CONFIG:mpd"]="install";;
  "'+mpv'")                                               CFG["CONFIG:mpv"]="install";;
  "'+ncmpcpp'")                                           CFG["CONFIG:ncmpcpp"]="install";;
    *)
      echo -e "$Error Unknown flag ${Pkg}$posi${Off}"
      exit 2
      ;;
  esac
done

################################################################################################
## open up configuration interactive file ######################################################
################################################################################################
# build file #
##############
tmpfile=$(mktemp /tmp/a2n-s.install.XXXXXX)
trap  'rm "$tmpfile"' 0 1 15
cat << EOF > "$tmpfile"
# Installation process...
#
# my personal page: https://a2n-s.github.io/ 
# my github   page: https://github.com/a2n-s 
# my      dotfiles: https://github.com/a2n-s/dotfiles 
#
# Every line beginning with a '#' will be treated as a comment and thus discarded.

EOF
# echo "${CFG[$cfg]} $cfg" | sed 's/^none/none\&/;s/^uninstall/uninstall\&/;s/^install/install\&/;' >> $tmpfile
for cfg in "${!CFG[@]}"; do
    if [[ ! "${CFG[$cfg]}" =~ "none" ]]; then
      echo "${CFG[$cfg]} $cfg" | sed 's/^none/discard/' >> $tmpfile
    fi
done
cat << EOF >> "$tmpfile"

# Commands:
# i, install <config>   | install the config.
# r, restore <config>   | restore the config.
# d, discard <config>   | discard the config, same as commenting or deleting the line.
# n, none <config>      | don't do anything with the config, same as commenting or deleting the line.

EOF
for cfg in "${!CFG[@]}"; do
    if [[ "${CFG[$cfg]}" =~ "none" ]]; then
      echo "${CFG[$cfg]} $cfg" | sed 's/^none/discard/' >> $tmpfile
    fi
done

#############
# open file #
#############
if [[ -n $VISUAL ]]; then
  $VISUAL $tmpfile
elif [[ -n $EDITOR ]]; then
  $EDITOR $tmpfile
else
  vi $tmpfile
fi

main
