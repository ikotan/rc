# .bashrc
# ----------------------------
# Source global definitions
# ----------------------------
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# ----------------------------
# APPDRIVER
# ----------------------------
if [ -f ~/.bashrc.appdriver ]; then
    source ~/.bashrc.appdriver
fi

# ----------------------------
# FUNCTION
# ----------------------------
if [ -f ~/.bashrc.function ]; then
    source ~/.bashrc.function
fi

# ----------------------------
# libevent tmux nodebrew perlbrew rubyenv
# ----------------------------
export LD_LIBRARY_PATH=/usr/local/libevent/lib
export PATH=${PATH}:/usr/local/tmux/bin
export PATH=$HOME/.nodebrew/current/bin:$PATH
source ~/perl5/perlbrew/etc/bashrc
export PATH="$HOME/.rbenv/bin:$PATH"  && eval "$(rbenv init -)"

# ----------------------------
# VIM SVN, GIT
# ----------------------------
PATH="$PATH":/usr/local/bin/vim""
export SVN_EDITOR=vim
export EDITOR=vim

# ----------------------------
# git-flowの補完
# ----------------------------
source /usr/local/bin/git-flow-completion.bash

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
# PROMPT
# ----------------------------
# export PS1='$(check-shell-command):\[\033[1;35m\]\t\[\033[00m\]:\[\033[1;36m\]\w\n\[\033[1;32m\]\u\[\033[1;31m\]$(__perl_version)$(__git_branch_ps1)\[\033[00m\]->'
export PS1='$(_check-shell-command) > \[\033[1;33m\]\t\[\033[00m\] \[\033[1;36m\]$(_current_path)\[\033[1;35m\]$(_git_branch_ps1)\n\[\033[1;32m\]\u\[\033[1;31m\]$(_perl_version)\[\033[00m\]->'


# ----------------------------
# Color
# ----------------------------

         RED="\033[0;31m"
      YELLOW="\033[0;33m"
LIGHT_YELLOW="\033[1;33m"
       GREEN="\033[0;32m"
        BLUE="\033[0;34m"
LIGHT_PURPLE="\033[1;35m"
   LIGHT_RED="\033[1;31m"
 LIGHT_GREEN="\033[1;32m"
       WHITE="\033[1;37m"
  LIGHT_GRAY="\033[0;37m"
  COLOR_NONE="\e[0m"

# ----------------------------
# 顔文字作成
# ----------------------------
_check-shell-command() {
  if [ $? -eq 0 ]; then
    face="${LIGHT_PURPLE}(っ＾ω＾)っ"
  else
    face="${LIGHT_YELLOW}（；￣Д￣）"
  fi
  echo -e "${face}\e[m"
}

# ----------------------------
# カレントディレクトリパス表示
# ----------------------------

_current_path() {
    local path=`pwd | sed -e 's/\// > /g'`
    echo $path
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

_my_svn_ps1(){
    local svn_branch=`_my_parse_svn_branch2`
    test "${svn_branch}" == "" || echo "\(${svn_branch}\)" | xargs printf
}

# ----------------------------
# gitブランチ表示
# ----------------------------
_git_branch_ps1(){
    local git_branch=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    if [ $git_branch ]; then
        echo ' : '$git_branch
    fi
    # git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# ----------------------------
# perlバージョン表示
# ----------------------------
_perl_version() {
    local perl_version=`perlbrew list | sed -ne 's#^* ##p' | cut -d '-' -f 2`
    echo "(perl:${perl_version})"
}

# ----------------------------
# User specific aliases and functions
# ----------------------------
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls -F --color=auto'
alias lsa='ls -a --color=auto'
alias vi='vim'
alias ag='ag -i'
alias grep='grep --color=auto'
alias bashrc='vim ~/.bashrc'
alias vimrc='vim ~/.vimrc'
alias tmux='tmux -2'
alias cassandra='sudo /usr/local/cassandra/bin/cassandra'
alias mysql='mysql -u root'

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
