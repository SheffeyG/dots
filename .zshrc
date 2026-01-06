#-----------------------
# General
#-----------------------

# if tty or not running interactively, don't do anything
[[ $- != *i* || "$TTY" =~ ^/dev/tty[0-9]+$ ]] && return

# setting zsh prompt right padding
ZLE_RPROMPT_INDENT=${ZLE_RPROMPT_INDENT:-0}

# prompt theme
# eval "$(starship init zsh)"
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# setup global pnpm path
export PNPM_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/pnpm"
[[ -d "${PNPM_HOME}" ]] && path+=("${PNPM_HOME}")

# conda initialization
# https://repo.anaconda.com/miniconda
[[ -d "$HOME/anaconda3" ]] && CONDA_HOME="$HOME/anaconda3/"
[[ -d "$HOME/miniconda3" ]] && CONDA_HOME="$HOME/miniconda3/"
[[ -s "$CONDA_HOME/etc/profile.d/conda.sh" ]] && source "$CONDA_HOME/etc/profile.d/conda.sh"

# custom path
[[ -d "${HOME}/.local/bin" ]] && path+=("${HOME}/.local/bin")
[[ -d "${HOME}/.cargo/bin" ]] && path+=("${HOME}/.cargo/bin")

typeset -U path

# autovenv for python
venv() {
    if [[ -z "$VIRTUAL_ENV" ]]; then
        venv_dir='.venv'
        [[ -d "$venv_dir" ]] && source "$venv_dir/bin/activate"
    else
        parent_dir="$(dirname "$VIRTUAL_ENV")"
        [[ "$PWD"/ != "$parent_dir"/* ]] && deactivate
    fi
}
autoload -U add-zsh-hook
add-zsh-hook chpwd venv
venv # activate venv while initialization

#-----------------------
# Plugins
#-----------------------

# zinit initialization
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [[ ! -d $ZINIT_HOME ]]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone --depth=1 https://github.com/zdharma-continuum/zinit.git $ZINIT_HOME
fi
source "${ZINIT_HOME}/zinit.zsh"

ZINIT[COMPINIT_OPTS]=-C # skip safe check for speed up
ZINIT[ZCOMPDUMP_PATH]="${XDG_CACHE_HOME:-$HOME/.cache}"

# p10k theme
zinit ice depth="1"
zinit light romkatv/powerlevel10k
[[ -s ~/.p10k.zsh ]] && source ~/.p10k.zsh

# oh-my-zsh snippets
zinit snippet OMZL::key-bindings.zsh
zinit snippet OMZL::completion.zsh
zinit snippet OMZL::history.zsh
zinit snippet OMZP::sudo

# auto suggestions
zinit ice wait lucid nocd atload="_zsh_autosuggest_start"
zinit load zsh-users/zsh-autosuggestions

# NOTE: heighlights must after the autosuggest plugin
zinit ice wait lucid nocd atload="zicompinit;zicdreplay" src="fast-highlight"
zinit load zdharma-continuum/fast-syntax-highlighting

# z for quick jump
zinit ice wait="1" lucid nocd atinit="ZSHZ_DATA=${XDG_CACHE_HOME:-$HOME/.cache}/.z"
zinit load agkozak/zsh-z

# NOTE: fzf-tab doesn't work with zinit `wait`
if command -v fzf >/dev/null 2>&1; then
    FZF_DEFAULT_OPTS='--color=pointer:#e06c75,bg+:#51576d,gutter:#3e4452'
    zstyle ':fzf-tab:*' use-fzf-default-opts yes
    zinit light Aloxaf/fzf-tab
fi

#-----------------------
# ZSH Options
#-----------------------

unsetopt BEEP LIST_BEEP HIST_BEEP
setopt AUTO_PUSHD AUTO_CD AUTO_LIST PUSHD_IGNORE_DUPS INTERACTIVE_COMMENTS

# key-bindings
bindkey '^[' vi-cmd-mode
bindkey '^Y' autosuggest-accept
bindkey '^P' up-line-or-beginning-search
bindkey '^N' down-line-or-beginning-search

# shortcuts
alias ...=../..
alias ....=../../..
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias md='mkdir -p'
alias rd=rmdir
alias python='PYTHONPATH=$PYTHONPATH:$(pwd) python3'
command -v nvim >/dev/null 2>&1 && alias vim='nvim' && export EDITOR='nvim'
# alias tt='if tmux has-session & 2>/dev/null; then tmux a; else tmux; fi'
alias ds='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}"'

alias gc1='git clone --depth=1'
alias gs='git status -sb'
alias ga='git add'
alias gaa='git add --all'
alias gill='git pull'
alias gish='git push'
alias gma='git commit --amend --no-edit'
alias glo='git log --oneline -n 10 --graph'
gm() { if [ -z $1 ]; then git commit; else git commit -m $1; fi; }

if command -v eza >/dev/null 2>&1; then
    alias ls='eza --icons=auto'
    alias la='eza -a --icons=auto'
    alias ll='eza -labgh --icons=auto'
    alias lt='eza --tree --level=3'
else
    alias ls='ls --color=auto'
    alias la='ls -a --color=auto'
    alias ll='ls -lah --color=auto'
    command -v tree >/dev/null 2>&1 && alias lt='tree -pCsh'
fi

if command -v bat >/dev/null 2>&1; then
    alias less='bat'
    alias more='bat'
    alias cat='bat --style=plain --paging=never'
fi

