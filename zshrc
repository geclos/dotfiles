#   -------------------------------
#   1. ENVIRONMENT CONFIGURATION
#   -------------------------------
#   Set Default Editor (change 'Nano' to the editor of your choice)
#   ------------------------------------------------------------
export EDITOR=/usr/bin/vim

#   -----------------------------
#   2. MAKE TERMINAL BETTER
#   -----------------------------

alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp --color=auto'          # Preferred 'ls' implementation
alias ls="ls --color --classify"
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias edit='subl'                           # edit:         Opens any file in sublime editor
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias which='type -all'                     # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop
alias be='bundle exec'
alias gp='git push'
alias gc='git commit -a'
alias gw="git add --all . && git commit -m 'WIP'"
alias gs='git status'
alias gg='git grep'
alias gd='git diff'
alias ga='git add --all . && git ci --amend'
alias grc='git rebase --continue'
alias gpl='git pull --rebase'
alias breset='bundle exec rake db:drop && bundle exec rake db:create && bundle exec rake db:schema:load && bundle exec rake db:seed'
alias migrate='bundle exec rake db:migrate'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Perform parameter expansion, command substitution and arithmetic expansion in
# prompts.
setopt PROMPT_SUBST

# If a command is issued that can’t be executed as a normal command, and the
# command is the name of a directory, perform the cd command to that directory.
setopt AUTO_CD

# Don't beep on error in ZLE.
setopt NO_BEEP

# If unset, the cursor would be set to the end of the word if completion is
# started. Instead, it stays where it is, and completion is done from both
# ends.
setopt COMPLETE_IN_WORD

# Zsh sessions will append their history list to the history file, rather than
# replace it. Thus, multiple parallel zsh sessions will all have the new
# entries from their history lists added to the history file, in the order that
# they exit.
setopt APPEND_HISTORY

# save more history than default
HISTSIZE=50000
SAVEHIST=50000
HISTFILE="$HOME/.local/share/zsh/.zsh_history"
mkdir -p "$(dirname "${HISTFILE}")"

# better locking when writing out history file
setopt HIST_FCNTL_LOCK
# don't write multiple history entries if the same command is run multiple
# times in sequence
setopt HIST_IGNORE_DUPS
# don't write history entries when the first character of the command is space
setopt HIST_IGNORE_SPACE
# we set the history size quite large so don't have to worry about this
unsetopt HIST_EXPIRE_DUPS_FIRST

# Show a highlighted '%' when the final line of output lacks a trailing
# newline. Without this, the prompt overdraws that final line.
setopt PROMPT_SP

# Automatically `pushd` when changing directory. `popd` (aliased to `-`)
# returns to the previous directory on the stack.
setopt AUTO_PUSHD

# If set, perform implicit tees or cats when multiple redirections are
# attempted.
#
# People don't generally use this feature and it causes some weird unexpected
# behaviour in edge cases.
unsetopt MULTIOS

autoload -U compinit && compinit
# use LS_COLORS for tab-completing files
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

autoload -Uz vcs_info
precmd_functions+=( vcs_info )
zstyle ':vcs_info:*' enable git
# `formats` is used most of the time; `actionformats` is used when in the
# middle of a rebase, or things like that.
#
# Show the branch name (%b) in blue, followed by any
# additional miscellaneous (%m) info that the git
# driver provides in yellow. Typically %m will be empty.
zstyle ':vcs_info:git:*' formats $'%F{blue}%b%F{yellow}%m%{\x1b[0m%} '
# When in a rebase, etc., the format includes square brackets at the end with
# "current state" (%a) information and the miscellaneous (%m) info (which is
# typically set during these states)
zstyle ':vcs_info:git:*' actionformats $'%F{blue}%b%F{grey}%u%c %F{grey}[%F{yellow}%a %m%F{grey}]%{\x1b[0m%} '

state_color="\033[38;5;33m"
PROMPT=$'%(?.%{$(echo $state_color)%}꩜ .%F{red}✗%?)%f %B%~%b $vcs_info_msg_0_%(!.%F{red}#.%{\x1b[1;38;5;33m%}%%)%{\x1b[0m%} '
