#!/usr/bin/env bash
export LANG=C
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

if [ $(tty) = /dev/tty1 ]; then
      # wayland related
      export QT_QPA_PLATFORM=wayland
      export CLUTTER_BACKEND=wayland
      export SDL_VIDEODRIVER=wayland
      export MOZ_ENABLE_WAYLAND=1

      # keyboard related
      export XKB_DEFAULT_LAYOUT='br'
      export XKB_DEFAULT_VARIANT='abnt2'
      clear && exec Hyprland
     
elif [ "$(tty)" = "/dev/tty2" ]; then
      clear && startx
fi
