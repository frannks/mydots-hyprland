#!/usr/bin/env bash

# Franklin Souza
# @FranklinTech

# Variáveis
# Solicita o nome do usuário
clear && read -p "Digite seu nome de usuário do GitHub: " username
printf "\n" && read -p "Digita o nome do repositorio: " repository

# Token de acesso pessoal
token="ADICIONE SEU TOKEN AQUI"

# Verifica se o repositório existe
DIR="$HOME/Franks/Projetos/Repository/"$repository""
if [ ! -d "$DIR" ]; then
  echo "Repositório não encontrado!"
  exit 1
fi

# Entra no repositório

cd "$HOME/Franks/Projetos/Repository/$repository"

# Adiciona todas as alterações
git add --all

# Faz o commit
git commit -m "Commit automático no repositório $repository!"

# Configura o token de acesso pessoal para a autenticação
git config credential.helper "store --file=.git/credentials" # Salva as credenciais

# Envia para o GitHub
git push origin main
