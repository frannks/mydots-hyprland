#!/usr/bin/env bash

# Diretório para salvar os prints
screenshot_dir="$HOME/Pictures/Screenshots"

# Função para exibir notificação Dunst com a thumbnail da imagem
show_notification() {
    dunstify -a 'Screenshother' -i "$1" -t 3000 "Recorte de tela copiado para o clipboard"
}

# Usando slurp para selecionar uma região da tela
geometry=$(slurp)
screenshot_file="$screenshot_dir/cropped-$(date +%Y%m%d%H%M%S).png"
grim -g "$geometry" "$screenshot_file"

# Copia a imagem para o clipboard
wl-copy < "$screenshot_file"

# Usa o swappy para editar o screenshot capturado
swappy -f "$screenshot_file"

# Exibe a notificação com a thumbnail do screenshot
show_notification "$screenshot_file"

