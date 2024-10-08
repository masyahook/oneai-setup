# Initialize Starship bash prompt
# eval "$(starship init bash)"

# Adding a github token, setting up keys
source /home/oneai/.env

# Aliases
alias pred="cd /home/oneai/oneai-dda-predmod-lib"
alias install_screen="sudo apt update; sudo apt install screen -y"

# Creating aliases

alias ls='ls -F --color=auto' # colorized ls
alias lt='ls -altrh'  # ls as a table sorted by time
alias lS='ls -alhrS'  # ls as a table sorted by size

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
local GRAY="\[\033[0;37m\]"
local BLUE="\[\033[0;34m\]"
local PURPLE="\[\033[0;35m\]"
export PS1="${GREEN}\u@\h ${PURPLE}\w${BLUE}"' $(__git_ps1 "(%s) ")'"${GRAY}"
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
