# Builds a clean ubuntu image with JRE 9
FROM ubuntu:xenial
MAINTAINER Patrik Nyblad <patrik.nyblad@gmail.com>

# Add locales after locale-gen as needed
# Upgrade packages on image
# Preparations for sshd
run locale-gen en_US.UTF-8

# Set language variables
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Install JRE 9
RUN apt-get -q update &&\
    DEBIAN_FRONTEND="noninteractive" apt-get -q install -y -o Dpkg::Options::="--force-confnew"  --no-install-recommends openjdk-9-jre-headless &&\
    DEBIAN_FRONTEND="noninteractive" apt-get -q install -y -o Dpkg::Options::="--force-confnew"  --no-install-recommends wget &&\
    apt-get -q clean -y && rm -rf /var/lib/apt/lists/* && rm -f /var/cache/apt/*.bin