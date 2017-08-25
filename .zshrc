# Path to your oh-my-zsh installation.
export ZSH=/home/robin/.oh-my-zsh
export RUST_SRC_PATH='/usr/src/rustc-1.14.0/src'
source ~/.vim/plugged/gruvbox/gruvbox_256palette.sh
KEYTIMEOUT=1

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

plugins=(git vi-mode zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='nvim'

source ~/prompt.sh

export PATH=$PATH:/home/robin/projects/hwinfo/bin:/home/robin/.fzf/bin/:/home/robin/projects/exa/target/release
alias f='vim $(fzf)'
alias wr='wget -r -nc'
alias vi=nvim
alias vim=nvim
alias ls=exa
alias l="exa -l"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

GPG_TTY=$(tty)
export GPG_TTY
if ! pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
    eval `gpg-agent --daemon --pinentry-program /usr/bin/pinentry-tty`
fi
export GOPATH=$HOME/.go
ix() {
    local opts
    local OPTIND
    [ -f "$HOME/.netrc" ] && opts='-n'
    while getopts ":hd:i:n:" x; do
        case $x in
            h) echo "ix [-d ID] [-i ID] [-n N] [opts]"; return;;
            d) $echo curl $opts -X DELETE ix.io/$OPTARG; return;;
            i) opts="$opts -X PUT"; local id="$OPTARG";;
            n) opts="$opts -F read:1=$OPTARG";;
        esac
    done
    shift $(($OPTIND - 1))
    [ -t 0 ] && {
        local filename="$1"
        shift
        [ "$filename" ] && {
            curl $opts -F f:1=@"$filename" $* ix.io/$id
            return
        }
        echo "^C to cancel, ^D to send."
    }
    curl $opts -F f:1='<-' $* ix.io/$id
}
bindkey -M vicmd -- t up-line-or-history
bindkey -M vicmd -- n down-line-or-history

if [ -z "$TMUX" ]; then; tmux new-session -t robin_main; fi;
alias mnt="mount | column  --table-columns DEVICE,STATUS,PATH,' ',TYPE,OPTIONS -o ' │ ' -t"

# added by travis gem
[ -f /home/robin/.travis/travis.sh ] && source /home/robin/.travis/travis.sh

