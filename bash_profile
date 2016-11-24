if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export PATH="/opt/local/bin:$PATH"
. ~/.bashrc

