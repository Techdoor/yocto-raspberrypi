FROM ubuntu:18.04

RUN apt-get update && apt-get -y upgrade

# Required Packages for the Host Development System
# http://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html#required-packages-for-the-host-development-system
RUN apt-get install -y gawk wget git-core diffstat unzip texinfo gcc-multilib \
     build-essential chrpath socat cpio python python3 python3-pip python3-pexpect \
     xz-utils debianutils iputils-ping

# Why?
RUN apt-get install -y libsdl1.2-dev xterm curl

# Required packages for yocto development 
RUN apt-get install -y tmux libncurses-dev 

# Set up locales
RUN apt-get -y install locales apt-utils sudo && \
    dpkg-reconfigure locales && \
    locale-gen en_US.UTF-8 && \
    update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

ENV LANG en_US.utf8

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Replace dash with bash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Add "repo" tool (used by many Yocto-based projects)
RUN curl http://storage.googleapis.com/git-repo-downloads/repo > /usr/local/bin/repo
RUN chmod a+x /usr/local/bin/repo

# User management
RUN groupadd -g 1001 build && \
    useradd -u 1001 -g 1001 -ms /bin/bash build && \
    usermod -a -G sudo build && \
    usermod -a -G users build

RUN apt-get install -y sudo

USER build

WORKDIR /tmp
