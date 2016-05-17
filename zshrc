# Aliases
alias ls='ls --color=auto -N'
alias nano='nano --tabstospaces --tabsize=4 --autoindent'

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
setopt extendedglob notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jadelclemens/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

typeset -U path
path=($path)

zstyle ':completion:*' menu select

setopt completealiases
setopt HIST_IGNORE_DUPS

setopt nohashdirs

autoload -U promptinit
promptinit
#autoload -U colors
#colors
autoload spectrum
spectrum

#Prompt
namecolor=0
hostnamecolor=0

if [ $UID -eq 0 ]; then
    namecolor=160
else if [ $UID -eq 1000 ]; then
    namecolor=040
fi
fi

hostname=`hostname -s`

if [ "$hostname" = "Madoka" ]; then
    hostnamecolor=211
else if [ "$hostname" = "Homura" ]; then
    hostnamecolor=129
else if [ "$hostname" = "Sayaka" ]; then
    hostnamecolor=073
else if [ "$hostname" = "Kyouko" ]; then
    hostnamecolor=088
fi
fi
fi
fi 

PROMPT=[%{$FX[bold]$FG[$namecolor]%}%n%{$FX[reset]%}@%{$FX[bold]$FG[$hostnamecolor]%}%m%{$FX[reset]%}]%{$FG[$hostnamecolor]%}" ~> "%{$FX[reset]%}
RPROMPT=%{$FG[124]%}[%~]%{$FX[reset]%}

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload zkbd
source /etc/zsh/zkbd/$TERM # may be different - check where zkbd saved the configuration:

[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[Insert]} ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
#[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" up-line-or-history
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"    history-beginning-search-backward
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
#[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" down-line-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}"  history-beginning-search-forward
[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-search
[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-search
[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char
