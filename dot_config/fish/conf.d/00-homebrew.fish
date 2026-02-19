if test -x /opt/homebrew/bin/brew
  fish_add_path -g /opt/homebrew/bin /opt/homebrew/sbin
else if test -x /usr/local/bin/brew
  fish_add_path -g /usr/local/bin /usr/local/sbin
end
