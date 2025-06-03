function gcp
    set -l proj (ghq list | sk)
    if test $status -eq 0
        cd (ghq root)/$proj
    end
end
