#!/usr/bin/env bash

# Obtém a entrada do usuário usando o rofi
query=$(rofi -dmenu -p "Pesquisar no navegador")

# Verifica se a consulta está vazia
if [[ -z "$query" ]]; then
    exit 0
fi

# Verifica se a consulta é um URL
if [[ $query == http* ]]; then
    # Abre o URL usando o navegador padrão
    xdg-open "$query"
else
    # Verifica se a consulta é um termo de pesquisa
    if [[ $query == *[^[:space:]]* ]]; then
        # Executa a pesquisa no mecanismo padrão do navegador
        xdg-open "https://www.google.com/search?q=$query"
    else
        # Obtém o histórico do navegador
        history=$(xdg-open .local/share/recently-used.xbel | grep -oP '(?<=<bookmark href=").*?(?=")')

        # Pesquisa no histórico usando o rofi
        selected=$(echo -e "$history" | rofi -dmenu -p "Pesquisar no histórico:")

        # Verifica se algo foi selecionado
        if [[ -n "$selected" ]]; then
            # Abre o URL selecionado usando o navegador padrão
            xdg-open "$selected"
        fi
    fi
fi
