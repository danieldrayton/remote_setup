#for virtualbox:
#install OS, and guest additions (Cmd+D?)
#change the host key to left shift + left command
#create a ~.Xmodmap file to map cmd to control:
echo
"remove mod4 = Super_L
keysym Super_L = Control_L
add Control = Control_L" > ~.Xmodmap
#run Xmodmap ~.Xmodmap

#install ssh
sudo apt-get install ssh
#ssh into the remote
ssh name@host.com

#download and install chrome and sublime text

#if no sublime-use this configuration to so you can use sublime on your machine through ssh
#setup rmate script - is there a better way to edit a file than echo this line into it? - yes - need to append rather than overwrite >> vs. >???
echo -e "Host localhost\nRemoteForward 52698 127.0.0.1:52698" > ~/.ssh/config

sudo wget -O /usr/local/bin/rsub https://raw.github.com/aurora/rmate/master/rmate
sudo chmod +x /usr/local/bin/rsub


#create a ~.bash_aliases file with at least this:
alias subl='sudo rsub'
#make sure .bash_aliases is sourced in the .bashrc file

#install git:
sudo apt-get install git
#setup git
git config --global user.name "Daniel Drayton"
git config --global user.email "daniel.drayton@gmail.com"

#install any other packages necessary for devleopment...
#ruby, rvm, rails
#heroku toolbelt

