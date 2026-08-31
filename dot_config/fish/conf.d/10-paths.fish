fish_add_path -g $HOME/.local/bin

# Go
fish_add_path -g $HOME/go/bin

# Cargo
fish_add_path -g $HOME/.cargo/bin

# npm global (si utilisé)
fish_add_path -g $HOME/.npm-global/bin

# nvm : version épinglée, ignorée si elle n'est plus installée
set -l nvm_node $HOME/.nvm/versions/node/v22.14.0/bin
test -d $nvm_node && fish_add_path -g $nvm_node

# pnpm (les binaires globaux sont directement dans PNPM_HOME)
fish_add_path -g $HOME/Library/pnpm

#bun
fish_add_path -g "$HOME/.bun/bin"
