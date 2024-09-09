#!/usr/bin/env bash
# shortener.sh - encurtador de URLs

# TODO: o token abaixo é inválido! use o seu token!
readonly BITLY_TOKEN='SEU-TOKEN-AQUI'
readonly BITLY_ENDPOINT='https://api-ssl.bitly.com/v4/shorten'

shortener() {
  local long_url="$1"
  while [[ -z "$long_url" ]]; do
    clear && printf "Bitly Shortner\n\n"
    read -r -p "Digite a url: " long_url
  done
  curl -s \
    --header "Authorization: Bearer ${BITLY_TOKEN}" \
    --header "Content-Type: application/json" \
    --data "{\"long_url\":\"${long_url}\"}" \
    "${BITLY_ENDPOINT}" \
    | jq -r 'if .link == null then .description else .link end'
}

shortener "$@"
