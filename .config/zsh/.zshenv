export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export BPWD="${PWD##*/}"
export PROMPT_EOL_MARK=''
export PNPM_HOME="/home/tfkhdyt/.local/share/pnpm"
export COMPOSER_HOME="$XDG_CONFIG_HOME/composer/vendor/bin"
export PATH="$PNPM_HOME:$PATH:$COMPOSER_HOME"
export HISTSIZE=1000
export SAVEHIST=1000
export AUTO_NOTIFY_EXPIRE_TIME=5000
export BROWSER=chromium
export EDITOR=nvim
export MYVIMRC="$XDG_CONFIG_HOME/nvim/init.lua"
# export AUTO_NOTIFY_URGENCY="normal"

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
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