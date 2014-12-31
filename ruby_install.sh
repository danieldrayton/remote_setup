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