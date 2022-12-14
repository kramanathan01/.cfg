# Aliases for common dirs
alias ..="cd .."

# Git Aliases
alias add="git add"
alias commit="git commit"
alias pull="git pull"
alias stat="git status"
alias gdiff="git diff HEAD"
alias vdiff="git difftool HEAD"
alias log="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias cfg="git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias ccam='cfg commit -S -s -a -m'

alias gl='git pull --prune'
alias glg="git log --graph --decorate --oneline --abbrev-commit"
alias glga="glg --all"
alias gp='git push origin HEAD'
alias gpa='git push origin --all'
alias gd='git diff'
alias gc='git commit -S -s'
alias gca='git commit -S -s -a'
alias gco='git checkout'
alias gb='git branch -v'
alias ga='git add'
alias gaa='git add -A'
alias gcm='git commit -S -s -m'
alias gcam='git commit -S -s -a -m'
alias gs='git status -sb'
alias gpr='gp && git pr'
alias glnext='git log --oneline $(git describe --tags --abbrev=0 @^)..@'

# Exa Aliases
if which exa >/dev/null 2>&1; then
	alias ls='exa --icons'
	alias l='exa -la --git --icons'
	alias la='exa -laa --git --icons'
	alias ll='exa -l --git --icons'
else
	if [ "$(uname -s)" = "Darwin" ]; then
		alias ls="ls -FG"
	else
		alias ls="ls -F --color"
	fi
	alias l="ls -lAh"
	alias la="ls -A"
	alias ll="ls -l"
fi

# Jagannatha Hora alias
alias jd="cd ~/.wine/drive_c/Program\ Files\ \(x86\)/Jagannatha\ Hora/data"
alias jh="wine64 ~/.wine/drive_c/Program\ Files\ \(x86\)/Jagannatha\ Hora/bin/jhora.exe&"

# System aliases
alias duf="du -sh * | sort -hr"
alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
alias afk="open -a /System/Library/CoreServices/ScreenSaverEngine.app"