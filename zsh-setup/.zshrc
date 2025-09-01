#################################
########### OH-MY-ZSH ###########
#################################

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git 
	starship
	poetry 
	copyfile 
	sudo 
	copypath 
	gh 
	pip 
	web-search 
	zsh-syntax-highlighting 
	zsh-autosuggestions
    virtualenv
    uv
)
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#################################
########### Personal ############
#################################

# Setting up keys
source ~/.env

# Creating aliases
# eza aliases (replacement for ls)
alias ls='eza -1 --icons --group-directories-first'  # VS Code-like list
alias lr='eza -1 --tree --icons --group-directories-first --level=2'  # VS Code-like list + recursive tree up to level 2
alias lr2='eza -1 --tree --icons --group-directories-first --level=2'  # VS Code-like list + recursive tree up to level 2
alias lr3='eza -1 --tree --icons --group-directories-first --level=3'  # VS Code-like list + recursive tree up to level 3
alias lre='eza -1 --tree --icons --group-directories-first --level=2'  # VS Code-like list + recursive tree up to end
alias ll='eza -lha --icons --octal-permissions --group-directories-first --git'  # VS Code-like long list
alias lt='eza -lha --sort=modified --icons --git'  # long list but sorted by modified time
alias la="eza -lha --group"  # long list, show groups
# ls-based aliases
# alias ls='ls -F --color=auto' # colorized ls
# alias lt='ls -altrh'  # ls as a table sorted by time
# alias lS='ls -alhrS'  # ls as a table sorted by size
# git-based aliases
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gpnw="git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)"
alias gs="git status"
alias gl="git pull"
alias gco='git checkout'
alias gb='git branch'
alias gnb='git checkout -b'  # create a new branch and switch to it
# condo-based aliases
alias cda='conda deactivate'
alias cdg='conda activate guide'
alias cdp='conda activate predmod'
alias cdt='conda activate tol_env'
# venv-based aliases
alias sup='source .venv/bin/activate' 

# grep
alias grep='grep --color'  # colorized grep

# quick cd
alias guide='cd /home/oneai/oneai-rnd-icd-guide'
alias ast="cd /home/oneai/oneai-rnd-icd-asthma"
alias tol='cd /home/oneai/oneai-rnd-icd-tolebrutinib'
alias embi="cd /home/oneai/oneai-rnd-icd-kgembeddings_ie_criteria"
alias e2i="cd /home/oneai/oneai-rnd-portai-e2i"

# git
alias glast='git reflog | grep -o "checkout: moving from [^ ]* to [^ ]*" | awk "{print \$NF}" | awk "!seen[\$0]++" | head -n 5'

# Auto-completion
# fpath+=~/.zfunc
# autoload -Uz compinit && compinit
# compinit
# zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
# zstyle ':completion:*' menu select

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/conda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/conda/etc/profile.d/conda.sh" ]; then
        . "/opt/conda/etc/profile.d/conda.sh"
    else
        export PATH="/opt/conda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Turn off indicating conda environment in parenthese, e.g. (base)
conda config --set changeps1 False

# Getting starship prompt
eval "$(starship init zsh)"

# Dealing with SSL certificate that crashes conda sometimes
# conda config --set ssl_verify false

# Copilot
alias copilot='gh copilot'
alias gcs='gh copilot suggest'
alias gce='gh copilot explain'
function cop() {
    gh copilot suggest "$@" -t shell
}
function ge() {
    gh copilot explain "$@"    
}
function ggs() {
    gh copilot suggest "$@" -t git
}

# Enable mcfly
# eval "$(mcfly init zsh)"

. "$HOME/.local/bin/env"

# Function to set environment variables for the feature environment
pfeat() {
    export PGHOST=$PGHOST_DEV
    export PGUSER=$PGUSER_DEV
    export PGPASSWORD=$PGPASSWORD_DEV
    export PGDATABASE=$PGDATABASE_DEV
    export PGPORT=$PGPORT_DEV
    export PGENV="feat"

    export RWE_SOC_DATABASE_CONNECTION_STRING="postgresql+psycopg2://$PGUSER:$PGPASSWORD@$PGHOST:$PGPORT/$PGDATABASE"
    export RWE_SOC_SCHEMA="soc_$PGENV"

    echo "Environment set to feat"
    echo "RWE_SOC_DATABASE_CONNECTION_STRING=$RWE_SOC_DATABASE_CONNECTION_STRING"
    echo "RWE_SOC_SCHEMA=$RWE_SOC_SCHEMA"
}

pdev() {
    export PGHOST=$PGHOST_DEV
    export PGUSER=$PGUSER_DEV
    export PGPASSWORD=$PGPASSWORD_DEV
    export PGDATABASE=$PGDATABASE_DEV
    export PGPORT=$PGPORT_DEV
    export PGENV="dev"

    export RWE_SOC_DATABASE_CONNECTION_STRING="postgresql+psycopg2://$PGUSER:$PGPASSWORD@$PGHOST:$PGPORT/$PGDATABASE"
    export RWE_SOC_SCHEMA="soc_$PGENV"

    echo "Environment set to dev"
    echo "RWE_SOC_DATABASE_CONNECTION_STRING=$RWE_SOC_DATABASE_CONNECTION_STRING"
    echo "RWE_SOC_SCHEMA=$RWE_SOC_SCHEMA"
}

