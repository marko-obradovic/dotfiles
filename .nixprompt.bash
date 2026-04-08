#!/bin/bash
# nix-prompt — gruvbox edition

### Setup
config() {
  declare -ag segments=(identity path git nix prompt)
  declare -ag dynamics=(identity git nix)

  declare -g use_colors=true
  declare -g use_glyphs=true
  declare -g use_badges=true

  # 🌻 Gruvbox palette (dark)
  declare -g color_primary="#98971a"   # yellow (main accent)
  declare -g color_secondary="#fabd2f" # yellow
  declare -g color_neutral="#a89984"   # gray
  declare -g color_error="#fb4934"     # red

  if is_root; then
    color_global=$color_error
  else
    color_global=$color_primary
  fi

  if is_console; then use_glyphs=false; fi

  PS1=""
  PS2="→ "
  PROMPT_DIRTRIM=2

  export GIT_PS1_SHOWDIRTYSTATE=1
  export GIT_PS1_SHOWUNTRACKEDFILES=1
  export GIT_PS1_SHOWUPSTREAM="auto"

}

init() {
  for segment in "${segments[@]}"; do
    local renderer="render_$segment"

    if ! declare -F "$renderer" >/dev/null; then continue; fi

    if [[ "${dynamics[*]}" =~ $segment ]]; then
      PS1+="\$($renderer) "
    else
      PS1+="$($renderer) "
    fi
  done
}

# -----------------------------
# 🎭 RENDERERS
# -----------------------------

render_identity() {
  local glyph
  local label="$USER"

  if is_error "$?"; then
    glyph="✗"
    label="error"
  elif is_root; then
    glyph=""
  else
    glyph="󰘵"
  fi

  make_label "$glyph $label" "$color_primary"
}

render_path() {
  local glyph=""
  local label="\W"

  if $use_glyphs; then
    printf "%s %s" "$(make_label "$glyph" "$color_secondary")" "$label"
  else
    printf "%s" "$label"
  fi
}

render_git() {
  if ! is_git; then return 1; fi

  local branch
  local status=""

  branch=$(git branch --show-current 2>/dev/null)

  git diff --quiet 2>/dev/null || status+="*"
  git diff --cached --quiet 2>/dev/null || status+="+"

  if [[ -n $(git ls-files --others --exclude-standard 2>/dev/null) ]]; then
    status+="?"
  fi

  local ahead behind
  read -r ahead behind <<<"$(git rev-list --left-right --count @{upstream}...HEAD 2>/dev/null || echo "0 0")"

  [[ $ahead -gt 0 ]] && status+="↑$ahead"
  [[ $behind -gt 0 ]] && status+="↓$behind"

  local label=" $branch$status"

  make_label "($label)" "$color_secondary"
}

render_prompt() {
  printf "\n$(make_label ":::" "$color_primary") "
}

# -----------------------------
# 🧰 HELPERS
# -----------------------------

hex_to_ansi() {
  local hex=${1#\#}
  local r=$((16#${hex:0:2}))
  local g=$((16#${hex:2:2}))
  local b=$((16#${hex:4:2}))
  printf "2;%s;%s;%s" "$r" "$g" "$b"
}

make_label() {
  local content=$1
  local color=${2:-$color_global}

  [[ -z $content ]] && return 1

  if $use_colors; then
    printf "\001\033[38;%sm\002" "$(hex_to_ansi "$color")"
  fi

  printf "%b" "$content"

  if $use_colors; then
    printf "\001\033[0m\002"
  fi
}

# -----------------------------
# 🧠 PREDICATES
# -----------------------------

is_root() { [[ $EUID -eq 0 ]]; }
is_console() { [[ -t 1 && $TERM == linux ]]; }

is_error() { [[ $1 -ne 0 && $1 -ne 130 ]]; }

is_git() {
  git rev-parse --is-inside-work-tree >/dev/null 2>&1
}

# -----------------------------
# 🚀 INIT
# -----------------------------

config && init
