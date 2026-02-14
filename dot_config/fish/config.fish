# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/tantra/miniconda3/bin/conda
    eval /Users/tantra/miniconda3/bin/conda "shell.fish" hook $argv | source
else
    if test -f "/Users/tantra/miniconda3/etc/fish/conf.d/conda.fish"
        . "/Users/tantra/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH /Users/tantra/miniconda3/bin $PATH
    end
end
# <<< conda initialize <<<

# fish_helix_key_bindings()

# VARIABLES
set -g fish_greeting ""
set -g fish_key_bindings fish_helix_key_bindings
set -g HELIX_RUNTIME "/Users/tantra/.config/helix/runtime"
set -gx EDITOR hx
set -gx VISUAL hx

#ALIAS
alias h hx
alias lg lazygit
alias op opencode
alias d clear
abbr -a vd "vd --csv-delimiter=';'"

#ALIAS CODE 
# alias m cd ~/Code/murmure/troubadour
