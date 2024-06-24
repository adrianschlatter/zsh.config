# one ssh-agent is started per zsh login session
# tmux sessions start new zshs but don't start new ssh-agents
# So we don't want to kill the ssh-agent when we exit a tmux session,
# only when we exit the zsh login session
if [ "${TMUX}" = "" ]; then
    eval $(ssh-agent -k)
fi

rbw lock
