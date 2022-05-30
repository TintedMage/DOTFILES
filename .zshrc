echo "hello"
# OH-MY-ZSH
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="gnzh"
plugins=(git)
source $ZSH/oh-my-zsh.sh


# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle :compinstall filename '/home/khushal/.zsh/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall


# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install


# user configuration
export EDITOR="vim"
precmd() { print "" }

#alias
alias autoclean="sudo pacman -Rcns $(pacman -Qdtq) --noconfirm ; yay -Sc --noconfirm ; sudo rm -rf .cache ; trash-empty -f ; clear ; echo All Unwanted Packages Cleaned!"
alias shutdown="sudo poweroff"
alias reboot="sudo reboot"
alias h="vim .config/Imp_Utils.txt"


 
