FROM ruby:2.7.7

WORKDIR /mysql_operations
COPY Gemfile /mysql_operations/Gemfile
COPY Gemfile.lock /mysql_operations/Gemfile.lock
RUN bundle install

CMD ["rails", "server", "-b", "0.0.0.0"]