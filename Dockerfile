# This file is modified for heroku deployment 
# for docker compose update it accordingly

FROM ruby:3.1.2

RUN mkdir /shop 

WORKDIR /shop 

RUN apt-get update && apt-get install -y nodejs

COPY Gemfile /shop/Gemfile

COPY Gemfile.lock /shop/Gemfile.lock 

RUN bundle install --without development:test

# env 
# ENV RAILS_ENV=true 

# ENV RAILS_SERVE_STATIC_FILES=true 

# ENV RAILS_MASTER_KEY=key

# ENV RAILS_LOG_TO_STDOUT=true 

COPY . /shop

CMD ["bundle","exec","rails","s","-e","production"]