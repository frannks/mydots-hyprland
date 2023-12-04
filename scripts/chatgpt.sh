#!/usr/bin/env bash

clear
KEY_OPENAI=$(cat $HOME/.KEY_OPENAI)
while printf "Chatgpt\n\nDigite algo: " && read -r PROMPT; do
  SAIDA=$(curl -s https://api.openai.com/v1/completions -H "Content-Type: application/json" -H "Authorization: Bearer $KEY_OPENAI" -d "{\"model\": \"text-davinci-003\", \"prompt\": \"${PROMPT}\", \"temperature\": 1, \"max_tokens\": 500}" | python -c "import sys, json; print(json.load(sys.stdin)['choices'][0]['text'].strip())" | sed 's/^[^A-Za-z]*//' | sed -e 's/^[ \t]*//' -e 's/[ \t]*$//')
  echo ""
  echo -e "\033[0;32m${SAIDA}\033[0m"
  echo ""
done
