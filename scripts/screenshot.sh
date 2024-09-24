#!/usr/bin/env bash
#
# Franklin Souza
# @FranklinTech

SOUND=/usr/share/sounds/freedesktop/stereo/complete.oga

# Diretório para salvar os prints
screenshot_dir="$HOME/Pictures/Screenshots"

# Cria o diretório se não existir
mkdir -p "$screenshot_dir"

# Função para exibir notificação Dunst
show_notification() {
    dunstify -i screenshot -t 3000 "$1"
}

# Função para tirar print de toda a tela e salvar
take_full_screen() {
    screenshot_file="$screenshot_dir/screenshot-$(date +%Y%m%d%H%M%S).png"
    grim "$screenshot_file"
    swappy -f "$screenshot_file" && show_notification "Print de tela salvo em $screenshot_file" && mpv "$SOUND"
}

# Função para tirar print de toda a tela, copiar para o clipboard e abrir no Swappy
take_full_screen_to_clipboard() {
    screenshot_file="$screenshot_dir/screenshot-$(date +%Y%m%d%H%M%S).png"
    grim "$screenshot_file" && wl-copy < "$screenshot_file"
    swappy -f "$screenshot_file" && show_notification "Print de tela copiado para o clipboard" && mpv "$SOUND"
}

# Função para recortar print e salvar
crop_screen() {
    # Usando slurp para selecionar uma região da tela
    geometry=$(slurp)
    screenshot_file="$screenshot_dir/cropped-$(date +%Y%m%d%H%M%S).png"
    grim -g "$geometry" "$screenshot_file"
    swappy -f "$screenshot_file" && show_notification "Recorte de tela salvo em $screenshot_file" && mpv "$SOUND"
}

# Função para recortar print, copiar para o clipboard e abrir no Swappy
crop_screen_to_clipboard() {
    # Usando slurp para selecionar uma região da tela
    geometry=$(slurp)
    screenshot_file="$screenshot_dir/cropped-$(date +%Y%m%d%H%M%S).png"
    grim -g "$geometry" "$screenshot_file"
    wl-copy < "$screenshot_file"  # Copia para o clipboard
    swappy -f "$screenshot_file" && show_notification "Recorte de tela copiado para o clipboard" && mpv "$SOUND"
}

# Opções do menu
options=("Tirar print da tela toda\n""Tirar print da tela toda (clipboard)\n""Recortar print\n""Recortar print (clipboard)\n")

# Usando wofi para exibir o menu
selected_option=$(echo -e "${options[@]}" | wofi -dmenu -i -p "Escolha uma opção")

# Aguarde 1 segundo
sleep 1

# Executando a ação correspondente à opção selecionada
case "$selected_option" in
    "Tirar print da tela toda")
        take_full_screen
        ;;
    "Tirar print da tela toda (clipboard)")
        take_full_screen_to_clipboard
        ;;
    "Recortar print")
        crop_screen
        ;;
    "Recortar print (clipboard)")
        crop_screen_to_clipboard
        ;;
    *)
        echo "Opção inválida"
        ;;
esac
ChatGPT said:

