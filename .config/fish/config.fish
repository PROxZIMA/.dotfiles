## Hide welcome message
set fish_greeting
set VIRTUAL_ENV_DISABLE_PROMPT "1"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
## Source .profile to apply its values
source ~/.profile


## Add ~/.local/bin to PATH
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end


## Starship prompt
source ("/usr/bin/starship" init fish --print-full-init | psub)


## Functions needed for !! and !$ https://github.com/oh-my-fish/plugin-bang-bang
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

if [ "$fish_key_bindings" = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end


## Fish command history
function history
    builtin history --show-time='%F %T '
end

function backup --argument filename
    cp $filename $filename.bak
end


## Copy DIR1 DIR2
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
	set from (echo $argv[1] | trim-right /)
	set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end


function ydl --argument 1
    youtube-dl -ix --audio-format mp3 --audio-quality 0 -o '~/Downloads/songs/%(title)s.%(ext)s' "$1"
end


function ydlp --argument 1
    youtube-dl -icx --yes-playlist --audio-format mp3 --audio-quality 0 -o '~/Downloads/songs/%(playlist)s/%(title)s.%(ext)s' "$1"
end


function mkfile --argument 1
    mkdir -p (dirname "$1") && touch "$1"
end


## Useful aliases
# Replace ls with exa
# alias ls='exa -al --color=always --group-directories-first' # preferred listing
# alias la='exa -a --color=always --group-directories-first'  # all files and dirs
# alias ll='exa -l --color=always --group-directories-first'  # long format
# alias lt='exa -aT --color=always --group-directories-first' # tree listing
# alias l.="exa -a | egrep '^\.'"
alias ls='lsd -a'
alias ll='lsd -ahl'
alias lst='lsd -a --tree -I .git'
alias llt='lsd -ahl --tree -I .git'

alias sudo='sudo '
alias snautilus='sudo -b dbus-launch nohup nautilus 2>/dev/null'
alias cls='clear'
alias cat='bat --style header --style rules --style snip --style changes --style header'
alias firefox='firefox-trunk'
alias myip='curl http://ipecho.net/plain; echo '
alias usage='du -ah -d1'
alias vim='nvim'
alias swire='SoundWireServer'
alias anime-release='python3 "/home/proxzima/Documents/Scripts/anime_release.py"'
alias ytdlu='sudo youtube-dl -U'
alias pacdiff='sudo -H DIFFPROG=meld pacdiff'

# colorize man pages
# export LESS_TERMCAP_mb=$'\e[1;32m'
# export LESS_TERMCAP_md=$'\e[1;32m'
# export LESS_TERMCAP_me=$'\e[0m'
# export LESS_TERMCAP_se=$'\e[0m'
# export LESS_TERMCAP_so=$'\e[01;33m'
# export LESS_TERMCAP_ue=$'\e[0m'
# export LESS_TERMCAP_us=$'\e[1;4;31m'
# export LESSHISTFILE=-

# Replace some more things with better alternatives
[ ! -x /usr/bin/bat ] && [ -x /usr/bin/cat ] && alias cat='bat'

# [ -x /usr/bin/dircolors ] && eval "(dircolors -b)"

# Common use
alias aup="pamac upgrade --aur"
alias grubup="sudo update-grub"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias upd='sudo reflector --latest 5 --age 2 --fastest 5 --protocol https --sort rate --save /etc/pacman.d/mirrorlist && cat /etc/pacman.d/mirrorlist && sudo pacman -Syu && fish_update_completions && sudo updatedb && sudo -H DIFFPROG=meld pacdiff'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias hw='hwinfo --short'                                   # Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl"              # Sort installed packages according to size in MB (expac must be installed)
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'			# List amount of -git packages

# Get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

#Cleanup orphaned packages
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'

#get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

#Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"

# Replace yay with paru
[ ! -x /usr/bin/yay ] && [ -x /usr/bin/paru ] && alias yay='paru'


## Import colorscheme from 'wal' asynchronously
if type "wal" >> /dev/null 2>&1
   cat ~/.cache/wal/sequences
end


## Run paleofetch if session is interactive
# if status --is-interactive
#    paleofetch
# end
