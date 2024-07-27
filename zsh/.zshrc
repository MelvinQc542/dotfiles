export ZSH="$HOME/.oh-my-zsh" # Path to your Oh My Zsh installation.

# ZSH_THEME="robbyrussell" # See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="%F{red}...%f"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# HIST_STAMPS="mm/dd/yyyy"
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(git) # Standard plugins can be found in $ZSH/plugins/
source $ZSH/oh-my-zsh.sh
source ~/.zshrc.pre-oh-my-zsh
