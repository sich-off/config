#!/bin/bash

case $1 in
  i*)
    xrandr --output LVDS1 --auto --output VGA1 --off
    ;;
  e*)
    xrandr --output VGA1 --auto --output LVDS1 --off
    ;;
  b*)
    xrandr --output LVDS1 --auto --output VGA1 --auto --above LVDS1
    ;;
  *)
    echo "Usage: [ i[nternal] | e[xternal] | b[oth] ]"
    ;;
esac
