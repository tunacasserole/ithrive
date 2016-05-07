FROM ubuntu:trusty
RUN git ini
RUN apt-get update
RUN apt-get install -y firefox
RUN apt-get install -y build-essential chrpath git-core libssl-dev libfontconfig1-dev
RUN git clone git://github.com/ariya/phantomjs.git && cd phantomjs
RUN git checkout 1.8
RUN ./build.sh

FROM ruby:2.2.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /bindit
WORKDIR /bindit
ADD Gemfile /bindit/Gemfile
ADD Gemfile.lock /bindit/Gemfile.lock
RUN bundle install
ADD . /bindit

