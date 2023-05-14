FROM ruby:3.1.1-alpine3.15

RUN apk add --update build-base bash bash-completion libffi-dev tzdata postgresql-client postgresql-dev nodejs npm yarn

RUN mkdir /x-disk
WORKDIR /x-disk
ADD Gemfile /x-disk/Gemfile
RUN bundle install
ADD . /x-disk
