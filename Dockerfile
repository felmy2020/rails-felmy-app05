
FROM ruby:2.7.5

ENV RAILS_ENV=production

ARG RAILS_MASTER_KEY
ENV RAILS_MASTER_KEY ${RAILS_MASTER_KEY}

#apt-keyとdevconfのエラー対策
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn
ENV DEBCONF_NOWARNINGS=yes

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq \
  && apt-get install -y nodejs yarn mariadb-client
WORKDIR /app
COPY ./src /app
RUN bundle config --local set path 'vendor/bundle' \
  && bundle install

RUN bundle exec rake secret
RUN yarn install --check-files
RUN bundle exec rails webpacker:compile

COPY start.sh /start.sh
RUN chmod 744 /start.sh
CMD ["sh", "/start.sh"]