# Function to set environment variables for the uat environment
puat() {
    export PGHOST=$PGHOST_UAT
    export PGUSER=$PGUSER_UAT
    export PGPASSWORD=$PGPASSWORD_UAT
    export PGDATABASE=$PGDATABASE_UAT
    export PGPORT=$PGPORT_UAT
    export PGENV="uat"

    export RWE_SOC_DATABASE_CONNECTION_STRING="postgresql+psycopg2://$PGUSER:$PGPASSWORD@$PGHOST:$PGPORT/$PGDATABASE"
    export RWE_SOC_SCHEMA="soc_$PGENV"

    echo "Environment set to uat"
    echo "RWE_SOC_DATABASE_CONNECTION_STRING=$RWE_SOC_DATABASE_CONNECTION_STRING"
    echo "RWE_SOC_SCHEMA=$RWE_SOC_SCHEMA"
}

# Function to set environment variables for the prod environment
pprod() {
    export PGHOST=$PGHOST_PROD
    export PGUSER=$PGUSER_PROD
    export PGPASSWORD=$PGPASSWORD_PROD
    export PGDATABASE=$PGDATABASE_PROD
    export PGPORT=$PGPORT_PROD
    export PGENV="prod"

    export RWE_SOC_DATABASE_CONNECTION_STRING="postgresql+psycopg2://$PGUSER:$PGPASSWORD@$PGHOST:$PGPORT/$PGDATABASE"
    export RWE_SOC_SCHEMA="soc_$PGENV"

    echo "Environment set to prod"
    echo "RWE_SOC_DATABASE_CONNECTION_STRING=$RWE_SOC_DATABASE_CONNECTION_STRING"
    echo "RWE_SOC_SCHEMA=$RWE_SOC_SCHEMA"
}

# Function to set MM Snowflake variables
mmsf() {
    export SF_SCHEMA=$MM_SF_SCHEMA
    export SF_PASSWORD=$MM_SF_PASSWORD
    export SF_USER=$MM_SF_USER
    export SF_WAREHOUSE=$MM_SF_WAREHOUSE
    export SF_ACCOUNT_PYSPARK=$MM_SF_ACCOUNT_PYSPARK
    export SF_DATABASE=$MM_SF_DATABASE

    echo "MM Snowflake environment set"
    echo "SF_SCHEMA=$SF_SCHEMA"
    echo "SF_PASSWORD=$SF_PASSWORD"
    echo "SF_USER=$SF_USER"
    echo "SF_WAREHOUSE=$SF_WAREHOUSE"
    echo "SF_ACCOUNT_PYSPARK=$SF_ACCOUNT_PYSPARK"
    echo "SF_DATABASE=$SF_DATABASE"
}

# Function to set OM1-HS Snowflake variables
om1hssf() {
    export SF_SCHEMA=$OM1HS_SF_SCHEMA

    export SF_BASE64_KEY=$GUIDE_AMER_SF_BASE64_KEY
    export SF_PASSPHRASE=$GUIDE_AMER_SF_PASSPHRASE
    export SF_ACCOUNT=$GUIDE_AMER_SF_ACCOUNT

    export SF_WAREHOUSE=$GUIDE_AMER_SF_WAREHOUSE
    export SF_DATABASE=$GUIDE_AMER_SF_DATABASE
    export SF_USER=$GUIDE_AMER_SF_USER
    export SF_ROLE=$GUIDE_AMER_SF_ROLE

    echo "OM1-HS Snowflake environment set"
    echo "SF_SCHEMA=$SF_SCHEMA"
    echo "SF_BASE64_KEY=$SF_BASE64_KEY"
    echo "SF_PASSPHRASE=$SF_PASSPHRASE"
    echo "SF_ACCOUNT=$SF_ACCOUNT"
    echo "SF_WAREHOUSE=$SF_WAREHOUSE"
    echo "SF_DATABASE=$SF_DATABASE"
    echo "SF_USER=$SF_USER"
    echo "SF_ROLE=$SF_ROLE"
}

# Function to set OM1-Acne snowflake variables
om1acnesf() {
    export SF_SCHEMA=$OM1ACNE_SF_SCHEMA

    export SF_BASE64_KEY=$GUIDE_AMER_SF_BASE64_KEY
    export SF_PASSPHRASE=$GUIDE_AMER_SF_PASSPHRASE
    export SF_ACCOUNT=$GUIDE_AMER_SF_ACCOUNT

    export SF_WAREHOUSE=$GUIDE_AMER_SF_WAREHOUSE
    export SF_DATABASE=$GUIDE_AMER_SF_DATABASE
    export SF_USER=$GUIDE_AMER_SF_USER
    export SF_ROLE=$GUIDE_AMER_SF_ROLE

    echo "OM1-Acne Snowflake environment set"
    echo "SF_SCHEMA=$SF_SCHEMA"
    echo "SF_BASE64_KEY=$SF_BASE64_KEY"
    echo "SF_PASSPHRASE=$SF_PASSPHRASE"
    echo "SF_ACCOUNT=$SF_ACCOUNT"
    echo "SF_WAREHOUSE=$SF_WAREHOUSE"
    echo "SF_DATABASE=$SF_DATABASE"
    echo "SF_USER=$SF_USER"
    echo "SF_ROLE=$SF_ROLE"
}

