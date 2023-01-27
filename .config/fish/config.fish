# starship init fish | source

set -x XDG_DATA_HOME "$HOME/.local/share"
set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_STATE_HOME "$HOME/.local/state"
set -x XDG_CACHE_HOME "$HOME/.cache"
set -x PNPM_HOME "/home/tfkhdyt/.local/share/pnpm"
set -x MY_SCRIPTS "$HOME/.dotfiles/scripts"
set -x HISTSIZE 10000
set -x SAVEHIST 10000
set -x EDITOR lvim
set -x COMPOSER_HOME "$XDG_CONFIG_HOME"/composer/vendor/bin
set -x ANDROID_HOME "$XDG_DATA_HOME"/android
set -x HISTFILE "$XDG_STATE_HOME"/bash/history
set -x GNUPGHOME "$XDG_DATA_HOME"/gnupg
set -x GOPATH "$XDG_DATA_HOME"/go
set -x GTK2_RC_FILES "$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
set -x KDEHOME "$XDG_CONFIG_HOME"/kde 
set -x LESSHISTFILE "$XDG_CACHE_HOME"/less/history
set -x MYSQL_HISTFILE "$XDG_DATA_HOME"/mysql_history
set -x NODE_REPL_HISTORY "$XDG_DATA_HOME"/node_repl_history
set -x PSQL_HISTORY "$XDG_DATA_HOME/psql_history"
set -x RUSTUP_HOME "$XDG_DATA_HOME"/rustup
set -x WINEPREFIX "$XDG_DATA_HOME"/wine
set -x QT_QPA_PLATFORMTHEME qt5ct
set -x DATE (date -I)
set -x PRETTIERD_DEFAULT_CONFIG "$HOME/.config/lvim/prettierd/.prettierrc"
set -x CARGO_BIN "$HOME/.cargo/bin/"
set -x GOBIN "$XDG_DATA_HOME/go/bin"
set -x PATH $PATH $MY_SCRIPTS $PNPM_HOME $CARGO_BIN $GOBIN "$HOME/.local/bin"
set -x FZF_DEFAULT_OPTS " \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

set -x NNN_TRASH 1
set -x DOCKER_CONFIG "$XDG_CONFIG_HOME/docker"

# aliases

alias ls="exa --icons --group-directories-first"
alias ll="exa -lbh --icons --group-directories-first"
alias killorphans="yay -Qtdq | yay -Rns -"
alias kdc=kdeconnect-cli
alias yt2mp3="yt-dlp -f 'ba' -x --audio-format mp3"
alias lv=lvim

# yay aliases
alias yr="yay -Rns"
alias yi="yay -S"
alias yss="yay -Ss"
alias ysi="yay -Si"
alias yqs="yay -Qs"
alias yqi="yay -Qi"
alias yql="yay -Ql"

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias pctr="pactree -o"
alias pctrr="pactree -r -o"
alias dar="dart run"
alias lg=lazygit
alias mnt-windows="sudo mount -t ntfs3 -o noatime /dev/nvme0n1p3 /mnt/windows"
alias umnt-windows="sudo umount /mnt/windows"
alias timestamp="date +%Y-%m-%dT%H-%M-%S"
alias http=curlie
alias cal="cal --monday"
alias pg="ping -O"

zoxide init fish | source

abbr -a --position anywhere sc systemctl
abbr -a scu systemctl --user
abbr -a --position anywhere jr journalctl
abbr -a jru journalctl --user

if status is-interactive
    # Commands to run in interactive sessions can go here
end
