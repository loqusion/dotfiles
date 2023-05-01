bind \cr __fzf_history
bind \ch __fzf_tldr
bind \ct __fzf_files

set -gx FZF_DEFAULT_COMMAND 'fd --strip-cwd-prefix'
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -Ux FZF_DEFAULT_OPTS "--cycle --layout=reverse --border --height 90% --preview-window=right:70% \
    --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
    --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
    --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
