#!/usr/bin/env bash

# Franklin Souza
# @FranklinTech

# Criando pastas
FOLDER_CREATE(){
  clear
  mkdir $HOME/.frannks-mydots
  mkdir $HOME/.compile
  mkdir $HOME/.config/rofi
  mkdir $HOME/.config/rofi/themes
  mkdir $HOME/.config/nvim
  mkdir $HOME/.fonts
  mkdir $HOME/.themes
  mkdir $HOME/.icons
  mkdir $HOME/.local/bin
  mkdir $HOME/Wallpapers
  mkdir $HOME/.projects
  mkdir $HOME/Franks
  mkdir -p $HOME/.config/mpv/scripts
  mkdir -p $HOME/Franks/Estudos
  mkdir -p $HOME/Franks/Games
  mkdir -p $HOME/Franks/Filmes
  mkdir -p $HOME/Franks/Livros
  mkdir -p $HOME/Franks/Livros/MyBooks
  mkdir -p $HOME/Franks/Python
  mkdir -p $HOME/Franks/C
  mkdir -p $HOME/Franks/ShellScripts
  mkdir -p $HOME/Franks/Projetos/TelegramBots
  mkdir -p $HOME/Franks/Projetos/Dockerfiles
  mkdir -p $HOME/Franks/Projetos/Repository
}

# Instalação de pacotes
PACKAGES_INSTALL(){
  clear && sudo pacman -S rustup gucharmap kitty grim slurp cronie firefox-i18n-pt-br htop unzip unrar zip p7zip tor dunst fuse mpv pacman-contrib lxappearance gvfs-mtp xdg-user-dirs ttf-fira-code zsh zsh-autosuggestions zsh-syntax-highlighting reflector ttf-jetbrains-mono ttf-dejavu ttf-font-awesome bc base-devel lsd yt-dlp bat net-tools dosfstools polkit-gnome nodejs yarn fzf ueberzug man-db python-pywal wget pyenv python-pipx python-jedi python-pylint python-requests python-pypperclip --noconfirm && xdg-user-dirs-update
  rustup default stable && clear
}

# Compilando pacotes AUR
AUR_BUILD(){
  cd $HOME/.compile
  git clone https://aur.archlinux.org/wal-telegram-git.git
  cd wal-telegram-git
  makepkg -sic --noconfirm

  clear
  cd $HOME/.projects
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git
  echo 'source ~/.projects/powerlevel10k/powerlevel10k.zsh-theme' >> $HOME/.zshrc

  clear
  cd $HOME/.projects
  git clone https://github.com/GideonWolfe/Zathura-Pywal.git
  cd Zathura-Pywal && chmod +x install.sh && ./install.sh
}
