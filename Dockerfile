FROM ruby:2.2.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /bindit
WORKDIR /bindit
ADD Gemfile /bindit/Gemfile
ADD Gemfile.lock /bindit/Gemfile.lock
RUN bundle install
ADD . /bindit

FROM ubuntu:12.04
ENV PHANTOMJS_VERSION=1.9.8
RUN \
  cd /usr/local/share && \
  wget https://phantomjs.googlecode.com/files/phantomjs-${PHANTOMJS_VERSION}-linux-i686.tar.bz2 && \
  tar xvf phantomjs-${PHANTOMJS_VERSION}-linux-i686.tar.bz2 && \
  rm phantomjs-${PHANTOMJS_VERSION}-linux-i686.tar.bz2 && \
  ln -s /usr/local/share/phantomjs-${PHANTOMJS_VERSION}-linux-i686/bin/phantomjs /usr/local/bin/phantomjs
CMD ["/usr/bin/phantomjs"]
