#!/bin/sh

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

  if [[ "$status" == "Discharging" && $capacity -le 15 ]]; then
    notify-send --urgency normal '$name' '󱊡 Battery Low\n░ 15% Remaining'
  fi
  if [[ "$status" == "Discharging" && $capacity -le 5 ]]; then
    notify-send --urgency critical '$name' '󱃍 Battery Critical\n░ 5% Remaining'
  fi
done
