#!/usr/bin/env bash

# Verifique se o grim e slurp estão instalados
if ! command -v grim &> /dev/null || ! command -v slurp &> /dev/null; then
    echo "Grim ou slurp não estão instalados. Instale-os usando seu gerenciador de pacotes."
    exit 1
fi

# Diretório de destino para salvar as capturas de tela
DEST_DIR="$HOME/Pictures/Screenshots"

# Verifique se o diretório de destino existe, crie se não existir
#mkdir -p "$DEST_DIR"

# Nome do arquivo de captura de tela (com timestamp)
FILENAME="$DEST_DIR/screenshot-$(date +"%Y%m%d%H%M%S").png"

# Use slurp para selecionar uma área antes de tirar a screenshot
selected_area=$(slurp)

# Verifique se o usuário cancelou a seleção
if [ -z "$selected_area" ]; then
    echo "Seleção cancelada."
    exit 1
fi

# Comando para tirar a screenshot usando grim com a área selecionada
grim -g "$selected_area" "$FILENAME"

# Notifique o usuário sobre a captura de tela
notify-send "Screenshot capturada" "A captura de tela foi salva em: $FILENAME"
