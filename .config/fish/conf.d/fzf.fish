bind \cr __fzf_history
bind \ch __fzf_tldr
bind \ct __fzf_files

set -gx FZF_DEFAULT_COMMAND 'fd --strip-cwd-prefix'
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
