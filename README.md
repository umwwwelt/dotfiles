```bash
xcode-select --install

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" eval "$(/opt/homebrew/bin/brew shellenv)"

# chezmoi
brew install chezmoi

chezmoi init https://github.com/umwwwelt/dotfiles.git 
chezmoi apply

# Bundle brew
brew bundle --file ~/.Brewfile

# Dashlane
dcli sync

# sshkey
ssh-keygen -t ed25519 -C "blabla@mail.com"

# Ajouter fish aux shells autorisés :
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
# Changer le shell par défaut :
chsh -s /opt/homebrew/bin/fish

# Helix (forked)
git clone git@github.com:gj1118/helix.git ~/code/helix

cargo install --path helix-term --locked
cp -R runtime ~/.config/helix/
hx -g fetch
hx -g build

#LSP
pnpm add -g typescript-language-server vscode-langservers-extracted svelte-language-server prettier stylelint-lsp

pipx install ruff
pipx install ty
pipx install jedi-language-server

cargo install --locked --git https://github.com/estin/simple-completion-language-server.git
```
