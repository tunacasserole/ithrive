
FROM ruby:2.2.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /bindit
WORKDIR /bindit
ADD Gemfile /bindit/Gemfile
ADD Gemfile.lock /bindit/Gemfile.lock
RUN bundle install
ADD . /bindit

FROM ubuntu:14.04
RUN apt-get update
RUN apt-get -y install firefox
RUN apt-get -y install xvfb

Xvfb :99 &
export DISPLAY=:99
