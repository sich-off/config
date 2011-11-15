#!/bin/bash
# This script extracts status and charge percentage of batteries.

for i in /sys/class/power_supply/BAT*; do
  echo $(< $i/status) $(($(< $i/charge_now) * 100 / $(< $i/charge_full)))
done
