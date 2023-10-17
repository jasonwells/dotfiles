# Jason Wells' .zshrc
# http://flipstock.net

# oh-my-zsh
export ZSH=/Users/jason/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git wd history-substring-search)
source $ZSH/oh-my-zsh.sh

# Path
if [ -x /usr/libexec/path_helper ]; then
    eval `/usr/libexec/path_helper -s`
fi

# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

setopt share_history            # share command history data
setopt append_history           # append history list to history file (rather than overwriting)
setopt inc_append_history       # add new history lines to the history file in real-time
setopt extended_history         # save beginning/ending history timestamps
setopt hist_expire_dups_first   # if history's full, expire old duplicates first
setopt hist_ignore_dups         # don't add commands if they're same as the last command
setopt hist_ignore_space        # if you type a space first, the cmd won't be added to the history

# Auto cd
setopt auto_cd                  # if you type a dir name in, cd to that dir
setopt cdable_vars              # if the argument to cd isn't a dir, expand as if it started with ~

# Vi bindings
bindkey -v

# Pager
export PAGER=less

# Don't beep!
unsetopt beep

# UTF-8
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export LC_CTYPE=C
export NLS_LANG='AMERICAN_AMERICA.UTF8' # Oracle specific

# Correction
setopt correct						# spellcheck commands (not arguments)

# Globbing
setopt extended_glob				# globbing goodness

# Get zmv set up
autoload zmv

# Prompt user@host:directory$
#PROMPT='%n@%m:%c%# '

# Alias Definitions
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

if [ -d /opt/homebrew ]; then
  export PATH=/opt/homebrew/bin:$PATH
fi

# Java
#if [ -f /usr/libexec/java_home ]; then
    #export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
#fi

# psql
if [ -d /Applications/Postgres.app ]; then
    export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
fi

# Path

## Local Installs
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

## Oracle
if [ -d /Applications/Utilities/instantclient ]; then
    export ORACLE_HOME=/Applications/Utilities/instantclient
    export OCI_INCLUDE_DIR=$ORACLE_HOME/sdk/include/
    export OCI_LIB_DIR=$ORACLE_HOME
    export DYLD_LIBRARY_PATH=/Applications/Utilities/instantclient
    # export TNS_ADMIN=$ORACLE_HOME/network/admin
    export PATH=$PATH:$ORACLE_HOME
fi

## MAMP/MySQL
if [ -d /Applications/MAMP ]; then
    export MAMP=/Applications/MAMP/Library
    export PATH=$PATH:$MAMP/bin
fi

## Editor
if [ -d ~/Applications/MacVim ]; then
    export EDITOR='gvim -f'
else
    export EDITOR='vim'
fi

## npm
if [ -d /usr/local/share/npm ]; then
    export PATH=/usr/local/share/npm/bin:$PATH
fi

## rbenv
if [ -d $HOME/.rbenv ]; then
    eval "$(rbenv init -)"
    export PATH="$HOME/.rbenv/bin:$PATH"
    export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@3)" # use @1.1 if ruby < 3
fi

## gopath
if [ -d $HOME/go ]; then
    export GOPATH=$HOME/go
    export PATH="$GOPATH/bin:$PATH"
fi

# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# rack environment
export RACK_ENV=development
export TERM_CHILD=1

plugins=(wd)

# Node version manager
if [ -d ~/.nvm ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
fi

# Python version manager
if command -v pyenv 1>/dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
  export PATH="/Users/jason/.local/bin:$PATH"
fi

# added by Snowflake SnowSQL installer v1.0
if [ -d /Applications/SnowSQL.app ]; then
  export PATH=/Applications/SnowSQL.app/Contents/MacOS:$PATH
fi

if [ -d /Applications/MacVim.app/Contents/bin ]; then
  export PATH=/Applications/MacVim.app/Contents/bin:$PATH
fi

source ~/.secrets
source ~/.functions

# used with our Ruby snowflake projects
if [ -f ~/.odbc.ini ]; then
  export ODBC_CONFIGURED=true
fi

# bun completions
[ -s "/Users/jason/.bun/_bun" ] && source "/Users/jason/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# playdate
export PLAYDATE_SDK_PATH="$HOME/Developer/PlaydateSDK"
export PATH="/opt/homebrew/opt/libiodbc/bin:$PATH"
