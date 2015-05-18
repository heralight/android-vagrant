#!/usr/bin/env bash

# Install a Desktop Environment
sudo apt-get update
sudo apt-get install -y --no-install-recommends xubuntu-desktop

echo "Installing Android SDK and setting up paths..."
sudo dpkg --add-architecture i386 && apt-get update && apt-get install -yq libstdc++6:i386 zlib1g:i386 libncurses5:i386 ant maven --no-install-recommends
export GRADLE_URL=http://services.gradle.org/distributions/gradle-2.2.1-all.zip
sudo curl -L ${GRADLE_URL} -o /tmp/gradle-2.2.1-all.zip && unzip /tmp/gradle-2.2.1-all.zip -d /usr/local && rm /tmp/gradle-2.2.1-all.zip

export ANDROID_SDK_URL=http://dl.google.com/android/android-sdk_r24.0.2-linux.tgz
sudo curl -L ${ANDROID_SDK_URL} | tar xz -C /usr/local

export ANDROID_SDK_COMPONENTS=platform-tools,build-tools-21.1.2,android-21,extra-android-support
export ANDROID_HOME=/usr/local/android-sdk-linux
sudo echo y | ${ANDROID_HOME}/tools/android update sdk --no-ui --all --filter "${ANDROID_SDK_COMPONENTS}"

export ANDROID_STUDIO_URL=https://dl.google.com/dl/android/studio/ide-zips/1.0.1/android-studio-ide-135.1641136-linux.zip
sudo curl -L ${ANDROID_STUDIO_URL} -o /tmp/android-studio-ide.zip && unzip /tmp/android-studio-ide.zip -d /usr/local && rm /tmp/android-studio-ide.zip

export ANDROID_SDK_EXTRA_COMPONENTS=extra-google-google_play_services,extra-google-m2repository,extra-android-m2repository,source-21,addon-google_apis-google-21,sys-img-x86-addon-google_apis-google-21
sudo echo y | ${ANDROID_HOME}/tools/android update sdk --no-ui --all --filter "${ANDROID_SDK_EXTRA_COMPONENTS}"

su -c "source /vagrant/scripts/user_setup.sh" vagrant

