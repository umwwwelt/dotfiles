fish_add_path -g $HOME/.local/bin

# Go
fish_add_path -g $HOME/go/bin

# Cargo
fish_add_path -g $HOME/.cargo/bin

# npm global (si utilisé)
fish_add_path -g $HOME/.npm-global/bin


# pnpm (les binaires globaux sont directement dans PNPM_HOME)
fish_add_path -g $HOME/Library/pnpm

#bun
fish_add_path -g "$HOME/.bun/bin"
