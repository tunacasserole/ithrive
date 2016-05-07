FROM ubuntu:trusty
RUN apt-get update
RUN apt-get install -y firefox xvfb python-pip
RUN pip install selenium
CMD (Xvfb :99 &)

FROM ruby:2.2.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /bindit
WORKDIR /bindit
ADD Gemfile /bindit/Gemfile
ADD Gemfile.lock /bindit/Gemfile.lock
RUN bundle install
ADD . /bindit
