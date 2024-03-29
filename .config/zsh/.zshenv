export BROWSER=brave
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
export GOBIN="$XDG_DATA_HOME/go/bin"
# export PATH="$PATH:$MY_SCRIPTS:$STATUSBAR_SCRIPTS:$PNPM_HOME:$CARGO_BIN:$GOBIN:$HOME/.local/bin:$HOME/.local/share/nvim/mason/bin:$HOME/.detaspace/bin:$HOME/.cache/.bun/bin"
export FZF_DEFAULT_OPTS="
	--color=fg:#908caa,bg:#191724,hl:#ebbcba
	--color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
	--color=border:#403d52,header:#31748f,gutter:#191724
	--color=spinner:#f6c177,info:#9ccfd8,separator:#403d52
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"
export NNN_TRASH=1
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export BAT_THEME="TwoDark"
export LESS="-I -R"
export NNN_TERMINAL=$TERMINAL
export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG="p:preview-tui"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gcr/ssh"
export PRETTIERD_DEFAULT_CONFIG="$XDG_CONFIG_HOME/prettierd/.prettierrc"
export LS_COLORS=$(vivid generate one-dark)
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export CARGO_BIN="$CARGO_HOME/bin"
export FLY_CONFIG_DIR="$XDG_STATE_HOME"/fly
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export WINEPREFIX="$XDG_DATA_HOME"/wine
export W3M_DIR="$XDG_DATA_HOME"/w3m
export SQLITE_HISTORY="$XDG_CACHE_HOME"/sqlite_history
export REDISCLI_HISTFILE="$XDG_DATA_HOME"/redis/rediscli_history
export XCURSOR_PATH=/usr/share/icons:$XDG_DATA_HOME/icons
export DVDCSS_CACHE="$XDG_DATA_HOME"/dvdcss
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass

typeset -U path PATH
path=($MY_SCRIPTS $STATUSBAR_SCRIPTS $PNPM_HOME $CARGO_BIN $GOBIN ~/.local/bin ~/.local/share/nvim/mason/bin ~/.detaspace/bin ~/.cache/.bun/bin $path)
export PATH

