# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH=~/go/bin:$PATH
export PATH=/Users/gtliu/.fnm:$PATH

export PYENV_ROOT="$HOME/.pyenv"
export FZF_DEFAULT_COMMAND="rg --files --hidden -g'!.git'"

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"

# auto start tmux on start
export ZSH_TMUX_AUTOSTART=true
export TERM=screen-256color

# Path to your oh-my-zsh installation.
export ZSH="/Users/gtliu/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \ print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit


zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zdharma/fast-syntax-highlighting 
zinit light zdharma/history-search-multi-word

zinit ice depth=1;zinit light romkatv/powerlevel10k

# OMZ Plugin
zinit snippet OMZP::tmux

zinit ice lucid wait='1'
zinit snippet OMZP::sudo
zinit snippet OMZP::git
zinit snippet OMZP::colored-man-pages

# Library
zinit snippet OMZ::lib/key-bindings.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

