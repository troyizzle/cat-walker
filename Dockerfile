FROM ruby:3.0.1-alpine

RUN apk update && apk upgrade && apk add --update --no-cache \
    build-base \
    bash    \
    git \
    nodejs \
    postgresql-dev \
    tzdata \
    yarn && rm -rf /var/cache/apk/*

WORKDIR /app/
COPY . /app/

ENV BUNDLE_PATH /gems
RUN yarn install
RUN bundle install
RUN bundle exec rails assets:precompile

CMD ["./entrypoint.sh"]