# Function to set Verana Snowflake variables
veranasf() {
    export SF_SCHEMA=$VERANA_SF_SCHEMA

    export SF_BASE64_KEY=$GUIDE_AMER_SF_BASE64_KEY
    export SF_PASSPHRASE=$GUIDE_AMER_SF_PASSPHRASE
    export SF_ACCOUNT=$GUIDE_AMER_SF_ACCOUNT

    export SF_WAREHOUSE=$GUIDE_AMER_SF_WAREHOUSE
    export SF_DATABASE=$GUIDE_AMER_SF_DATABASE
    export SF_USER=$GUIDE_AMER_SF_USER
    export SF_ROLE=$GUIDE_AMER_SF_ROLE

    echo "Verana Snowflake environment set"
    echo "SF_SCHEMA=$SF_SCHEMA"
    echo "SF_BASE64_KEY=$SF_BASE64_KEY"
    echo "SF_PASSPHRASE=$SF_PASSPHRASE"
    echo "SF_ACCOUNT=$SF_ACCOUNT"
    echo "SF_WAREHOUSE=$SF_WAREHOUSE"
    echo "SF_DATABASE=$SF_DATABASE"
    echo "SF_USER=$SF_USER"
    echo "SF_ROLE=$SF_ROLE"
}

# Function to set TrinetX Snowflake variables
trinetxsf() {
    export SF_SCHEMA=$TRINETX_SF_SCHEMA

    export SF_BASE64_KEY=$GUIDE_AMER_SF_BASE64_KEY
    export SF_PASSPHRASE=$GUIDE_AMER_SF_PASSPHRASE
    export SF_ACCOUNT=$GUIDE_AMER_SF_ACCOUNT

    export SF_WAREHOUSE=$GUIDE_AMER_SF_WAREHOUSE
    export SF_DATABASE=$GUIDE_AMER_SF_DATABASE
    export SF_USER=$GUIDE_AMER_SF_USER
    export SF_ROLE=$GUIDE_AMER_SF_ROLE

    echo "TrinetX Snowflake environment set"
    echo "SF_SCHEMA=$SF_SCHEMA"
    echo "SF_BASE64_KEY=$SF_BASE64_KEY"
    echo "SF_PASSPHRASE=$SF_PASSPHRASE"
    echo "SF_ACCOUNT=$SF_ACCOUNT"
    echo "SF_WAREHOUSE=$SF_WAREHOUSE"
    echo "SF_DATABASE=$SF_DATABASE"
    echo "SF_USER=$SF_USER"
    echo "SF_ROLE=$SF_ROLE"
}

# Function to set CCT SF keys
cctsf() {
    export SF_SCHEMA=$CONTROLTOWER_SF_SCHEMA

    export SF_BASE64_KEY=$EMEA_RND_SF_BASE64_KEY
    export SF_PASSPHRASE=$EMEA_RND_SF_PASSPHRASE
    export SF_ACCOUNT=$EMEA_RND_SF_ACCOUNT

    export SF_WAREHOUSE=$EMEA_RND_SF_WAREHOUSE
    export SF_DATABASE=$EMEA_RND_SF_DATABASE
    export SF_USER=$EMEA_RND_SF_USER
    export SF_ROLE=$EMEA_RND_SF_ROLE

    echo "TrinetX Snowflake environment set"
    echo "SF_SCHEMA=$SF_SCHEMA"
    echo "SF_BASE64_KEY=$SF_BASE64_KEY"
    echo "SF_PASSPHRASE=$SF_PASSPHRASE"
    echo "SF_ACCOUNT=$SF_ACCOUNT"
    echo "SF_WAREHOUSE=$SF_WAREHOUSE"
    echo "SF_DATABASE=$SF_DATABASE"
    echo "SF_USER=$SF_USER"
    echo "SF_ROLE=$SF_ROLE"
}

metaup() {
    if [ $# -eq 0 ]; then
        echo "Usage: metaup <disease_name>"
        echo "Example: metaup mm"
        echo "Example: metaup namd"
        return 1
    fi
    
    local disease_name="$1"
    
    echo "Running command:"
    echo "PYTHONPATH=. poetry run python src/pipelines/de/metadata_to_rds.py run --disease_name $disease_name --disease_metadata_path resources/metadata/metadata_${disease_name}_combined_for_app.xlsx"
    echo ""
    
    PYTHONPATH=. python -m poetry run python src/pipelines/de/metadata_to_rds.py run \
        --disease_name "$disease_name" \
        --disease_metadata_path "resources/metadata/metadata_${disease_name}_combined_for_app.xlsx"
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
