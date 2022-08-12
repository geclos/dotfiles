export ZPLUG_HOME=$HOME/.config/zplug
source $ZPLUG_HOME/init.zsh

zstyle :omz:plugins:ssh-agent agent-forwarding on

zplug "plugins/ssh-agent", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "plugins/history-substring-search", from:oh-my-zsh
zplug "zsh-users/zsh-completions"
zplug "plugins/git", from:oh-my-zsh
zplug "modules/history", from:prezto
zplug "modules/directory", from:prezto
zplug 'dracula/zsh', as:theme

zplug install
zplug load

source ~/.keybindings.zsh
