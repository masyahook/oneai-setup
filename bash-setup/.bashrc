# Initialize Starship bash prompt
# eval "$(starship init bash)"

# Adding a github token, setting up keys
source /home/oneai/.env

# Aliases
alias install_screen="sudo apt update; sudo apt install screen -y"
alias install_copilot='curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null && sudo apt update && sudo apt install gh -y && gh extension install github/gh-copilot'

# Creating aliases

alias ls='ls -aF --color=auto' # colorized ls
alias lt='ls -altrh'  # ls as a table sorted by time
alias lS='ls -alhrS'  # ls as a table sorted by size
alias guide='cd /home/oneai/oneai-rnd-icd-guide'

# git-based aliases
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gs="git status"
alias gl="git pull"
alias gco='git checkout'
alias gb='git branch'
alias gnb='git checkout -b'  # create a new branch and switch to it
# condo-based aliases
alias cda='conda deactivate'
alias cdg='conda activate guide'
alias grep='grep --color'  # colorized grep

# Case-insensitive autocomplete
bind 'set completion-ignore-case on'

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

# Colorized prompt
export CLICOLOR=1
force_color_prompt=yes
OLD_PROMPT=$PS1
OLD_PS1="\[\e[1;32m\]\u@\h\[\e[00m\]:\[\e[0;33m\]\w\[\e[00m\]> "
# curl -L https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh > ~/.bash_git
source ~/.bash_git
function prompt
{
local WHITE="\[\033[1;37m\]"
local GREEN="\[\033[0;32m\]"
local CYAN="\[\033[0;36m\]"
local BLACK="\[\033[0;30m\]"
local BLUE="\[\033[0;34m\]"
local PURPLE="\[\033[0;35m\]"
export PS1="${GREEN}\u@\h ${PURPLE}\w${BLUE}"' $(__git_ps1 "(%s) ")'"${BLACK}"
}
prompt

export PATH="/home/oneai/.local/bin:$PATH"

# Github copilot setup
alias copilot='gh copilot'
alias gcs='gh copilot suggest'
alias gce='gh copilot explain'
function gss() {
    gh copilot suggest "$@" -t shell
}
function ge() {
    gh copilot explain "$@"
}
function ggs() {
    gh copilot suggest "$@" -t git
}
function gse() {
    gh copilot explain "$@" -t shell
}
function gge() {
    gh copilot explain "$@" -t git
}

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
