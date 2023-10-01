function gcp
    set -l proj (ghq list | peco)
    if $proj != ""
        cd (ghq root)/$proj
    end
end
