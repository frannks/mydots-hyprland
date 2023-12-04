#!/bin/bash

# Verifica se o Simple MTPFS está instalado
if ! command -v simple-mtpfs &>/dev/null; then
  clear && echo "O Simple MTPFS não está instalado. Por favor, instale-o."
  exit 1
fi

# Função para montar o dispositivo MTP
mount_device() {
  # Verifica se o dispositivo está conectado
  if ! simple-mtpfs -l &>/dev/null; then
    echo "Nenhum dispositivo MTP encontrado. Por favor, conecte o dispositivo."
    return 1
  fi

  # Monta o dispositivo MTP
  echo "Montando o dispositivo MTP..."
  simple-mtpfs --device 1 $HOME/Franks/.celular

  if [ $? -eq 0 ]; then
    echo "Dispositivo MTP montado com sucesso em $HOME/Franks/.celular"
  else
    echo "Falha ao montar o dispositivo MTP."
  fi
}

# Função para desmontar o dispositivo MTP
unmount_device() {
  # Verifica se o dispositivo está montado
  if ! grep -qs "$HOME/Franks/.celular" /proc/mounts; then
    echo "O dispositivo MTP não está montado."
    return 1
  fi

  # Desmonta o dispositivo MTP
  echo "Desmontando o dispositivo MTP..."
  fusermount -u $HOME/Franks/.celular

  if [ $? -eq 0 ]; then
    echo "Dispositivo MTP desmontado com sucesso."
  else
    echo "Falha ao desmontar o dispositivo MTP."
  fi
}

# Loop principal do script
while true; do
  echo "Selecione uma opção:"
  echo "1. Montar dispositivo MTP"
  echo "2. Desmontar dispositivo MTP"
  echo "3. Sair"

  read -p "Opção: " option
  echo

  case $option in
    1) mount_device ;;
    2) unmount_device ;;
    3) break ;;
    *) echo "Opção inválida. Por favor, selecione novamente." ;;
  esac

  echo
done
