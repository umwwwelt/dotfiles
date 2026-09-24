fish_add_path -g $HOME/.local/bin

# Go
fish_add_path -g $HOME/go/bin

# Cargo
fish_add_path -g $HOME/.cargo/bin

# npm global (si utilisé)
fish_add_path -g $HOME/.npm-global/bin


# pnpm >= 11 : binaires globaux dans PNPM_HOME/bin
fish_add_path -g $HOME/Library/pnpm/bin

#bun
fish_add_path -g "$HOME/.bun/bin"
