#symbolic link subl for use from command line
ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" usr/local/bin/subl
export EDITOR='subl'

#install package control & the following packages:
#Rails Tutorial snippets
#Sublime Text Alternative Auto-completion
#SublimeERB
#RubyTest

#install Homebew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew doctor
brew update

#install rvm or rbenv
brew install rbenv ruby-build

#open .bash_profile and add:
eval "$(rbenv init -)"

#run after installing a version or a gem - allows access to command from cli
rbenv rehash

#set global version
rbenv global 2.1.2

#rbenv versions
#rbenv uninstall 2.1.2

gem update --system

gem install bundler

~/.gemrc
install: --no-r-doc --no-ri
update: --no-r-doc --no-ri

gem install rails --version 4.x.x
