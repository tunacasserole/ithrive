FROM ruby:2.2.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /bindit
WORKDIR /bindit
ADD Gemfile /bindit/Gemfile
ADD Gemfile.lock /bindit/Gemfile.lock
RUN bundle install
ADD . /bindit

FROM realyze/google-chrome-30.0.1599.101

MAINTAINER Keyvan Fatehi <keyvanfatehi@gmail.com>

RUN apt-get update -y -q
RUN apt-get install -y -q unzip xvfb

# Install Chromedriver 2.8
ADD chromedriver_linux64.zip /srv/
RUN unzip /srv/chromedriver_linux64.zip -d /usr/local/bin && rm /srv/chromedriver_linux64.zip

ENV DISPLAY :99

# Install Xvfb init script
ADD xvfb_init /etc/init.d/xvfb
RUN chmod a+x /etc/init.d/xvfb
ADD xvfb-daemon-run /usr/bin/xvfb-daemon-run
RUN chmod a+x /usr/bin/xvfb-daemon-run

# Allow root to execute Google Chrome by replacing launch script
ADD google-chrome-launcher /usr/bin/goo
