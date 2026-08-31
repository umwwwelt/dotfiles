# Lazy conda init to speed up fish startup.
function conda
    if test -f $HOME/miniconda3/bin/conda
        eval $HOME/miniconda3/bin/conda "shell.fish" hook $argv | source
    else if test -f "$HOME/miniconda3/etc/fish/conf.d/conda.fish"
        source "$HOME/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH $HOME/miniconda3/bin $PATH
    end
    functions -e conda
    conda $argv
end

# fish_helix_key_bindings()

# VARIABLES
set -g fish_greeting ""
# set -g fish_key_bindings fish_helix_key_bindings
set -g HELIX_RUNTIME "$HOME/.config/helix/runtime"
set -gx EDITOR hx
set -gx VISUAL hx

set -gx XDG_CONFIG_HOME "$HOME/.config"

# PUPPETEER
set -gx PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
# `type -q` est un builtin : pas de fork si chromium est absent.
if type -q chromium
    set -gx PUPPETEER_EXECUTABLE_PATH (command -v chromium)
end

#ALIAS
alias h hx
alias lg lazygit
alias op opencode
alias d clear
abbr -a vd "vd --csv-delimiter=';'"

#ALIAS CODE 
# alias m cd ~/Code/murmure/troubadour

# pnpm (le PATH est géré par conf.d/10-paths.fish)
set -gx PNPM_HOME "$HOME/Library/pnpm"
