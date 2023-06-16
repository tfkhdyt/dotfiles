set -x BROWSER librewolf
set -x TERMINAL footclient

set -x XDG_DATA_HOME "$HOME/.local/share"
set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_STATE_HOME "$HOME/.local/state"
set -x XDG_CACHE_HOME "$HOME/.cache"
set -x PNPM_HOME "/home/tfkhdyt/.local/share/pnpm"
set -x MY_SCRIPTS "$HOME/.dotfiles/scripts"
set -x STATUSBAR_SCRIPTS "$HOME/.dotfiles/scripts/statusbar"
set -x HISTSIZE 10000
set -x SAVEHIST 10000
set -x EDITOR nvim
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
set -x QT_QPA_PLATFORMTHEME qt6ct
# set -x QT_STYLE_OVERRIDE kvantum
set -x DATE (date -I)
# set -x PRETTIERD_DEFAULT_CONFIG "$HOME/.config/lvim/prettierd/.prettierrc"
set -x CARGO_BIN "$HOME/.cargo/bin/"
set -x GOBIN "$XDG_DATA_HOME/go/bin"
set -x PATH $PATH $MY_SCRIPTS $STATUSBAR_SCRIPTS $PNPM_HOME $CARGO_BIN $GOBIN "$HOME/.local/bin" "$HOME/.local/share/nvim/mason/bin" 
set -x FZF_DEFAULT_OPTS " \
--color=bg+:#3c3836,bg:#282828,spinner:#ebdbb2,hl:#cc241d \
--color=fg:#458588,header:#fb4934,info:#98971a,pointer:#ebdbb2 \
--color=marker:#ebdbb2,fg+:#d5c4a1,prompt:#83a598,hl+:#cc241d"

set -x NNN_TRASH 1
set -x DOCKER_CONFIG "$XDG_CONFIG_HOME/docker"
set -x BAT_THEME "gruvbox-dark"
set -x LESS "-I -R"
set -x NNN_TERMINAL $TERMINAL
set -x NNN_FIFO /tmp/nnn.fifo
set -x NNN_PLUG "p:preview-tui"
set -x _ZO_MAXAGE 5000
set -x LS_COLORS $(vivid generate gruvbox-dark)

# aliases
alias ls="exa --icons --group-directories-first"
alias ll="exa -lbh --icons --group-directories-first"
alias killorphans="yay -Qtdq | yay -Rns -"
alias yt2mp3="yt-dlp -f 'ba' -x --audio-format mp3"
alias mnt-windows="doas mount -t ntfs3 -o noatime /dev/nvme0n1p3 /mnt/windows"
alias umnt-windows="doas umount /mnt/windows"
alias cal="cal --monday"
alias make="make -j $(nproc)"
alias darkhouse="CHROME_PATH=/usr/bin/brave unlighthouse --config-file $XDG_CONFIG_HOME/unlighthouse/config.ts"
# alias procs="procs --theme dark"

# yay aliases
abbr -a yr yay -Rns
abbr -a yi yay -S
abbr -a yss yay -Ss
abbr -a ysi yay -Si
abbr -a yqs yay -Qs
abbr -a yqi yay -Qi
abbr -a yql yay -Ql

# paru aliases
# abbr -a pr paru -Rns
# abbr -a pi paru -S
# abbr -a pss paru -Ss
# abbr -a psi paru -Si
# abbr -a pqs paru -Qs
# abbr -a pqi paru -Qi
# abbr -a pql paru -Ql

abbr -a pctr pactree -o
abbr -a pctrr pactree -r -o

abbr -a dar dart run
abbr -a timestamp date +%Y-%m-%dT%H-%M-%S
abbr -a pg ping -O
abbr -a lv nvim

abbr -a sc doas systemctl
abbr -a scu systemctl --user
abbr -a jr doas journalctl
abbr -a jru journalctl --user

abbr -a lg lazygit
abbr -a ar2 aria2c

abbr -a v nvim
abbr -a nts nvim ~/notes/
abbr -a kdc kdeconnect-cli
abbr -a sudo doas
abbr -a g git
abbr -a tt taskwarrior-tui
abbr -a p pnpm

if status is-interactive
  # Commands to run in interactive sessions can go here
  starship init fish | source
  zoxide init fish | source
  # atuin init fish --disable-up-arrow | source

  # Fish git prompt
  set __fish_git_prompt_showdirtystate 'yes'
  set __fish_git_prompt_showstashstate 'yes'
  set __fish_git_prompt_showuntrackedfiles 'yes'
  set __fish_git_prompt_showupstream 'yes'
  set __fish_git_prompt_color_branch yellow
  set __fish_git_prompt_color_upstream_ahead green
  set __fish_git_prompt_color_upstream_behind red

  # Status Chars
  set __fish_git_prompt_char_dirtystate '✚'
  set __fish_git_prompt_char_stagedstate '●'
  set __fish_git_prompt_char_untrackedfiles '☡'
  set __fish_git_prompt_char_stashstate '⚑'
  set __fish_git_prompt_char_upstream_ahead '↑'
  set __fish_git_prompt_char_upstream_behind '↓'
  set __fish_git_prompt_char_upstream_equal ''
end
