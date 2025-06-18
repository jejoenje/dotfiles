#alias ls="ls -haltr --color=auto"
alias vi=nvim
alias vim=nvim
alias hermelijn="ssh jejoenje@hermelijn -p 2402"
alias cleuch="ssh jejoenje@ochil-ds.co.uk -p 2403"
alias "tm_nvim"="tmux attach -t nvim"
alias ls="ls -goha --group-directories-first --time-style='+%Y-%m-%d %H:%M:%S' --sort='time' -r --color=auto"

v() { nvim -o "$(fzf)"; }
