alias dev='~/dotfiles/scripts/load-tmux-env.sh'

export EDITOR=nvim
export VISUAL=nvim

set -o vi

# Setting environment variables for C++ vcpkg - VCPKG_ROOT needs to not have a trailing slash
export VCPKG_ROOT="/home/kovski/vcpkg"
PATH="$VCPKG_ROOT:$PATH"
