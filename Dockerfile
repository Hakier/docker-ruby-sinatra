FROM cloudgear/ruby:2.1

MAINTAINER Erika Pauwels <erika.pauwels@gmail.com>

ENV RACK_ENV production
ENV MAIN_APP_FILE web.rb

RUN mkdir -p /usr/src/app && \
    apt-get update && \
    apt-get install -y ruby-sass && \
    gem install listen -v 0.7.3 && \
    gem install --version '~> 0.9' rb-inotify

ADD startup.sh /

WORKDIR /usr/src/app

EXPOSE 80

CMD ["/bin/bash", "/startup.sh"]
