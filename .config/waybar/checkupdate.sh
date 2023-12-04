
#!/usr/bin/env bash

UPDATES=$(pacman -Qu | wc -l)

re='^[0-9]+$'
if ! [[ $UPDATES =~ $re ]] ; then
   echo "Falha ao verificar as atualizações!!!"; exit 0
fi

if (( $UPDATES > 0 ));then
  echo "${UPDATES} atualizações disponíveis!!!"; exit 0
else
  echo "O sistema está atualizado!!!"; exit 0
fi

