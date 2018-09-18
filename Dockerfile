FROM starefossen/ruby-node:2-8-stretch
RUN apt-get update -qq && \
    apt-get install -y nano build-essential libpq-dev postgresql-client  && \
    gem install bundler
RUN mkdir /transactable
COPY Gemfile Gemfile.lock /transactable/
WORKDIR /transactable
RUN bundle install
COPY . /transactable