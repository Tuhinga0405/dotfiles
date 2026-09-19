#!/bin/zsh

# Пути
typeset -U PATH
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH"
#nvim
export PATH="$PATH:/home/nikita/1-apps/nvim-linux-x86_64/bin/"

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
#ZSH_THEME="tjkirch"
ZSH_THEME="avit"
#plugins=(git vi-mode python) 

source $ZSH/oh-my-zsh.sh

# FZF (с проверкой)
if command -v fzf &> /dev/null; then
    source <(fzf --zsh)
fi

# Zoxide (с проверкой)
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init zsh)"
fi

# Другие переменные
export MANPAGER="sh -c 'nvim +Man! -'"
export MANWIDTH=999

# История
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# Алиасы

alias srv="source .venv/bin/activate"
alias fid='cd $(find . -type d -print | fzf)'
alias cl='clear'
alias nts='cd /home/nikita/Документы/notes'
alias al-b='alias | bat'
alias emcs='emacs -nw'
alias desc='cd /home/nikita/.local/share/applications'


# Функции
mann() {
    if command -v bat &> /dev/null; then
        man "$1" | bat -l man --style=numbers,changes
    else
        man "$1"
    fi
}

##pomodora
declare -A pomo_options
pomo_options["work"]="3600"
pomo_options["break"]="900"

pomodoro () {
  if [ -n "$1" -a -n "${pomo_options["$1"]}" ]; then
  val=$1
#  echo $val | lolcat
  sleep ${pomo_options["$val"]}
  spd-say "'$val' session done, miserable human"
  fi
}

alias wo="pomodoro 'work'"
alias br="pomodoro 'break'"


#alarm-clock
alarm="/home/nikita/Музыка/alrms/military.mp3"

al () {
    if [ -n "$1" -a -n "$alarm" ]; then
        time=$1
        echo "mpv --force-window $alarm" | at "$1" 2>&1 | grep -v \
                "warning: commands will be executed using /bin/sh"
    fi
}

#seval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"
