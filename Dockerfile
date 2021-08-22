FROM ruby:2.6.6

ENV LANG C.UTF-8

RUN apt-get update && apt-get install -y npm && npm install --global yarn && \
    apt-get install -y build-essential \
    nodejs \
    default-mysql-client

RUN apt-get install tzdata

ENV APP_HOME /myapp
RUN mkdir $APP_HOME
WORKDIR /myapp

ADD Gemfile $APP_HOME/Gemfile
ADD Gemfile.lock $APP_HOME/Gemfile.lock
ENV BUNDLE_PATH $APP_HOME/vendor/bundle
ENV BUNDLE_APP_CONFIG $APP_HOME/.bundle
RUN mkdir $APP_HOME/.bundle

RUN bundle install
EXPOSE 3000
