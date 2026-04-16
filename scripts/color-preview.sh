#!/usr/bin/env bash

while true; do
  read -rp "Hex: " hex

  [[ "$hex" == "q" ]] && exit

  hex="${hex#\#}"

  if [[ ! "$hex" =~ ^[0-9a-fA-F]{6}$ ]]; then
    echo "Invalid hex"
    continue
  fi

  r=$((16#${hex:0:2}))
  g=$((16#${hex:2:2}))
  b=$((16#${hex:4:2}))

  clear
  printf "\n\n"
  printf "   #%s\n\n" "$hex"

  # Big color block
  for i in {1..10}; do
    printf "\033[48;2;%d;%d;%dm                                \033[0m\n" "$r" "$g" "$b"
  done

done
