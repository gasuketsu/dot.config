function gcp
    set -l proj (ghq list | fzf)
    if test $status -eq 0
        cd (ghq root)/$proj
    end
end
