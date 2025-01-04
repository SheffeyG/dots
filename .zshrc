#-----------------------
# Theme
#-----------------------

# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# setting zsh prompt right padding
if [[ -z "$ZLE_RPROMPT_INDENT" ]]; then
    if [[ -n "$NVIM" ]]; then
        ZLE_RPROMPT_INDENT=2
    else
        ZLE_RPROMPT_INDENT=0
    fi
fi

#-----------------------
# Options
#-----------------------

set bell-style none

# pushd and other
setopt AUTO_PUSHD AUTO_CD AUTO_LIST PUSHD_IGNORE_DUPS INTERACTIVE_COMMENTS 

# key-bindings
bindkey '\ej' up-line-or-beginning-search
bindkey '\ek' down-line-or-beginning-search

#-----------------------
# Aliases
#-----------------------

alias ...=../..
alias ....=../../..
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias md='mkdir -p'
alias rd=rmdir
alias grep='grep --color=auto'
alias python='PYTHONPATH=$PYTHONPATH:$(pwd) python3'
# alias tt='if tmux has-session & 2>/dev/null; then tmux a; else tmux; fi'

# git
alias gc1='git clone --depth=1'
alias gs='git status -sb'
alias ga='git add'
alias gaa='git add .'
alias gill='git pull'
alias gish='git push'
alias gma='git commit --amend --no-edit'
alias glo='git log --oneline -n 10 --graph'
gm() { if [ -z "$1" ]; then git commit; else git commit -m "$1"; fi; }

# software shortcuts
[[ $(command -v nvim) ]] && alias vim='nvim' && export EDITOR=nvim
[[ $(command -v bat) ]] && alias cat='bat' 
if [[ -n "$TERMUX_VERSION" ]]; then
    alias tcs='termux-clipboard-set'
    alias tcg='termux-clipboard-get'
    alias hugo='hugo --noBuildLock'
fi

# aliases for ls command
_ls_alias() {
    local cmd="\\$1"
    alias ls="$cmd --icons --color=auto"
    alias l="$cmd -lh --icons"
    alias ll="$cmd -labg --icons"
    alias la="$cmd -labgh --icons"
    alias lsa="$cmd -lbagR --icons"
    alias lst="$cmd --tree --level=3"
}

if [[ $(command -v eza) ]]; then
    _ls_alias "eza"
elif [[ $(command -v exa) ]]; then
    _ls_alias "exa"
else
    alias ls='ls --color=auto'
    alias l='ls -lh'
    alias la='ls -lAh'
    alias ll='ls -lah'
    alias lsa='ls -lah' 
    alias lst='tree -pCsh'
fi


#-----------------------
# Path
#-----------------------

### NVM Initialization
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

### CONDA Initialization
[ -d "$HOME/anaconda3" ] && CONDA_HOME="$HOME/anaconda3/"
[ -d "$HOME/miniconda3" ] && CONDA_HOME="$HOME/miniconda3/"
[ -f "/$CONDA_HOME/etc/profile.d/conda.sh" ] && \. "/$CONDA_HOME/etc/profile.d/conda.sh"

[ -d "$HOME/.local/bin" ] && PATH=$PATH:$HOME/.local/bin/
[ -d "$HOME/.cargo/bin" ] && PATH=$PATH:$HOME/.cargo/bin/


#-----------------------
# Plugins
#-----------------------

### Zinit Initialization
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d $ZINIT_HOME ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone --depth=1 https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# p10k theme
zinit ice depth"1"
zinit light romkatv/powerlevel10k
[ -f ~/.p10k.zsh ] && source ~/.p10k.zsh

# OMZ snippet
zinit snippet OMZL::key-bindings.zsh 
zinit snippet OMZL::completion.zsh
zinit snippet OMZL::history.zsh

zinit snippet OMZP::sudo           # tap ESC twice to toggle sudo
zinit snippet OMZP::extract        # x to extract

# fzf tab completion
if [ $(command -v fzf) ]; then
    zinit ice wait lucid atload"
        FZF_DEFAULT_OPTS='--color=pointer:#e06c75,bg+:#51576d,gutter:-1'
        zstyle ':fzf-tab:*' use-fzf-default-opts yes"
    zinit load Aloxaf/fzf-tab
fi

# auto suggestions
zinit ice wait lucid atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions 

# heighlight
zinit ice wait"1" lucid atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay;"
zinit light zdharma-continuum/fast-syntax-highlighting

# z to jump dir
zinit wait"1" lucid for agkozak/zsh-z 

# auto switch python venv
zinit wait lucid for MichaelAquilina/zsh-autoswitch-virtualenv

