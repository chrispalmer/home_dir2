#! /bin/bash

ruby_version=${1:-'1.9.3-p194'}

if ! command -v rvm >/dev/null; then
	\curl -L https://get.rvm.io | bash -s stable
	source ~/.bashrc
	source ~/.bash_profile
fi

# This is a list of requirements taken from the output of 'rvm requirements'.
sudo /usr/bin/apt-get -y -q install build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev \
sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion pkg-config

rvm install $ruby_version
rvm use $ruby_version
rvm alias create default $ruby_version

gem install bundler
gem install rake


