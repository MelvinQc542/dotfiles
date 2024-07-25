echo "Configuring the user's profile (.zprofile)"

# **BEGIN PowerLevel 10k
#
# typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
# typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#
# **END PowerLevel 10k

# **BEGIN Oh My Zsh
#
# Change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)
#source $ZSH/oh-my-zsh.sh
#
# **END Oh My Zsh

# Pour HomeBrew (Apple)
#eval "$(/usr/local/bin/brew shellenv)"

# 1Password shell completion (Apple)
#eval "$(op completion zsh)"; compdef _op op

# Oh My Posh initialization
eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/base.toml)"
# Initializing zoxide
eval "$(zoxide init --cmd cd zsh)"

# Options found on "Dreams of autonomy" YT video 2024-05-16
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Oh My Zsh aliases for productivity
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# My aliases
alias 1p='open -a 1Password'
alias copilot='open -a Microsoft\ Edge https://copilot.microsoft.com'
alias edge='open -a Microsoft\ Edge'
alias fdt='open -a Microsoft\ Excel ~/docs/2aires/gesTI.ca/2.\ Aires/2.1\ Gestion\ \&\ Administration/2.1a\ Comptabilité/Feuilles\ de\ temps\ 2024/Outils\ 2024.xlsx'
alias fzf='fzf --preview="bat --color=always {}"'
# Next alias - for only 1 file instead of many (use tab)
#alias ivi='vi $(fzf --preview="bat --color=always {}")'
alias ivi='vi $(fzf -m --preview="bat --color=always {}")'
alias lock='clear && open -a ScreenSaverEngine'
alias mail='open -a Mail'
alias outlook='open -a Microsoft\ Outlook'
alias safari='open -a Safari'
alias textedit='open -a TextEdit'
alias vi='nvim'
alias vimtutor='vi -c Tutor'
alias word='open -a Microsoft\ Word'
alias z='zoxide'
alias zedit='zoxide edit'
alias zls='zoxide query -ls'
