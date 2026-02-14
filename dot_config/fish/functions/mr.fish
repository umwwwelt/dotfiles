function mr
    set -l remote (git remote get-url origin)
    set -l branch (git branch --show-current)
    set -l url (echo $remote | sed 's|git@||; s|:|/|; s|\.git$||')
    set -l host (echo $url | cut -d'/' -f1)
    set -l path (echo $url | cut -d'/' -f2-)

    open "https://$host/$path/-/merge_requests?source_branch=$branch"
end
