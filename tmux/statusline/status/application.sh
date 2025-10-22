show_application() {
  local index=$1
  local icon=$(get_tmux_option "@application_icon" "")
  local color=$(get_tmux_option "@application_color" "$thm_pink")
  local text=$(get_tmux_option "@application_text" "#W")

  local module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}
