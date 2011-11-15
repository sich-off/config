#!/bin/bash
if [ -z "$1" ]; then
  echo "usage $0 <fontsize>"
  exit 1;
fi

printf '\33]50;%s\007' "xft:Terminus:pixelsize=$1"
