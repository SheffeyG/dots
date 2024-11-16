#-----------------------
# Theme
#-----------------------

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


#-----------------------
# Options
#-----------------------

# history setting
setopt SHARE_HISTORY HIST_IGNORE_ALL_DUPS HIST_EXPIRE_DUPS_FIRST HIST_IGNORE_DUPS HIST_IGNORE_SPACE HIST_SAVE_NO_DUPS INC_APPEND_HISTORY

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000

# pushd and other
setopt AUTO_PUSHD AUTO_CD AUTO_LIST PUSHD_IGNORE_DUPS INTERACTIVE_COMMENTS 

# fzf options
export FZF_DEFAULT_OPTS='
    --border
    --color bg+:#7797b7,fg+:#2c2f30,hl:#D8DEE9,hl+:#26292a,gutter:-1
    --color pointer:#373d49,info:#606672'


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
alias python=python3
alias tt='if tmux has-session; then tmux a; else tmux; fi'

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
set_ls_alias() {
    local cmd="\\$1"
    alias ls="$cmd --icons --color=auto"
    alias l="$cmd -lbah --icons"
    alias la="$cmd -labgh --icons"
    alias ll="$cmd -lbg --icons"
    alias lsa="$cmd -lbagR --icons"
    alias lst="$cmd -lTabgh --icons" # dispaly as tree
}

if command -v eza > /dev/null 2>&1; then
    set_ls_alias "eza"
elif command -v exa > /dev/null 2>&1; then
    set_ls_alias "exa"
else
    alias ls='ls --color=auto'
    alias lst='tree -pCsh'
    alias l='ls -lah'
    alias la='ls -lAh'
    alias ll='ls -lh'
    alias lsa='ls -lah' 
fi


#-----------------------
# Path
#-----------------------

### NVM Initialization
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

### Zinit Plugins
# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# p10k theme
zinit ice depth=1; zinit light romkatv/powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# OMZ snippet
zinit snippet OMZL::key-bindings.zsh 
zinit snippet OMZL::completion.zsh

# OMZ plugin
zinit snippet OMZP::sudo           # tap ESC twice to toggle sudo
zinit snippet OMZP::extract        # x to extract
# zinit snippet OMZP::dirhistory     # alt to move dir

# zsh heighlight
zinit ice wait lucid \
    pick"fast-syntax-highlighting.plugin.zsh" \
    atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay;"
zinit light zdharma-continuum/fast-syntax-highlighting

# zsh auto suggestions
zinit ice wait lucid atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions 

# fzf tab completion
[[ $(command -v fzf) ]] && \
    zinit wait lucid pick"fzf-tab.zsh" for Aloxaf/fzf-tab

# z to jump dir
zinit wait lucid for agkozak/zsh-z 

# auto switch python venv
zinit wait lucid for MichaelAquilina/zsh-autoswitch-virtualenv

