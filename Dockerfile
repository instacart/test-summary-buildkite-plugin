FROM ruby:3.3

# Fetch/install gems
RUN mkdir -p /opt/gems
COPY Gemfile Gemfile.lock /opt/gems/
WORKDIR /opt/gems
ENV BUNDLE_DEPLOYMENT="true"
ENV BUNDLE_WITHOUT="development,test"
RUN bundle install

ENV APP_DIR=/usr/src/app

COPY . $APP_DIR
RUN mkdir -p $APP_DIR/vendor && ln -s /opt/gems/vendor/bundle $APP_DIR/vendor/bundle

WORKDIR $APP_DIR
CMD ["./bin/run"]
