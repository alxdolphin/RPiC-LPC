# interactive check
case $- in
    *i*) ;;
    *) return;;
esac

# history settings
export HISTCONTROL=ignoreboth
export HISTSIZE=5000
export HISTFILESIZE=10000
export HISTTIMEFORMAT="%F %T "
shopt -s histappend
shopt -s checkwinsize

# terminal colors and prompt setup
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    PS1='\[\033[01;32m\]\u@\h \[\033[01;34m\][\w]\[\033[00m\]\n\$ '
else
    PS1='\u@\h:\w\$ '
fi

# welcome banner and system info
echo -e "\e[1;34m"
cat << "EOF"
____________ _ _____            _     ______  _____ 
| ___ \ ___ (_)  __ \          | |    | ___ \/  __ \
| |_/ / |_/ /_| /  \/  ______  | |    | |_/ /| /  \/
|    /|  __/| | |     |______| | |    |  __/ | |    
| |\ \| |   | | \__/\          | |____| |    | \__/\
\_| \_\_|   |_|\____/          \_____/\_|     \____/
                                                    
EOF
echo -e "\e[0m"

# system status display
echo -e "\e[1;36mRPIC-HEAD Login\e[0m"
echo "--------------------------------------------------------------------------------"
echo -e "\e[1;33mHostname:\e[0m      $(hostname)"
echo -e "\e[1;33mSystem Load:\e[0m   $(uptime | awk -F'load average:' '{ print $2 }')"
echo -e "\e[1;33mMemory Usage:\e[0m  $(free -h | awk '/^Mem:/ {print $3 "/" $2}')"
echo -e "\e[1;33mCPU Usage:\e[0m     $(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')%"
echo "--------------------------------------------------------------------------------"

# shared user warning
echo -e "\e[1;31mIMPORTANT:\e[0m This is a SHARED login user. \e[1;31mDO NOT\e[0m submit jobs from this account."
echo -e "           Please \e[1;36msu - <your_username>\e[0m before submitting jobs to the cluster."
echo "--------------------------------------------------------------------------------"
echo

# environment modules
[ -f /etc/profile.d/modules.sh ] && source /etc/profile.d/modules.sh

# color support for common commands
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# common aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias vi='vim'
alias watch='watch --color'
alias usedmem="free -mh"
alias usedcpu="top -bn1 | grep 'Cpu(s)'"

# hpc safety aliases
alias qstat='echo "ERROR: Please switch to your own user (su - <username>) before running qstat."'
alias qinfo='echo "ERROR: Please switch to your own user (su - <username>) before running qinfo."'
alias myq='echo "ERROR: Please switch to your own user (su - <username>) before running myq."'

# environment variables
export EDITOR=nano
export SHELL=/bin/bash
export PATH=/usr/bin:/bin

# bash completion
[ -f /usr/share/bash-completion/bash_completion ] && source /usr/share/bash-completion/bash_completion