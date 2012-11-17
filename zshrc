# Jason Wells' .zshrc
# http://flipstock.net

# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

setopt share_history				# share command history data
setopt append_history				# append history list to history file (rather than overwriting)
setopt inc_append_history			# add new history lines to the history file in real-time
setopt extended_history				# save beginning/ending history timestamps
setopt hist_expire_dups_first		# if history's full, expire old duplicates first
setopt hist_ignore_dups				# don't add commands if they're same as the last command
setopt hist_ignore_space			# if you type a space first, the cmd won't be added to the history

# Auto cd
setopt auto_cd						# if you type a dir name in, cd to that dir
setopt cdable_vars					# if the argument to cd isn't a dir, expand as if it started with ~

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

# Correction
setopt correct						# spellcheck commands (not arguments)

# Globbing
setopt extended_glob				# globbing goodness

# Get zmv set up
autoload zmv

# Prompt user@host:directory$
PROMPT='%n@%m:%c%# '

# Alias Definitions
if [ -f ~/.aliases ]; then
   . ~/.aliases
fi

# Path

## Local Installs
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

## Oracle
if [ -d /Applications/Utilities/instantclient ]; then
	 export DYLD_LIBRARY_PATH=/Applications/Utilities/instantclient
	 export ORACLE_HOME=/Applications/Utilities/instantclient
   export PATH=$PATH:/Applications/Utilities/instantclient
fi

## MAMP/MySQL
if [ -d /Applications/MAMP ]; then
   export MAMP=/Applications/MAMP/Library
   export PATH=$PATH:$MAMP/bin
fi

## Editor
if [ -d /Applications/TextMate.app ]; then
   export EDITOR='mate -w'
else
   export EDITOR=vim
fi

## rbenv
if [ -d $HOME/.rbenv ]; then
   eval "$(rbenv init -)"
   export PATH="$HOME/.rbenv/bin:$PATH"
fi