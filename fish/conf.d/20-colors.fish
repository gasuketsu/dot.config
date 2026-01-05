#!/usr/bin/fish

set -l foreground DCD7BA normal
set -l selection 2D4F67 brcyan
set -l comment 54546D brblack
set -l red C34043 red
set -l orange FF9E64 brred
set -l yellow C0A36E yellow
set -l green 76946A green
set -l purple 957FB8 magenta
set -l cyan 7AA89F cyan
set -l pink D27E99 brmagenta

# Syntax Highlighting Colors
set fish_color_normal $foreground
set fish_color_command $foreground --bold
set fish_color_keyword $pink
set fish_color_quote $green
set fish_color_redirection $cyan
set fish_color_end $orange
set fish_color_error $red
set fish_color_param $purple
set fish_color_comment $comment
set fish_color_selection --background=$selection
set fish_color_search_match --background=$selection
set fish_color_operator $yellow
set fish_color_escape $pink
set fish_color_autosuggestion $comment

# Completion Pager Colors
set fish_pager_color_progress $comment
set fish_pager_color_prefix $cyan
set fish_pager_color_completion $foreground
set fish_pager_color_description $comment
