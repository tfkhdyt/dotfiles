#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.welcome_screen ]] && . ~/.welcome_screen

_set_liveuser_PS1() {
    PS1='[\u@\h \W]\$ '
    if [ "$(whoami)" = "liveuser" ] ; then
        local iso_version="$(grep ^VERSION= /usr/lib/endeavouros-release 2>/dev/null | cut -d '=' -f 2)"
        if [ -n "$iso_version" ] ; then
            local prefix="eos-"
            local iso_info="$prefix$iso_version"
            PS1="[\u@$iso_info \W]\$ "
        fi
    fi
}
_set_liveuser_PS1
unset -f _set_liveuser_PS1

ShowInstallerIsoInfo() {
    local file=/usr/lib/endeavouros-release
    if [ -r $file ] ; then
        cat $file
    else
        echo "Sorry, installer ISO info is not available." >&2
    fi
}


alias ls='ls --color=auto'
alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."

[[ "$(whoami)" = "root" ]] && return

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

################################################################################
## Some generally useful functions.
## Consider uncommenting aliases below to start using these functions.
##
## October 2021: removed many obsolete functions. If you still need them, please look at
## https://github.com/EndeavourOS-archive/EndeavourOS-archiso/raw/master/airootfs/etc/skel/.bashrc

_open_files_for_editing() {
    # Open any given document file(s) for editing (or just viewing).
    # Note1:
    #    - Do not use for executable files!
    # Note2:
    #    - Uses 'mime' bindings, so you may need to use
    #      e.g. a file manager to make proper file bindings.

    if [ -x /usr/bin/exo-open ] ; then
        echo "exo-open $@" >&2
        setsid exo-open "$@" >& /dev/null
        return
    fi
    if [ -x /usr/bin/xdg-open ] ; then
        for file in "$@" ; do
            echo "xdg-open $file" >&2
            setsid xdg-open "$file" >& /dev/null
        done
        return
    fi

    echo "$FUNCNAME: package 'xdg-utils' or 'exo' is required." >&2
}

#------------------------------------------------------------

## Aliases for the functions above.
## Uncomment an alias if you want to use it.
##

# alias ef='_open_files_for_editing'     # 'ef' opens given file(s) for editing
# alias pacdiff=eos-pacdiff
################################################################################

bind '"\e[27;2;13~":"\n"'
bind '"\e[27;5;13~":"\n"'

export BROWSER=librewolf
export TERMINAL=alacritty
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export PNPM_HOME="$XDG_DATA_HOME/pnpm"
export MY_SCRIPTS="$HOME/.dotfiles/scripts"
export STATUSBAR_SCRIPTS="$HOME/.dotfiles/scripts/statusbar"
export HISTSIZE=10000
export SAVEHIST=10000
export EDITOR=nvim
export COMPOSER_HOME="$XDG_CONFIG_HOME"/composer/vendor/bin
export ANDROID_HOME="$XDG_DATA_HOME"/android
export HISTFILE="$XDG_STATE_HOME"/bash/history
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GOPATH="$XDG_DATA_HOME"/go
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export KDEHOME="$XDG_CONFIG_HOME"/kde 
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export MYSQL_HISTFILE="$XDG_DATA_HOME"/mysql_history
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export PSQL_HISTORY="$XDG_DATA_HOME/psql_history"
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export WINEPREFIX="$XDG_DATA_HOME"/wine
export QT_QPA_PLATFORMTHEME=qt6ct
export CARGO_BIN="$HOME/.cargo/bin/"
export GOBIN="$XDG_DATA_HOME/go/bin"
export PATH="$PATH:$MY_SCRIPTS:$STATUSBAR_SCRIPTS:$PNPM_HOME:$CARGO_BIN:$GOBIN:$HOME/.local/bin:$HOME/.local/share/nvim/mason/bin:$HOME/.detaspace/bin"
export FZF_DEFAULT_OPTS="
	--color=fg:#908caa,bg:#191724,hl:#ebbcba
	--color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
	--color=border:#403d52,header:#31748f,gutter:#191724
	--color=spinner:#f6c177,info:#9ccfd8,separator:#403d52
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"
export NNN_TRASH=1
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export BAT_THEME="Catppuccin-mocha"
export LESS="-I -R"
export NNN_TERMINAL=$TERMINAL
export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG="p:preview-tui"
export LS_COLORS=$(vivid generate catppuccin-mocha)
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gcr/ssh"
export PRETTIERD_DEFAULT_CONFIG="$XDG_CONFIG_HOME/prettierd/.prettierrc"
export PRETTIERD_LOCAL_PRETTIER_ONLY=true
