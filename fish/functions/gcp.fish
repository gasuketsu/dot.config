function gcp
    set -l proj (ghq list | peco)
    if test "$proj" != ""
        cd (ghq root)/$proj
    end
end
