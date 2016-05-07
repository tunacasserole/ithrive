FROM ruby:2.2.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /bindit
WORKDIR /bindit
ADD Gemfile /bindit/Gemfile
ADD Gemfile.lock /bindit/Gemfile.lock
RUN bundle install
ADD . /bindit

FROM ubuntu
RUN apt-get update && apt-get install -y x11vnc xvfb firefox
RUN mkdir /.vnc
RUN x11vnc -storepasswd 1234 ~/.vnc/passwd
RUN bash -c 'echo "firefox" >> /.bashrc'
EXPOSE 5900
CMD    ["x11vnc", "-forever", "-usepw", "-create"]
