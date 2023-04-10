# neofetch --source ~/.config/ascii.txt --backend ascii
# pokemon-colorscripts -r -s --no-title

# Different terminal theme for VSCode and rest
if [ "$TERM_PROGRAM" = "vscode" ]; then
  eval "$(starship init zsh --print-full-init)"
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

export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:$HOME/.local/bin:$HOME/.local/bin/flutter/bin:$HOME/.local/dex:/usr/local/texlive/2022/bin/x86_64-linux:/usr/share/archcraft/scripts:$HOME/.local/share/gem/ruby/3.0.0/bin:/opt/cuda/bin:/opt/flutter/bin

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
# zsh-autocomplete
# alias-tips
source $ZSH/oh-my-zsh.sh

# Options section
setopt extendedglob             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob               # Case insensitive globbing
setopt rcexpandparam            # Array expension with parameters
setopt nocheckjobs              # Don't warn about running processes when exiting
setopt numericglobsort          # Sort filenames numerically when it makes sense
# setopt nobeep                   # No beep
setopt appendhistory            # Immediately append history instead of overwriting
setopt histignorealldups        # If a new command is a duplicate, remove the older one
setopt autocd                   # if only directory path is entered, cd there.
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus
setopt inc_append_history
setopt complete_in_word
setopt always_to_end

unsetopt extended_history
unsetopt EXTENDED_HISTORY

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP

setopt incappendhistorytime

# Completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'      # Case insensitive tab completion
zstyle ':completion:*' rehash true                              # automatically find new executables in path
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' completer _expand _complete _ignored _approximate
#zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' regular true
zstyle ':completion:*' group-name ''
#zstyle ':completion:*' group-order alias builtins functions commands
zstyle ':completion:*' complete-options true
#zstyle ':completion:*:descriptions' format '%U%F{cyan}%d%f%u'

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

export HISTSIZE=1000000000
export HISTFILESIZE=1000000000
export HISTTIMEFORMAT=" "
export HISTCONTROL=ignoreboth:erasedups

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

export PYTHONDONTWRITEBYTECODE=1
export PYTHONSTARTUP=~/.python_startup.py
export PROMPT_EOL_MARK=""
export GPG_TTY='tty'
export SUBDOMAIN=ftw
export API_SUBDOMAIN=127.0.0.1
export WINEARCH=win32
export WINEPREFIX="$HOME/.wine"
export JDK_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
export CHROME_EXECUTABLE="/usr/lib/chromium-browser/chromium-browser"
export MOZ_ENABLE_WAYLAND=1

export HADOOP_HOME=/home/proxzima/.local/bin/hadoop
export HADOOP_INSTALL=$HADOOP_HOME
export HADOOP_MAPRED_HOME=$HADOOP_HOME
export HADOOP_COMMON_HOME=$HADOOP_HOME
export HADOOP_HDFS_HOME=$HADOOP_HOME
export YARN_HOME=$HADOOP_HOME
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
export PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin
export HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib/nativ"
# export HADOOP_OPTS="-Dlog4j.debug=true,-Djava.library.path=$HADOOP_HOME/lib/nativ"

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$HOME/.pub-cache/bin

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
export NVM_DIR="$HOME/.nvm"
export NODE_PATH="$HOME/.nvm/versions/node/v16.14.2/lib/node_modules/"

# aliases
if [ -f ~/.aliases ]; then
. ~/.aliases
fi

# [ -x /usr/bin/dircolors ] && eval "$(dircolors -b)"

# Functions
lnvm () {
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}


copydots() {
    _USER=/home/proxzima;
    rsync -rvqO --inplace --exclude '.git/' --files-from ~/.dotfiles/.dotpaths $_USER $_USER/.dotfiles;
    find $_USER/.dotfiles/.local/share/fonts/ -name '*.uuid' -type f -delete;
    rm -rf $_USER/.dotfiles/.mpd/mpd{.log,.pid,state};

}

cht() {curl cht.sh/$1}

syu() {sudo sh -c 'SKIP_AUTOSNAP= pacman -Syu; pamac upgrade --aur; pamac clean -b'}

suck() {surf -bDfgIkMnS "$1" 2>/dev/null & disown}

asm() {b=$1; b=$(echo "${b%.*}"); nasm -f elf64 "$1"; ld -o $b $b.o; rm -f $b.o; ./$b}

myip() {json=$(curl -s https://ipinfo.io/);echo " Local IP : $(hostname -i | awk '{print $1}')\n Public IP: $(echo $json | grep -Po '(?<=ip\": \").*?(?=\")'), $(echo $json | grep -Po '(?<=city\": \").*?(?=\")'), $(echo $json | grep -Po '(?<=region\": \").*?(?=\")'), $(echo $json | grep -Po '(?<=country\": \").*?(?=\")')"}

# ff() {firefox -width 5 -height 5 -P app --private-window "data:text/html,<script>window.open('"$1"','_blank','top=50,left=200,width=900px,height=660px,directories=0,titlebar=0,toolbar=0,location=0,status=0,menubar=0');window.close()</script>" 2>/dev/null & disown}

ff() {firefox -width 900 -height 600 -P app "$1" 2>/dev/null & disown}

ydl() {yt-dlp -ix --audio-format mp3 --audio-quality 0 -o '~/Downloads/songs/%(title)s.%(ext)s' "$1"}

ydlp() {yt-dlp -icx --yes-playlist --audio-format mp3 --audio-quality 0 -o '~/Downloads/songs/%(playlist)s/%(title)s.%(ext)s' "$1"}

ydlv() {yt-dlp --format mp4 --audio-quality 0 -o '~/Downloads/videos/%(title)s.%(ext)s' "$1"}

mkfile() {mkdir -p "$(dirname "$1")" && touch "$1";}

# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/opt/google-cloud-sdk/path.zsh.inc' ]; then . '/opt/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
# if [ -f '/opt/google-cloud-sdk/completion.zsh.inc' ]; then . '/opt/google-cloud-sdk/completion.zsh.inc'; fi
