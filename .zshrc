# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH_DISABLE_COMPFIX=true
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters
ZSH_TMUX_AUTOSTART=false
ZSH_TMUX_AUTOCONNECT=false


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  mvn
  debian
  git-extras
  sublime
  jsontools
  tmux
  vscode
  aws
  terraform
  macos
  zsh-autosuggestions
  zsh-syntax-highlighting
)
export DISABLE_UPDATE_PROMPT=true
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# slack dev menu
export SLACK_DEVELOPER_MENU=true

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"



asn() {
    whois -h http://whois.cymru.com  " -v $1"
}


# If running on Taplytics work computer, start at the bottom of the window
alias taplytics_window='tput cup "$LINES"'
alias fush='git push -f'
# Uncomment to set the prompt at the bottom of the window - used when having the terminal on the top of vertical monitors
# taplytics_window

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jamiesinn/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jamiesinn/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jamiesinn/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jamiesinn/google-cloud-sdk/completion.zsh.inc'; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


source ~/dotfiles/circleci_zsh.sh

function tap_prod() { 
    export AWS_PROFILE=prod
    export DD_API_KEY=`cat ~/.DD_API_KEY`
    export DATADOG_API_KEY=`cat ~/.DD_API_KEY`
    export DD_APP_KEY=`cat ~/.DD_APP_KEY`
    export SNOWFLAKE_USER="atlantis_user"
    export SNOWFLAKE_PRIVATE_KEY_PATH="~/.ssh/snowflake_atlantis_user_pkey"
    export SNOWFLAKE_ACCOUNT="TAPLYTICS"
    export SNOWFLAKE_REGION="AWS_US_EAST_1"
    export ROLLBAR_API_KEY=`cat ~/.ROLLBAR_API_KEY`
    export BOOTSTRAP=`cat ~/.TL_KAFKA_BOOTSTRAP`
    export ZOOKEEPER=`cat ~/.TL_KAFKA_ZOOKEEPER`
    export MONGODB_ATLAS_PRIVATE_KEY=`cat ~/.TL_ATLAS_PRIVATE_KEY`
    export MONGODB_ATLAS_PUBLIC_KEY=`cat ~/.TL_ATLAS_PUBLIC_KEY`
}

function tap_dev() {
    export AWS_PROFILE=dev
}

function dvc_prod() {
    export AWS_PROFILE=dvc-prod
    export MONGODB_ATLAS_PUBLIC_KEY=`cat ~/.MONGO_ATLAS_PUB_KEY`
    export MONGODB_ATLAS_PRIVATE_KEY=`cat ~/.MONGO_ATLAS_PRIV_KEY`
    export CLOUDFLARE_API_KEY=`cat ~/.CLOUDFLARE_API_KEY`
    export CLOUDFLARE_API_TOKEN=""
    export CLOUDFLARE_EMAIL="jamie.sinn@taplytics.com"
    export SNOWFLAKE_USER="terraform"
    export SNOWFLAKE_PRIVATE_KEY_PATH="~/.ssh/snowflake_terraform_devcycle_key"
    export SNOWFLAKE_ACCOUNT="xwnganc-devcycle"
    export POSTMAN_API_KEY=`cat ~/.POSTMAN_API_KEY`
    export DD_API_KEY=`cat ~/.DVC_DD_API_KEY` 
    export DATADOG_API_KEY=`cat ~/.DVC_DD_API_KEY` 
    export DD_APP_KEY=`cat ~/.DVC_DD_APP_KEY`
}
alias snowsql=/Applications/SnowSQL.app/Contents/MacOS/snowsql

function dvc_ops() {
    dvc
    export AWS_PROFILE=dvc-ops
}

function tec() {
    cd ~/git/tec
}

function t3() {
    cd ~/git/devcycle
}

function resetbranch() {
	 git reset $(git merge-base main $(git rev-parse --abbrev-ref HEAD)) 
}
export CF_API_TOKEN=`cat ~/.CF_WORKERS_API_TOKEN`
export CF_ACCOUNT_ID=`cat ~/.CF_ACCOUNT_ID`

export PATH="$PATH:/home/jamiesinn/go/bin"
export GITHUB_TOKEN=`cat ~/.GITHUB_TOKEN`
export GOPRIVATE=github.com/taplytics

export JIRA_API_TOKEN=`cat ~/.DVC_JIRA_API_TOKEN`

dvc_prod

# added by Snowflake SnowSQL installer v1.2
export PATH=/Users/jamiesinn/Applications/SnowSQL.app/Contents/MacOS:$PATH

# Wasmer
export WASMER_DIR="/Users/jamiesinn/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
