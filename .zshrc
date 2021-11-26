neofetch --source ~/.config/ascii.txt | lolcat

# Different terminal theme for VSCode and rest
if [ "$TERM_PROGRAM" = "vscode" ]; then
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi
  ZSH_THEME="powerlevel10k/powerlevel10k"
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
elif [[ -x "$(command -v starship)" ]]; then
  # Starship prompt
  eval "$(starship init zsh --print-full-init)"
else
  # If no prompt available
  PROMPT=$'\n%F{%(#.blue.green)} ╭─(%B%F{%(#.red.blue)}%n@%m%b%F{%(#.blue.green)})-[%B%F{reset}%(6~.%-1~/…/%4~.%5~)%b%F{%(#.blue.green)}]\n ╰─%B%(#.%F{red}#.%F{blue}☣)%b%F{reset} '
  RPROMPT=$'%(?.. %? %F{red}%Bx%b%F{reset})%(1j. %j %F{yellow}%Bbg %b%F{reset}.)'
fi


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:$HOME/.local/bin

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh


# Set name of the theme to load
# ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"


# Loads ~/.zcompdump only once per day thus reducing loading time
autoload -Uz compinit

if [[ -n ${HOME}/.zcompdump(#qN.mh+24) ]]; then
	compinit -d $ZSH_COMPDUMP
else
	compinit -C
fi


# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh


# Options section
setopt extendedglob             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob               # Case insensitive globbing
setopt rcexpandparam            # Array expension with parameters
setopt nocheckjobs              # Don't warn about running processes when exiting
setopt numericglobsort          # Sort filenames numerically when it makes sense
setopt nobeep                   # No beep
setopt appendhistory            # Immediately append history instead of overwriting
setopt histignorealldups        # If a new command is a duplicate, remove the older one
setopt autocd                   # if only directory path is entered, cd there.
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus


# Completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' rehash true                              # automatically find new executables in path
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:descriptions' format '%U%F{cyan}%d%f%u'
zstyle ':completion:*' regular true

# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' cache-path ~/.oh-my-zsh/cache/
zstyle ':completion:*' use-cache on


# Uncomment the following line to use hyphen-insensitive completion.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"


# Exports
# export MANPATH="/usr/local/man:$MANPATH"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

export PYTHONDONTWRITEBYTECODE=1
export PROMPT_EOL_MARK=""
export GPG_TTY='tty'
export WINEARCH=win64
export JDK_HOME="/usr/lib/jvm/java-11-openjdk-amd64"

# colorize man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
export LESSHISTFILE=-

export BAT_PAGER="less -RF"

# aliases
if [ -f ~/.zsh_alias ]; then
. ~/.zsh_alias
fi

# [ -x /usr/bin/dircolors ] && eval "$(dircolors -b)"

# Functions
lnvm () {
  source ~/.nvm/nvm.sh
  source ~/.nvm/bash_completion
}

cht() {curl cht.sh/$1}

syu() {sudo sh -c 'SKIP_AUTOSNAP= pacman -Syu; pamac upgrade --aur; pamac clean -b'}

edit() {gedit "$1" 2>/dev/null & disown}

suck() {surf -bDfgIkMnS "$1" 2>/dev/null & disown}

asm() {b=$1; b=$(echo "${b%.*}"); nasm -f elf64 "$1"; ld -o $b $b.o; rm -f $b.o; ./$b}

myip() {json=$(curl -s https://ipinfo.io/);echo " Local IP : $(hostname -i | awk '{print $1}')\n Public IP: $(echo $json | grep -Po '(?<=ip\": \").*?(?=\")'), $(echo $json | grep -Po '(?<=city\": \").*?(?=\")'), $(echo $json | grep -Po '(?<=region\": \").*?(?=\")'), $(echo $json | grep -Po '(?<=country\": \").*?(?=\")')"}

# ff() {firefox -width 5 -height 5 -P app --private-window "data:text/html,<script>window.open('"$1"','_blank','top=50,left=200,width=900px,height=660px,directories=0,titlebar=0,toolbar=0,location=0,status=0,menubar=0');window.close()</script>" 2>/dev/null & disown}

ff() {firefox -width 900 -height 600 -P app "$1" 2>/dev/null & disown}

ydl() {youtube-dl -ix --audio-format mp3 --audio-quality 0 -o '~/Downloads/songs/%(title)s.%(ext)s' "$1"}

ydlp() {youtube-dl -icx --yes-playlist --audio-format mp3 --audio-quality 0 -o '~/Downloads/songs/%(playlist)s/%(title)s.%(ext)s' "$1"}

mkfile() {mkdir -p "$(dirname "$1")" && touch "$1";}

