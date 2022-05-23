FROM openjdk:8-jdk-slim
ENV ANDROID_NDK_HOME /opt/android-ndk
ENV PATH ${PATH}:${ANDROID_NDK_HOME}/android-ndk-r23b
ENV DEBCONF_NOWARNINGS yes
# https://developer.android.com/studio?hl=ja#cmdline-tools
# https://developer.android.com/ndk/downloads?hl=ja
RUN apt-get update --yes --quiet \
    && apt-get upgrade --yes --quiet \
    && apt-get install --yes --quiet curl file make unzip \
    && mkdir ${ANDROID_NDK_HOME} \
    && mkdir /opt/work \
    && curl -#RLO https://dl.google.com/android/repository/android-ndk-r23b-linux.zip \
    && unzip android-ndk-r23b-linux.zip -d ${ANDROID_NDK_HOME} \
    && apt-get remove --purge --yes --quiet curl unzip \
    && apt-get autoremove --purge --yes --quiet \
    && apt-get clean --yes --quiet \
    && rm -rf android-ndk-r23b-linux.zip /var/lib/apt/lists/*
WORKDIR /opt/work
