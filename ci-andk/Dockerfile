FROM openjdk:8-jdk-slim
ENV ANDROID_HOME /opt/android-sdk
ENV ANDROID_SDK_ROOT ${ANDROID_HOME}/tools
ENV PATH ${PATH}:${ANDROID_SDK_ROOT}/bin
ENV DEBCONF_NOWARNINGS yes
# https://developer.android.com/studio?hl=ja#cmdline-tools
RUN apt-get update --yes --quiet \
    && apt-get upgrade --yes --quiet \
    && apt-get install --yes --quiet curl unzip \
    && mkdir ${ANDROID_HOME} \
    && mkdir /opt/work \
    && curl -#RL https://dl.google.com/android/repository/commandlinetools-linux-6200805_latest.zip -o commandlinetools.zip \
    && unzip commandlinetools.zip -d ${ANDROID_HOME} \
    && apt-get remove --purge --yes --quiet curl unzip \
    && apt-get autoremove --purge --yes --quiet \
    && apt-get clean --yes --quiet \
    && rm -rf commandlinetools.zip /var/lib/apt/lists/* \
    && yes | sdkmanager --sdk_root=${ANDROID_HOME} --licenses >/dev/null \
    && sdkmanager --sdk_root=${ANDROID_HOME} ndk-bundle
