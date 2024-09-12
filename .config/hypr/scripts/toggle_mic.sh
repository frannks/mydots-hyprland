#!/bin/bash

# Caminho do arquivo onde o estado será salvo
status_file="/tmp/mic_status"

# Obtém o ID do dispositivo de entrada de áudio (microfone)
mic_id=$(pactl list short sources | grep "input" | grep -v monitor | awk '{print $1}')

# Obtém o estado atual do microfone (mutado ou não)
mic_status=$(pactl get-source-mute "$mic_id")

# Verifica o estado atual e inverte
if [[ "$mic_status" == *"yes"* ]]; then
    # Se estiver mutado, desmuta
    pactl set-source-mute "$mic_id" 0
    notify-send "Microfone Ativado"
    echo "  " > "$status_file"
else
    # Se estiver ativo, muta
    pactl set-source-mute "$mic_id" 1
    notify-send "Microfone Mutado"
    echo "  " > "$status_file"
fi
