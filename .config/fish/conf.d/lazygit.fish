set -l config_file $HOME/.config/lazygit/config.yml
set -l theme_file $HOME/.config/catppuccin/lazygit/themes-mergable/mocha/mauve.yml
set -gx LG_CONFIG_FILE (string join "," $config_file $theme_file)
