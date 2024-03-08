#!/usr/bin/env bash
#
# Franklin Souza
# @FranklinTech

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
    grim "$screenshot_dir/screenshot-$(date +%Y%m%d%H%M%S).png"
    show_notification "Print de tela salvo em $screenshot_dir"
}

# Função para tirar print de toda a tela, copiar para o clipboard e salvar
take_full_screen_to_clipboard() {
    grim - | wl-copy
    #take_full_screen
}

# Função para recortar print e salvar
crop_screen() {
    # Usando slurp para selecionar uma região da tela
    geometry=$(slurp)
    grim -g "$geometry" "$screenshot_dir/cropped-$(date +%Y%m%d%H%M%S).png"
    show_notification "Recorte de tela salvo em $screenshot_dir"
}

# Função para recortar print, copiar para o clipboard e salvar
crop_screen_to_clipboard() {
    # Usando slurp para selecionar uma região da tela
    geometry=$(slurp)
    grim -g "$geometry" - | wl-copy
    #crop_screen
}

# Opções do menu
options=("Tirar print de toda a tela\n""Tirar print de toda a tela para o clipboard\n""Recortar print\n""Recortar print para o clipboard\n")

# Usando rofi para exibir o menu
selected_option=$(echo -e "${options[@]}" | rofi -dmenu -i -p "Escolha uma opção")

# Aguarda 5 segundos
sleep 2

# Executando a ação correspondente à opção selecionada
case "$selected_option" in
    "Tirar print de toda a tela")
        take_full_screen
        ;;
    "Tirar print de toda a tela para o clipboard")
        take_full_screen_to_clipboard
        ;;
    "Recortar print")
        crop_screen
        ;;
    "Recortar print para o clipboard")
        crop_screen_to_clipboard
        ;;
    *)
        echo "Opção inválida"
        ;;
esac

