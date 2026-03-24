FROM ruby:4.0-alpine

# Fetch/install gems
RUN mkdir -p /opt/gems
COPY Gemfile Gemfile.lock /opt/gems/
WORKDIR /opt/gems
RUN bundle config set --local deployment true && \
    bundle config set --local without development && \
    bundle install

ENV APP_DIR=/usr/src/app

COPY . $APP_DIR
RUN mkdir -p $APP_DIR/vendor && ln -s /opt/gems/vendor/bundle $APP_DIR/vendor/bundle

WORKDIR $APP_DIR
CMD ["./bin/run"]
