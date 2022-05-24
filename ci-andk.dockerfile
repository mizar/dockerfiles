FROM openjdk:8-jdk-slim
ENV ANDROID_NDK_HOME /opt/android-ndk
ENV ANDROID_NDK_VERSION r23b
ENV PATH ${PATH}:${ANDROID_NDK_HOME}/android-ndk-${ANDROID_NDK_VERSION}
ENV DEBCONF_NOWARNINGS yes
# https://developer.android.com/studio?hl=ja#cmdline-tools
# https://developer.android.com/ndk/downloads?hl=ja
RUN apt-get update --yes \
&& apt-get upgrade --yes \
&& apt-get install --yes --no-install-recommends curl file make unzip \
&& mkdir ${ANDROID_NDK_HOME} \
&& mkdir /opt/work \
&& curl -RLO https://dl.google.com/android/repository/android-ndk-${ANDROID_NDK_VERSION}-linux.zip \
&& unzip android-ndk-${ANDROID_NDK_VERSION}-linux.zip -d ${ANDROID_NDK_HOME} \
&& apt-get remove --purge --yes curl unzip \
&& apt-get autoremove --purge --yes \
&& apt-get clean --yes \
&& rm -rf android-ndk-${ANDROID_NDK_VERSION}-linux.zip /var/lib/apt/lists/*
WORKDIR /opt/work
