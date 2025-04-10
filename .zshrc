#-----------------------
# Theme
#-----------------------

# enable p10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# setting zsh prompt right padding
ZLE_RPROMPT_INDENT=0


#-----------------------
# Options
#-----------------------

set bell-style none
unsetopt BEEP LIST_BEEP HIST_BEEP
setopt AUTO_PUSHD AUTO_CD AUTO_LIST PUSHD_IGNORE_DUPS INTERACTIVE_COMMENTS

# key-bindings
bindkey '\ej' up-line-or-beginning-search
bindkey '\ek' down-line-or-beginning-search


#-----------------------
# Path
#-----------------------

# NVM initialization
# https://github.com/nvm-sh/nvm?tab=readme-ov-file#manual-install
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# conda initialization
# https://repo.anaconda.com/miniconda
[ -d "$HOME/anaconda3" ] && CONDA_HOME="$HOME/anaconda3/"
[ -d "$HOME/miniconda3" ] && CONDA_HOME="$HOME/miniconda3/"
[ -f "/$CONDA_HOME/etc/profile.d/conda.sh" ] && \. "/$CONDA_HOME/etc/profile.d/conda.sh"

# custom path
[ -d "$HOME/.local/bin" ] && PATH="$PATH:$HOME/.local/bin/"
[ -d "$HOME/.cargo/bin" ] && PATH="$PATH:$HOME/.cargo/bin/"


#-----------------------
# Aliases
#-----------------------

# shortcuts
alias ...=../..
alias ....=../../..
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias md='mkdir -p'
alias rd=rmdir
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

# aliases for ls command
if [[ $(command -v eza) ]]; then
    alias ls='eza --icons --color=auto'
    alias l='eza -lh --icons'
    alias ll='eza -labg --icons'
    alias la='eza -labgh --icons'
    alias lsa='eza -lbagR --icons'
    alias lst='eza --tree --level=3'
else
    alias ls='ls --color=auto'
    alias l='ls -lh'
    alias ll='ls -lah'
    alias la='ls -lAh'
    alias lsa='ls -lah'
    alias lst='tree -pCsh'
fi

# better alternative
[[ $(command -v nvim) ]] && alias vim=nvim && EDITOR=nvim
[[ $(command -v bat) ]] && alias cat=bat
[[ $(command -v rg) ]] && alias grep=rg

# termux
if [[ -n "$TERMUX_VERSION" ]]; then
    alias tcs='termux-clipboard-set'
    alias tcg='termux-clipboard-get'
    alias hugo='hugo --noBuildLock'
fi


#-----------------------
# Plugins
#-----------------------

# zinit initialization
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone --depth=1 https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# zinit custom config
ZINIT[COMPINIT_OPTS]=-C # skip safe check for speed up
ZINIT[ZCOMPDUMP_PATH]="${XDG_CACHE_HOME:-$HOME/.cache}/.zcompdump"

# p10k theme
zinit ice depth"1"
zinit light romkatv/powerlevel10k
[ -f ~/.p10k.zsh ] && source ~/.p10k.zsh

# oh-my-zsh snippets
zinit snippet OMZL::key-bindings.zsh
zinit snippet OMZL::history.zsh
zinit snippet OMZP::sudo    # double esc to toggle sudo
zinit snippet OMZP::extract # x to extract

# auto suggestions
zinit ice wait lucid atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

# heighlights
zinit ice wait lucid atinit"zicompinit;zicdreplay"
zinit light zdharma-continuum/fast-syntax-highlighting

# z to jump dir
zinit ice wait"1" lucid atload"ZSHZ_DATA=${XDG_CACHE_HOME:-$HOME/.cache}/.z"
zinit light agkozak/zsh-z

# auto switch python venv
zinit wait"1" lucid for Skylor-Tang/auto-venv

# fzf tab completion
if [[ $(command -v fzf) ]]; then
    zinit ice wait"1" lucid atload"
        FZF_DEFAULT_OPTS='--color=pointer:#e06c75,bg+:#51576d,gutter:-1'
        zstyle ':fzf-tab:*' use-fzf-default-opts yes"
    zinit light Aloxaf/fzf-tab
fi

