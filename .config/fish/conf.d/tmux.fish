abbr -a t tmux

if status is-interactive
    and not set -q TMUX
    exec tmux new -As0
end
clear
