FROM ruby:2.2.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
ADD . /myapp

ENV PHANTOMJS_VERSION=1.9.8
RUN \
  cd /usr/local/share && \
  wget https://phantomjs.googlecode.com/files/phantomjs-${PHANTOMJS_VERSION}-linux-i686.tar.bz2 && \
  tar xvf phantomjs-${PHANTOMJS_VERSION}-linux-i686.tar.bz2 && \
  rm phantomjs-${PHANTOMJS_VERSION}-linux-i686.tar.bz2 && \
  ln -s /usr/local/share/phantomjs-${PHANTOMJS_VERSION}-linux-i686/bin/phantomjs /usr/local/bin/phantomjs
