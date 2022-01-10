#  ---------------------------------------------------------------------------
#
#  Description:  This file holds all my BASH configurations and aliases
#
#  Sections:
#  1.  Environment Configuration
#  2.  Make Terminal Better (remapping defaults and adding functionality)
#  3.  File and Folder Management
#  4.  Searching
#  5.  Process Management
#  6.  Networking
#  7.  System Operations & Information
#  8.  Web Development
#  9.  Reminders & Notes
#
#  ---------------------------------------------------------------------------

#   -------------------------------
#   1. ENVIRONMENT CONFIGURATION
#   -------------------------------
#   Set Default Editor (change 'Nano' to the editor of your choice)
#   ------------------------------------------------------------
    export EDITOR=/usr/bin/nvim

#   Set default blocksize for ls, df, du
#   from this: http://hints.macworld.com/comment.php?mode=view&cid=24491
#   ------------------------------------------------------------
    export BLOCKSIZE=1k

#   Ansible default path to vault password
#   --------------------------------------
    export ANSIBLE_VAULT_PASSWORD_FILE=~/.vault_password

#   Add color to terminal
#   (this is all commented out as I use Mac Terminal Profiles)
#   from http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
#   ------------------------------------------------------------
#   export CLICOLOR=1
#   export LSCOLORS=ExFxBxDxCxegedabagacad
    source ~/.prompt

#   -----------------------------
#   2. MAKE TERMINAL BETTER
#   -----------------------------
    alias ..='cd ../'                           # Go back 1 directory level
    alias c='clear'                             # c:            Clear terminal display
    alias cp='cp -iv'                           # Preferred 'cp' implementation
    alias less='less -FSRXc'                    # Preferred 'less' implementation
    alias ll='ls -FGlAhp --color=auto'          # Preferred 'ls' implementation
    alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
    alias mv='mv -iv'                           # Preferred 'mv' implementation
    alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
    alias which='type -all'                     # which:        Find executables
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
