# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


### Added by Zinit's installer
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
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
zinit snippet OMZL::history.zsh 
zinit snippet OMZL::key-bindings.zsh 
zinit snippet OMZL::completion.zsh

# omz plugin
zinit snippet OMZP::git
zinit snippet OMZP::sudo

# zsh heighlight
zinit ice wait lucid \
    pick"fast-syntax-highlighting.plugin.zsh" \
    atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay;"
zinit light zdharma-continuum/fast-syntax-highlighting

# zsh auto suggestions
zinit ice wait lucid atload'_zsh_autosuggest_start'
zini light zsh-users/zsh-autosuggestions 

# tab to suggestions (pkg fzf needed)
zinit ice lucid pick"fzf-tab.zsh" wait="1" && zinit light Aloxaf/fzf-tab

# z to jump dir
zinit ice lucid wait="1" && zinit light agkozak/zsh-z 

# x to extract 
zinit ice lucid wait="1" && zinit light le0me55i/zsh-extract


### setopt
## history setting
setopt SHARE_HISTORY HIST_IGNORE_ALL_DUPS HIST_EXPIRE_DUPS_FIRST HIST_IGNORE_DUPS HIST_IGNORE_SPACE HIST_SAVE_NO_DUPS INC_APPEND_HISTORY
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000

## pushd and other
setopt AUTO_PUSHD AUTO_CD AUTO_LIST PUSHD_IGNORE_DUPS INTERACTIVE_COMMENTS 


### alias
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
alias afind='ack -il'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias globurl='noglob urlglobber '
alias grep='grep --color=auto'


# software shortcuts
[[ $(command -v nvim) ]] && alias vim='nvim'
[[ $(command -v bat) ]] && alias cat='bat' 
if [[ -n "$TERMUX_VERSION" ]]; then
    alias tcs='termux-clipboard-set'
    alias tcg='termux-clipboard-get'
    alias hugo='hugo --noBuildLock'
fi


### eza for ls 
if [[ $(command -v eza) ]] {
    DISABLE_LS_COLORS=true
    unset LS_BIN_FILE
    for i (/bin/ls ${PREFIX}/bin/ls /usr/bin/ls /usr/local/bin/ls) {
        [[ ! -x ${i} ]] || {
            local LS_BIN_FILE=${i}
            break
        }
    }
    [[ -n ${LS_BIN_FILE} ]] || local LS_BIN_FILE=$(whereis ls 2>/dev/null | awk '{print $2}')
    # lls is the original ls
    alias lls=${LS_BIN_FILE} 
    alias ls="eza --icons --color=auto" 
    alias l='eza -lbah --icons'
    alias la='eza -labgh --icons'
    alias ll='eza -lbg --icons'
    alias lsa='eza -lbagR --icons'
    alias lst='eza -lTabgh --icons' # Tree dispaly 
} else {
    alias ls='ls --color=auto'
    alias lst='tree -pCsh'
    alias l='ls -lah'
    alias la='ls -lAh'
    alias ll='ls -lh'
    alias lsa='ls -lah'
}


