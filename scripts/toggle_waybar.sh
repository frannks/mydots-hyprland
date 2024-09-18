#!/bin/bash

# Verifica se a waybar está visível
if pgrep -x "waybar" > /dev/null
then
    # Se estiver visível, oculta a waybar
    pkill waybar
else
    # Se não estiver visível, exibe a waybar
    waybar &
fi
