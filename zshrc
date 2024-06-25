export ZPLUG_HOME=$HOME/.config/zplug
source $ZPLUG_HOME/init.zsh

# Plugins
zplug "modules/directory", from:prezto
zplug "modules/history", from:prezto
zplug "plugins/history-substring-search", from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "xylous/gitstatus"
zplug "spaceship-prompt/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

zplug load

# OpenAI
export OPENAI_API_KEY="sk-TRY_SCRAPPING_THIS"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# pnpm
export PNPM_HOME="/Users/gerardclos/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

#   -----------------------------
#   KEYBINDINGS
#   -----------------------------
# General
alias ..='cd ../'                           # Go back 1 directory level
alias c='clear'                             # c:            Clear terminal display
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias ll='ls -FGlAhp --color=auto'          # Preferred 'ls' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias ~="cd ~"                              # ~:            Go Home

# Bundle
alias be='bundle exec'

# Git
alias ga='git add --all . && git ci --amend'
alias gc='git commit -a'
alias gd='git diff'
alias gg='git grep'
alias gp='git push'
alias gpl='git pull --rebase'
alias grc='git rebase --continue'
alias gs='git status'
alias gw="git add --all . && git commit -m 'WIP'"

# Docker compose
alias dc='docker-compose'
alias de='docker-compose exec'
alias dr='docker-compose run'
alias ds='docker-compose stop'
alias du='docker-compose run'

# Remap vim to nvim
alias vim='nvim'

# Remap gi to git
alias gi='git'

# Mise https://github.com/jdx/mise
eval "$(/Users/gerardclos/.local/bin/mise activate zsh)"

# autosuggest-accept widget to shift+tab
bindkey '^[[Z' autosuggest-accept

