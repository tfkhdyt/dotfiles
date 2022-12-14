export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export BPWD="${PWD##*/}"
export PROMPT_EOL_MARK=''
export PNPM_HOME="/home/tfkhdyt/.local/share/pnpm"
export MY_SCRIPTS="$HOME/.dotfiles/scripts"
export HISTSIZE=1000
export SAVEHIST=1000
export AUTO_NOTIFY_EXPIRE_TIME=5000
export BROWSER=librewolf
export EDITOR=lvim
# export AUTO_NOTIFY_URGENCY="normal"

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export COMPOSER_HOME="$XDG_CONFIG_HOME"/composer/vendor/bin
export ANDROID_HOME="$XDG_DATA_HOME"/android
export HISTFILE="${XDG_STATE_HOME}"/bash/history
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
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export ZDOTDIR="$HOME"/.config/zsh
export QT_QPA_PLATFORMTHEME=qt5ct
export DATE=$(date -I)
# export TIMESTAMP=$(shell date +%Y-%m-%dT%H:%M:%S) 
export PRETTIERD_DEFAULT_CONFIG="$HOME/.config/lvim/prettierd/.prettierrc"
export CARGO_BIN="$HOME/.cargo/bin/"
export PATH="$PATH:$MY_SCRIPTS:$PNPM_HOME:$CARGO_BIN"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

export NNN_TRASH=1
