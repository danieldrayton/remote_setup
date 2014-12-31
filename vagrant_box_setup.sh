#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install curl -y

sudo apt-get install git -y

sudo apt-get install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev -y
sudo apt-get install nodejs -y

sudo apt-get install libsqlite3-dev -y
sudo apt-get install debconf-utils -y

#automates the install of mysql-server - sets root password to rails
echo "mysql-server mysql-server/root_password password rails" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password rails" | debconf-set-selections

sudo apt-get install lamp-server^ -y

sudo apt-get install libmysqlclient-dev -y

#automates the install of phpmyadmin - sets all passwords to rails
echo 'phpmyadmin phpmyadmin/dbconfig-install boolean true' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/app-password-confirm password rails' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/mysql/admin-pass password rails' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/mysql/app-pass password rails' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2' | debconf-set-selections
sudo apt-get install phpmyadmin -y #if done manually be sure to spacebar for * next to apache2, tab, enter

sudo echo "ServerName vagrant" >> /etc/apache2/apache2.conf
sudo echo "EnableSendFile Off" >> /etc/apache2/apache2.conf
sudo echo "Include /etc/phpmyadmin/apache.conf" >> /etc/apache2/apache2.conf

sudo service apache2 restart

#install postgresql
sudo /usr/sbin/update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
sudo apt-get install postgresql libpq-dev -y

sudo mkdir -p /usr/local/pgsql/data
sudo chown postgres:postgres /usr/local/pgsql/data
sudo su postgres
/usr/lib/postgresql/9.3/bin/initdb -D /usr/local/pgsql/data
createuser -s vagrant
exit
psql postgres -c "ALTER ROLE vagrant CREATEDB"

#install rbenv & ruby-build
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

#reload the ~/.bashrc file to update the path
source ~/.bashrc

#install ruby
rbenv install 2.2.0

rbenv local 2.2.0
rbenv global 2.2.0

echo 'install: --no-r-doc --no-ri' >> ~/.gemrc
echo 'update: --no-r-doc --no-ri' >> ~/.gemrc

rbenv rehash

gem update --system
gem install bundler
gem install rails -v '4.2.0'
gem install pg
gem install mysql2
gem install sass

rbenv rehash

#install heroku toolkit - will need to set it up later
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
#setup info:
#heroku login

#if you want any environment specific setup (EDITOR, etc) for the vagrant user, use this line:
#su -c "source user-config.sh" vagrant

#consider running:
#sudo apt-get clean
#if you want to clean up the packages and save disk space