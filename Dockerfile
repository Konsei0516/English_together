FROM ruby:2.5.1
RUN apt-get update -qq && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y nodejs
RUN mkdir /app_name
WORKDIR /app_name
COPY Gemfile /app_name/Gemfile
COPY Gemfile.lock /app_name/Gemfile.lock
RUN gem install bundler
RUN bundle install
ADD . /app_name