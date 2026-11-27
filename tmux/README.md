Statusline is the edited version of https://github.com/omerxx/catppuccin-tmux/tree/main

General setup is based on https://github.com/omerxx/dotfiles/tree/master/tmux

> [!important] **Manual step for plugins:** Make sure you create a plugins folder in `~/dotfiles/tmux/plugins/`, and clone tpm into it before installing any other plugins. Follow the instructions on the [tpm gh repo page](https://github.com/tmux-plugins/tpm). The reason this must be done is because the plugins folder is in the .gitignore file for this repo. Because each plugin is a clone of another gh repo, this step is taken to prevent those git repos from living inside this one - this way, they're cloned locally using the `tmux.conf` file, for each plugin that's referenced in there.
>
> **Note:** The instructions on the [tpm gh repo page](https://github.com/tmux-plugins/tpm) page will reference `~/.tmux/` for everything - we want to do everything in `~/dotfiles/tmux`, since that's symlinked to `~/.config/tmux`, which is the standard config directory for most things that live in the dotfiles. So tpm folder, for example, should be cloned inato `~/dotfiles/tmux/plugins/`.
