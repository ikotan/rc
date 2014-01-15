# .bashrc
# ----------------------------
# Source global definitions
# ----------------------------
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# ----------------------------
# show git branch
# ----------------------------
if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi

if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
fi

# ----------------------------
# git-flowの補完
# ----------------------------
source /usr/local/bin/git-flow-completion.bash

function check-shell-command {
  if [ $? -eq 0 ]; then
    face="\e[1;36m(っ＾ω＾)っ"
  else
    face="\e[1;33m（；￣Д￣）"
  fi
  echo -e "${face}\e[m"
}

# ----------------------------
# show git branch
# ----------------------------
GIT_PS1_SHOWDIRTYSTATE=true

# ----------------------------
# SVNリビジョン表示
# ----------------------------
_my_parse_svn_branch2() {
    local LANG=C
    local svn_url=`svn info 2>/dev/null | sed -ne 's#^URL: ##p'`
    local svn_repository_root=`svn info 2>/dev/null | sed -ne 's#^Repository Root: ##p'`
    local svn_revision=`svn info 2>/dev/null | sed -ne 's#^Revision: ##p'`
#    echo $svn_url | sed -e 's#^'"${svn_repository_root}"'##g' | awk '{print $1}'
    echo $svn_revision | awk '{print $1}'
}

__my_svn_ps1(){
    local svn_branch=`_my_parse_svn_branch2`
    test "${svn_branch}" == "" || echo "\(${svn_branch}\)" | xargs printf
}

# ----------------------------
# gitブランチ表示
# ----------------------------
__git_branch_ps1(){
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}


# ----------------------------
# perlバージョン表示
# ----------------------------
__perl_version() {
    local perl_version=`perlbrew list | sed -ne 's#^* ##p' | cut -d '-' -f 2`
    echo "(perl:${perl_version})"
}

# ----------------------------
# PROMPT
# ----------------------------
# export PS1='$(check-shell-command):\[\033[1;35m\]\t\[\033[00m\]:\[\033[1;34m\]\w\n\[\033[1;32m\]\u\[\033[1;31m\]$(__git_ps1)\[\033[00m\]->'
export PS1='$(check-shell-command):\[\033[1;35m\]\t\[\033[00m\]:\[\033[1;34m\]\w\n\[\033[1;32m\]\u\[\033[1;31m\]$(__perl_version)$(__git_ps1)\[\033[00m\]->'

# ----------------------------
# APPDRIVER
# ----------------------------
export TACHYON_WEBSITE_HOME=.
export LUXON_WEBSITE_HOME=.
export NUCLEUS_WEBSITE_HOME=.

# ----------------------------
# libevent tmux nodebrew perlbrew
# ----------------------------
export LD_LIBRARY_PATH=/usr/local/libevent/lib
export PATH=${PATH}:/usr/local/tmux/bin
export PATH=$HOME/.nodebrew/current/bin:$PATH
source ~/perl5/perlbrew/etc/bashrc

# ----------------------------
# SVN, GIT
# ----------------------------
export SVN_EDITOR=vim
export EDITOR=vim

# ----------------------------
# vim PATH
# ----------------------------
PATH="$PATH":/usr/local/bin/vim""

# ----------------------------
# User specific aliases and functions
# ----------------------------
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias lsa='ls -a'
alias vi='vim'
alias ag='ag -i'
alias grep='grep --color=auto'
alias bashrc='vim ~/.bashrc'
alias vimrc='vim ~/.vimrc'
alias tmux='tmux -2'
alias cassandra='sudo /usr/local/cassandra/bin/cassandra'

export HISTSIZE=100000
export HISTFILESIZE=100000
export LANG=ja_JP.UTF-8

# cdを実行後。lsを実行する
# function cd() {
  # builtin cd $@ && ls;
# }

stty stop undef
# set -o vi

# C-nで履歴検索
bind '"\C-n": history-search-forward'
# C-pで履歴検索
bind '"\C-p": history-search-backward'
