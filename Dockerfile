FROM ruby:2.6.5

ENV DOCKERIZE_VERSION v0.6.1
ENV BUNDLER_VERSION 2.1.4

RUN apt update && apt install apt-transport-https

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
      echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
      apt update && apt install -y yarn

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get install -y nodejs

RUN apt update && apt install -y --no-install-recommends \
      build-essential \
      wget

RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

COPY . /test/wordbook_test
WORKDIR /test/wordbook_test

RUN yarn install
RUN gem install bundler -v "2.1.4"
RUN bundle install