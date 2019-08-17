alias ls='ls -G'
#alias ls='gls --color=auto'
alias l='ls -all'
alias ll='ls -l'
alias grep='grep --color'
alias vi='vim'

#git short cut
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gp='git push'
alias gl='git pull'
alias gst='git status'

# Commit (c)
alias gc='git commit --verbose'
alias gca='git commit --verbose --all'
alias gcm='git commit --message'
alias gco='git checkout'
alias gcO='git checkout --patch'
alias gcf='git commit --amend --reuse-message HEAD'
alias gcF='git commit --verbose --amend'
alias gcp='git cherry-pick --ff'
alias gcP='git cherry-pick --no-commit'
alias gcr='git revert'
alias gcR='git reset "HEAD^"'
alias gcs='git show'
alias gcl='git-commit-lost'


PATH=$PATH:$HOME/bin/

export SVN_EDITOR=vim
