#!/bin/bash

# Verificar se o ffmpeg está instalado
if ! command -v ffmpeg &> /dev/null; then
    echo "ffmpeg não está instalado. Por favor, instale-o com: sudo pacman -S ffmpeg"
    exit 1
fi

# Verificar se foi fornecido um arquivo
if [ -z "$1" ]; then
    echo "Uso: $0 arquivo [mkv|mp4]"
    exit 1
fi

# Pegar o arquivo de entrada
input_file="$1"
output_format="$2"

# Extrair a extensão do arquivo
input_extension="${input_file##*.}"

# Função para converter MKV para MP4
convert_to_mp4() {
    output_file="${input_file%.*}.mp4"
    ffmpeg -i "$input_file" -c:v copy -c:a copy "$output_file"
    echo "Conversão completa: $output_file"
}

# Função para converter MP4 para MKV
convert_to_mkv() {
    output_file="${input_file%.*}.mkv"
    ffmpeg -i "$input_file" -c:v copy -c:a copy "$output_file"
    echo "Conversão completa: $output_file"
}

# Verificar o formato desejado
if [ "$output_format" == "mp4" ]; then
    if [ "$input_extension" != "mkv" ]; then
        echo "Erro: O arquivo de entrada não é MKV."
        exit 1
    fi
    convert_to_mp4
elif [ "$output_format" == "mkv" ]; then
    if [ "$input_extension" != "mp4" ]; then
        echo "Erro: O arquivo de entrada não é MP4."
        exit 1
    fi
    convert_to_mkv
else
    echo "Formato de saída inválido. Escolha 'mp4' ou 'mkv'."
    exit 1
fi
