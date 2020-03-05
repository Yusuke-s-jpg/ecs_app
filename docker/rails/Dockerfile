FROM ruby:2.5.3

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
		                   vim \
                       nodejs \
                       mysql-client

ARG RAILS_ENV
ENV RAILS_ENV ${RAILS_ENV}

RUN mkdir /ecs_app_docker
ENV APP_ROOT /ecs_app_docker
WORKDIR $APP_ROOT

ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle install
ADD . $APP_ROOT

RUN if ["${RAILS_ENV}" = "production"]; then bundle exec rails assets:precompile; else export RAILS_ENV=development; fi
