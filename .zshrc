##############
# P10K THEME #
##############

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


##########
# SETOPT #
##########

# history setting
setopt SHARE_HISTORY HIST_IGNORE_ALL_DUPS HIST_EXPIRE_DUPS_FIRST HIST_IGNORE_DUPS HIST_IGNORE_SPACE HIST_SAVE_NO_DUPS INC_APPEND_HISTORY

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000

# pushd and other
setopt AUTO_PUSHD AUTO_CD AUTO_LIST PUSHD_IGNORE_DUPS INTERACTIVE_COMMENTS 


#########
# ALIAS #
#########

alias ...=../..
alias ....=../../..
alias .....=../../../..
alias ......=../../../../..
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'
alias _='sudo '
alias md='mkdir -p'
alias rd=rmdir
alias grep='grep --color=auto'

# software shortcuts
[[ $(command -v nvim) ]] && alias vim='nvim'
[[ $(command -v bat) ]] && alias cat='bat' 
if [[ -n "$TERMUX_VERSION" ]]; then
    alias tcs='termux-clipboard-set'
    alias tcg='termux-clipboard-get'
    alias hugo='hugo --noBuildLock'
fi

# exa for ls 
if [[ $(command -v exa) ]] {
    alias ls="exa --icons --color=auto" 
    alias l='exa -lbah --icons'
    alias la='exa -labgh --icons'
    alias ll='exa -lbg --icons'
    alias lsa='exa -lbagR --icons'
    alias lst='exa -lTabgh --icons' # dispaly as tree
} else {
    alias ls='ls --color=auto'
    alias lst='tree -pCsh'
    alias l='ls -lah'
    alias la='ls -lAh'
    alias ll='ls -lh'
    alias lsa='ls -lah'
}


#########
# ZINIT #
#########

### Zinit Initialization

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# if [[ ! -r "$HOME/.local/share/zinit/zinit.git/zinit.zsh" ]]; then
#     echo "[ERROR] zinit.zsh not found!" && return 1
# fi
# source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit


### Zinit Load Plugins
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

# omz snippet
zinit snippet OMZL::git.zsh
zinit snippet OMZL::key-bindings.zsh 
zinit snippet OMZL::completion.zsh

# omz plugin
zinit snippet OMZP::git      # git alias
zinit snippet OMZP::sudo     # ese twice to add sudo
zinit snippet OMZP::extract  # x to extract

# zsh heighlight
zinit ice wait lucid \
    pick"fast-syntax-highlighting.plugin.zsh" \
    atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay;"
zinit light zdharma-continuum/fast-syntax-highlighting

# zsh auto suggestions
zinit ice wait lucid atload'_zsh_autosuggest_start'
zini light zsh-users/zsh-autosuggestions 

# tab to suggestions (pkg fzf needed)
[[ $(command -v fzf) ]] && \
    zinit ice lucid pick"fzf-tab.zsh" wait && zinit light Aloxaf/fzf-tab

# z to jump dir
zinit ice lucid wait="1" && zinit light agkozak/zsh-z 

