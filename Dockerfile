

# MYSQL
FROM phusion/baseimage:0.9.9

ENV HOME /root

RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

CMD ["/sbin/my_init"]

# Some Environment Variables
ENV    DEBIAN_FRONTEND noninteractive

RUN sed -i "s/^exit 101$/exit 0/" /usr/sbin/policy-rc.d

# MySQL Installation
RUN apt-get update
RUN echo "mysql-server mysql-server/root_password password root" | debconf-set-selections
RUN echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections
RUN apt-get install -y mysql-server

ADD build/my.cnf    /etc/mysql/my.cnf

RUN mkdir           /etc/service/mysql
ADD build/mysql.sh  /etc/service/mysql/run
RUN chmod +x        /etc/service/mysql/run

RUN mkdir -p        /var/lib/mysql/
RUN chmod -R 755    /var/lib/mysql/

ADD etc/my_init.d/99_mysql_setup.sh /etc/my_init.d/99_mysql_setup.sh
RUN chmod +x /etc/my_init.d/99_mysql_setup.sh

EXPOSE 3306
# END MySQL Installation

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

FROM ubuntu:trusty
ENV TERM linux

RUN apt-get update && apt-get install -y git xorg xvfb firefox dbus-x11 xfonts-100dpi xfonts-75dpi xfonts-cyrillic build-essential chrpath git-core libssl-dev libfontconfig1-dev
ENV DISPLAY :99
ENV DEBIAN_FRONTEND noninteractive
RUN git config --global user.name "Aaron Henderson" && git config --global user.email "aaron@buildit.io"
RUN git clone git://github.com/ariya/phantomjs.git && cd phantomjs
ADD run.sh /run.sh
RUN chmod a+x /run.sh
CMD /run.sh

FROM ruby:2.2.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /bindit
WORKDIR /bindit
ADD Gemfile /bindit/Gemfile
ADD Gemfile.lock /bindit/Gemfile.lock
RUN bundle install
RUN pwd
ADD . /bindit
RUN rake db:migrate
