FROM ubuntu:24.04

# set /bin/bash as default shell
SHELL ["/bin/bash", "-l", "-c"]

# set latest ruby version
ENV DEBIAN_FRONTEND=noninteractive \
    RUBY_VERSION_2_3=2.3.8 \
    RUBY_VERSION_2_4=2.4.10 \
    RUBY_VERSION_2_5=2.5.9 \
    RUBY_VERSION_2_6=2.6.10 \
    RUBY_VERSION_2_7=2.7.8 \
    RUBY_VERSION_3_0=3.0.7 \
    RUBY_VERSION_3_1=3.1.4 \
    RUBY_VERSION_3_2=3.2.3 \
    RUBY_VERSION_3_3=3.3.0

# get necessary packages
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    gnupg2 \
    build-essential \
    libssl-dev \
    libreadline-dev \
    openssl \
    zlib1g-dev \
    libsqlite3-dev \
    libgdbm-dev \
    libyaml-dev \
    pkg-config \
    sqlite3 \
    libgmp-dev \
    && apt-get clean

# get rvm 
RUN curl -sSL https://rvm.io/mpapis.asc | gpg --import - && \
    curl -sSL https://rvm.io/pkuczynski.asc | gpg --import - && \
    curl -sSL https://get.rvm.io | bash -s stable


# install ruby

# ruby 2.x needs libssl1.0.0 and libncurses5-dev packages that are deprecated in ubuntu 24   
# rvm install $RUBY_VERSION_2_3 && \
# rvm install $RUBY_VERSION_2_4 && \
# rvm install $RUBY_VERSION_2_5 && \
# rvm install $RUBY_VERSION_2_6 && \
# rvm install $RUBY_VERSION_2_7 && \

RUN rvm install requirements && \
    rvm install $RUBY_VERSION_3_0 && \
    rvm install $RUBY_VERSION_3_1 && \
    rvm install $RUBY_VERSION_3_2 && \
    rvm install $RUBY_VERSION_3_3 && \
    rvm cleanup all

# install bundler to use Gemfile for all ruby verions
RUN rvm all do gem install bundler

# copy files to workdir
COPY . /app

# set working dir
WORKDIR /app/main

# set /bin/bash for container start commands
ENTRYPOINT ["/bin/bash", "-l", "-c"]

CMD ["rvm list"]