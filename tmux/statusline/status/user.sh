show_user() {
  local index=$1
  local icon=$(get_tmux_option "@user_icon" "")
  local color=$(get_tmux_option "@user_color" "$thm_cyan")
  local text=$(get_tmux_option "@user_text" "#(whoami)")

  local module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}
