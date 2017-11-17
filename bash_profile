if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export PATH="/opt/local/bin:$PATH"
. ~/.bashrc

# added by Anaconda2 4.4.0 installer
export PATH="/Users/grof/anaconda/bin:$PATH"

export SSH_AUTH_SOCK=/Users/grof/.yubiagent/sock
