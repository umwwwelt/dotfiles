function m --description "cd to ~/code/murmure"
    set -l base "$HOME/code/murmure"
    if test (count $argv) -eq 0
        cd "$base"
        return $status
    end

    if test (count $argv) -gt 1
        echo "m: one subfolder only"
        return 1
    end

    set -l target "$base/$argv[1]"
    if test -d "$target"
        cd "$target"
        return $status
    end

    echo "m: not found: $target"
    return 1
end
