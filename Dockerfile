FROM ubuntu:trusty
RUN echo “deb http://ppa.launchpad.net/mozillateam/firefox-next/ubuntu trusty main” > /etc/apt/sources.list.d//mozillateam-firefox-next-trusty.list
RUN apt-get update
RUN apt-get install -y firefox xvfb python-pip
RUN pip install selenium
RUN mkdir -p /root/selenium_wd_tests
ADD sel_wd_new_user.py /root/selenium_wd_tests
ADD xvfb.init /etc/init.d/xvfb
RUN chmod +x /etc/init.d/xvfb
RUN update-rc.d xvfb defaults
CMD (service xvfb start; export DISPLAY=:10; python /root/selenium_wd_tests/sel_wd_new_user.py)

FROM ruby:2.2.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /bindit
WORKDIR /bindit
ADD Gemfile /bindit/Gemfile
ADD Gemfile.lock /bindit/Gemfile.lock
RUN bundle install
ADD . /bindit
