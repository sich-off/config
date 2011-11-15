#!/bin/bash

for i in *; do
  NUM=$(id3v2 -l "$i" | grep TRCK | sed -e 's|.*: \([0-9]*\).*|\1|')
  #NAME=$(id3v2 -l "$i" | grep TIT2 | sed -e 's/.*: //; s|'\''|'\''\\'\'\''|g; ')
  NAME=$(id3v2 -l "$i" | grep TIT2 | sed -e 's/.*: //;')

  ( echo $i;
    if (($NUM < 10)); then
      echo -n 0
    fi
    echo $NUM - $NAME.mp3
  ) | xargs -d \\\n mv;
done


