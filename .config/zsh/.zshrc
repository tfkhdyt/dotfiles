# zmodload zsh/zprof
# source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

autoload -Uz promptinit compinit
promptinit
compinit
# prompt pure

# zle -N up-line-or-beginning-search
# zle -N down-line-or-beginning-search

zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

# bindkey '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"
key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete
[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word

# [[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
# [[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down

bindkey '\eOA' history-substring-search-up # or ^[OA
bindkey '\eOB' history-substring-search-down # or ^[OB
bindkey '^R' history-incremental-search-backward

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

alias ls="eza --icons --group-directories-first"
alias ll="eza -lbh --icons --group-directories-first"
alias killorphans="yay -Qtdq | yay -Rns -"
alias yt2mp3="yt-dlp -f 'ba' -x --audio-format mp3"
alias mnt-windows="sudo mount -t ntfs3 -o noatime /dev/nvme0n1p3 /mnt/windows"
alias umnt-windows="sudo umount /mnt/windows"
alias cal="cal --monday"
alias make="make -j $(nproc)"
alias darkhouse="CHROME_PATH=/usr/bin/brave unlighthouse --config-file $XDG_CONFIG_HOME/unlighthouse/config.ts"
# alias procs="procs --theme dark"
alias git-push='git push -u origin HEAD'
alias pass-sync='pass git pull && pass git push'
alias duf='duf --hide special'
alias adb='HOME="$ANDROID_HOME" adb'
alias xrdb='xrdb -load "$XDG_CONFIG_HOME/X11/xresources"'
alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'

lfcd () {
    # `command` is needed in case `lfcd` is aliased to `lf`
    cd "$(command lf -print-last-dir "$@")"
}

function ya() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

bindkey \^K kill-line
bindkey '^[d' kill-word

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/doc/pkgfile/command-not-found.zsh
source ~/.config/zsh/plugins/zsh-abbr.zsh

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
