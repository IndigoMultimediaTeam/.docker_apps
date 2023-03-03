FROM ubuntu:22.04

ARG VERSION_JAVA=11
ARG VERSION_NODEJS=18
# See https://developer.android.com/studio/index.html#command-tools
ARG VERSION_ANDROID_SDK=9477386
# See https://androidsdkmanager.azurewebsites.net/Buildtools
ARG VERSION_ANDROID_BUILD_TOOLS=33.0.0
# See https://developer.android.com/studio/releases/platforms
ARG VERSION_ANDROID_PLATFORMS=32

ENV VERSION_JAVA=$VERSION_JAVA
ENV LANG=en_US.UTF-8
ENV TERM=xterm-256color

WORKDIR /tmp
ENV DEBIAN_FRONTEND=noninteractive
# General packages
RUN apt update -q > /dev/null \
    && apt-get install -qy \
      apt-utils \
      locales \
      gnupg2 \
      build-essential \
      curl \
      usbutils \
      git \
      unzip \
      p7zip p7zip-full \
      python3 > /dev/null
# Install JAVA
RUN apt install -qy \
    openjdk-${VERSION_JAVA}-jre \
    openjdk-${VERSION_JAVA}-jdk
RUN locale-gen en_US.UTF-8 && update-locale
# Install Android*
ENV ANDROID_HOME=/opt/android-sdk
RUN curl -sL https://dl.google.com/android/repository/commandlinetools-linux-${VERSION_ANDROID_SDK}_latest.zip -o commandlinetools-linux-${VERSION_ANDROID_SDK}_latest.zip \
    && unzip commandlinetools-linux-${VERSION_ANDROID_SDK}_latest.zip \
    && mkdir $ANDROID_HOME && mv cmdline-tools $ANDROID_HOME \
    && yes | $ANDROID_HOME/cmdline-tools/bin/sdkmanager --sdk_root=$ANDROID_HOME --licenses \
    && $ANDROID_HOME/cmdline-tools/bin/sdkmanager --sdk_root=$ANDROID_HOME "platform-tools" "build-tools;${VERSION_ANDROID_BUILD_TOOLS}" "platforms;android-${VERSION_ANDROID_PLATFORMS}"
ENV PATH=$PATH:${ANDROID_HOME}/cmdline-tools:${ANDROID_HOME}/platform-tools
# Install NodeJS
RUN curl -sL https://deb.nodesource.com/setup_${VERSION_NODEJS}.x | bash - \
    && apt update -q > /dev/null \
    && apt install -qy nodejs
ENV NPM_CONFIG_PREFIX=${HOME}/.npm-global
ENV PATH=$PATH:${HOME}/.npm-global/bin
# Clean up
RUN apt autoremove -y \
    && apt clean -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/*
RUN unset ANDROID_HOME
ENV DEBIAN_FRONTEND=newt

WORKDIR /home
# java -XshowSettings:properties -version 2>&1 > /dev/null | grep 'java.home'
# TODO: else
RUN if [ "$VERSION_JAVA" -gt "10"]; then \
	echo export ANDROID_SDK_ROOT=/opt/android-sdk > ./.env; \
	echo export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64 >> ./.env; \
else \
	echo export ANDROID_HOME=/opt/android-sdk > ./.env; \
fi
CMD source ./.env
# cordova/capacitor
COPY ./package.json .
COPY ./package-lock.json .
RUN npm ci
# capacitor
COPY ./capacitor.config.ts .
# cordova
COPY ./config.xml .
