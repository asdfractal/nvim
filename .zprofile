VIM="nvim"
export GIT_EDITOR=$VIM

bindkey -s ^f "tmux-sessioniser\n"
bindkey -s ^e "tmux-sessioniser $HOME/monolith \n"

if [ -f ~/.env ]; then
   source ~/.env
fi

if [ -z "$SSH_AUTH_SOCK" ]; then
   # Check for a currently running instance of the agent
   RUNNING_AGENT="`ps -ax | grep 'ssh-agent -s' | grep -v grep | wc -l | tr -d '[:space:]'`"
   if [ "$RUNNING_AGENT" = "0" ]; then
        # Launch a new instance of the agent
        ssh-agent -s &> $HOME/.ssh/ssh-agent
   fi
   eval `ssh-agent -s`
fi
