#!/bin/bash

get_batteries() {
  for bat in /sys/class/power_supply/*; do
    if [[ -f "$bat/type" ]] && grep -q "Battery" "$bat/type"; then
      echo "$bat"
    fi
  done
}

for bat in $(get_batteries); do
  battery_capacity=$(cat "$bat/capacity")
  battery_status=$(cat "$bat/status")
  name=$(basename "$bat")

  if [[ "$battery_status" == "Discharging" && $battery_capacity -le 15 && $battery_capacity -gt 5 ]]; then
    notify-send --urgency normal "$name" "󱊡 Battery Low\n░ ${battery_capacity}% Remaining"
  fi
  if [[ "$battery_status" == "Discharging" && $battery_capacity -le 5 ]]; then
    notify-send --urgency critical "$name" "󱃍 Battery Critical\n░ ${battery_capacity}% Remaining"
  fi
done
