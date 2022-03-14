FROM ruby:3.1.1

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN apt-get update -y
RUN apt-get install -y \
      libqt5webkit5-dev \
      build-essential \
      qtbase5-dev \
      qtchooser \
      qt5-qmake \
      qtbase5-dev-tools \
      xvfb

ENV app /app
ENV BUNDLE_PATH /gems
ENV GEM_HOME /gems

COPY Gemfile* $app/

ENV PATH="$PATH:$BUNDLE_PATH/bin"

COPY . $app/
