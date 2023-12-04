#!/usr/bin/env bash

# Verifica se o Scrcpy está instalado
if ! command -v scrcpy &> /dev/null; then
    clear && echo "Scrcpy não está instalado. Por favor, instale-o antes de prosseguir."
    exit 1
fi

# Função para iniciar o Scrcpy com conexão USB
function start_usb() {
    # Verifica se o dispositivo está conectado via USB
    if ! adb devices | grep device$ &> /dev/null; then
        echo "Nenhum dispositivo Android encontrado. Por favor, conecte o dispositivo ao computador via USB."
        exit 1
    fi

    # Inicia o Scrcpy com a conexão USB
    echo "Iniciando o Scrcpy com a conexão via USB..."
    scrcpy -S &
}

# Função para iniciar o Scrcpy com conexão via rede local
function start_network() {
    # Verifica se o dispositivo está conectado à mesma rede local
    if ! adb devices | grep device$ &> /dev/null; then
        echo "Nenhum dispositivo Android encontrado. Por favor, conecte o dispositivo ao computador via rede local."
        exit 1
    fi

    # Obtém o endereço IP do dispositivo Android na rede local
    device_ip=$(adb shell ifconfig wlan0 | awk '/inet addr/{print substr($2,6)}')

    # Inicia o Scrcpy com a conexão via rede local
    echo "Iniciando o Scrcpy com a conexão via rede local..."
    scrcpy -S --serial "$device_ip" &
}

# Menu para escolher o modo de conexão
clear && echo "Selecione o modo de conexão:"
echo "1. USB"
echo "2. Rede Local"
read -r -p "Digite o número correspondente ao modo desejado: " mode

case $mode in
    1) start_usb ;;
    2) start_network ;;
    *) echo "Opção inválida. Saindo." ;;
esac

echo "Espelhamento iniciado. Pressione [Ctrl+C] para encerrar ou [B] para apagar a tela."

while true; do
    read -r -n 1 -s key
    if [[ $key == "b" ]] || [[ $key == "B" ]]; then
        echo "Apagando a tela do dispositivo..."
        adb shell input keyevent 26
    fi
    if [[ $key == $'\x03' ]]; then
        break
    fi
done

# Encerra o Scrcpy
echo "Encerrando o Scrcpy..."
pkill scrcpy

echo "Espelhamento finalizado."
