#!/bin/bash

# Obtém o dispositivo ativo para gravação de áudio
active=$(pactl list sources short | grep RUNNING | awk '{print $1}')

# Nome do arquivo baseado na data e hora
filename=$(date +%F_%T.mkv)

echo active sink: $active 
echo $filename

# Função para notificar a Waybar sobre o status da gravação
update_waybar() {
    if pgrep -x pw-record > /dev/null; then
        # Se estiver gravando, manda um sinal RTMIN+8
        pkill -RTMIN+8 waybar
    else
        # Se não estiver gravando, sinal RTMIN+9
        pkill -RTMIN+9 waybar
    fi
}

# Verifica se já há uma gravação rodando
if ! pgrep -x pw-record > /dev/null; then
    notify-send 'Wf-Recorder' 'Gravação iniciada'

    # Gravação com seleção de região de tela
    if [ "$1" == "-s" ]; then
        region=$(slurp -c "#FFFFFF")
        wf-recorder -g "$region" -a -f "$HOME/Videos/$filename" &
        sleep 2 
        update_waybar
        while pgrep -x slurp > /dev/null; do wait; done

    # Gravação da janela ativa
    elif [ "$1" == "-w" ]; then
        geometry=$(swaymsg -t get_tree | jq -r '.. | select(.pid? and .visible?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"')
        wf-recorder -g "$geometry" -a -f "$HOME/Videos/$filename" &
        sleep 2
        update_waybar

    # Gravação de tela completa
    else
        wf-recorder -a -f "$HOME/Videos/$filename" &
        update_waybar
    fi

# Se já estiver gravando, finaliza a gravação
else
    killall -s SIGINT wf-recorder
    notify-send 'Wf-Recorder' 'Gravação finalizada'
    while pgrep -x wf-recorder > /dev/null; do wait; done
    update_waybar
    name="$(zenity --entry --text 'Enter a filename')"
    perl-rename "s/\.(mkv|mp4)$/ $name $&/" "$(ls -d $HOME/Videos/* -t | head -n1)"
fi
