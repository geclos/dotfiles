export ZPLUG_HOME=$HOME/.config/zplug
source $ZPLUG_HOME/init.zsh

zplug "modules/directory", from:prezto
zplug "modules/history", from:prezto
zplug "plugins/history-substring-search", from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "xylous/gitstatus"

zplug load

source ~/.keybindings.zsh

# fnm
export PATH="/Users/gerardclos/Library/Application Support/fnm:$PATH"
eval "`fnm env`"

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

# Changed the prompt to show the current directory and the git status
setopt PROMPT_SUBST
PROMPT='%F{blue}%~%F{default} $(gitstatus -i)🐵 '
