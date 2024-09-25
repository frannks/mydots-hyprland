#!/usr/bin/env bash

# Franklin Souza
# @frannksz

# Diretório para salvar os prints
screenshot_dir="$HOME/Pictures/Screenshots"

# Função para exibir notificação Dunst com informações do arquivo salvo
show_notification() {
    dunstify -a 'Screenshother' -i "$1" -u low "Image Saved" "Saved to $screenshot_dir\n$(basename "$1")"
}

# Função para exibir notificação de cancelamento
show_cancel_notification() {
    dunstify -a 'Screenshother' -t 3000 "Captura de tela cancelada"
}

# Usando grimblast com --freeze para selecionar uma área da tela e salvar o screenshot
screenshot_file="$screenshot_dir/cropped-$(date +%Y%m%d%H%M%S).png"
grimblast --freeze save area "$screenshot_file"
exit_code=$?

# Verifica se o usuário cancelou a captura
if [ $exit_code -eq 1 ]; then
    show_cancel_notification
    exit 1
fi

# Copia a imagem para o clipboard
wl-copy < "$screenshot_file"

# Usa o swappy para editar o screenshot capturado
swappy -f "$screenshot_file"

# Exibe a notificação com o caminho e nome do arquivo
show_notification "$screenshot_file"

