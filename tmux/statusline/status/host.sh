show_host() {
  local index=$1
  local icon=$(get_tmux_option "@host_icon" "󰒋")
  local color=$(get_tmux_option "@host_color" "$thm_magenta")
  local text=$(get_tmux_option "@host_text" "#H")

  local module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}
