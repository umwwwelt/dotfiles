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

    set -l best ""
    set -l best_ts 0
    for dir in "$base/$argv[1]"*/
        test -d "$dir" || continue
        set -l ts (git -C "$dir" log -1 --format="%ct" 2>/dev/null)
        test -z "$ts" && set ts 0
        if test "$ts" -gt "$best_ts"
            set best_ts "$ts"
            set best "$dir"
        end
    end
    if test -n "$best"
        cd "$best"
        return $status
    end

    echo "m: not found: $target"
    return 1
end
