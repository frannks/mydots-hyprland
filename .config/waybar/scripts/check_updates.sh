
#!/usr/bin/env bash

# Verifica as atualizações disponíveis nos repositórios oficiais
official_updates=$(checkupdates 2>/dev/null | wc -l)

# Verifica as atualizações disponíveis no chaotic-aur
#chaotic_updates=$(chaotic-aur -Qua 2>/dev/null | wc -l)

# Verifica as atualizações disponíveis no AUR usando o paru
paru_updates=$(paru -Qua 2>/dev/null | wc -l)

# Soma as atualizações totais
total_updates=$((official_updates + paru_updates))

re='^[0-9]+$'
if ! [[ $total_updates =~ $re ]] ; then
   echo "Falha ao verificar as atualizações!!!"; exit 0
fi

if (( $total_updates > 0 )); then
  echo " $total_updates atualizações disponíveis!!!"; exit 0
else
  echo " O seu arch está atualizado!!!"; exit 0
fi

