#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
export PATH="$HOME/.local/bin:$PATH"
export PATH="<path>:$PATH"
eval "$(starship init bash)"

alias lg='lazygit'
alias lzd='lazydocker'
alias gst='git status'
alias vim='nvim'
alias start-postgres='sudo systemctl start postgresql'
alias status-postgres='sudo systemctl status postgresql'
alias stop-postgres='sudo systemctl stop postgresql'
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
