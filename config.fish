# Abbreviations
abbr -a gs  git status
abbr -a gco git checkout
abbr -a gc  git commit
abbr -a c   clear


# Aliases
alias vs="open -a 'Visual Studio Code'"
alias dpyc="find . -name '*.pyc' -delete"
alias clean="find . -name '*.sw*' -delete"
alias tmux="tmux -u"
alias activate="source env/bin/activate"
alias wintermute="ssh zabana@163.172.134.19"

# Change caps lock to control
setxkbmap -option caps:ctrl_modifier

# Env vars

set -x GOPATH $HOME/gowork
set -x PATH $GOPATH/bin $PATH
set -x EDITOR /usr/bin/vim
