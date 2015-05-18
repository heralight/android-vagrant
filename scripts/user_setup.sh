#!/usr/bin/env bash
#Replace .profile with .bashrc if required

# Paths
GRADLE_HOME_VALUE=/usr/local/gradle-2.2.1
ANDROID_HOME_VALUE=/usr/local/android-sdk-linux
ANDROID_STUDIO_HOME_VALUE=/usr/local/android-studio
PATH_VALUE=$PATH:${ANDROID_STUDIO_HOME_VALUE}/bin:${ANDROID_HOME_VALUE}/tools:$ANDROID_HOME_VALUE/platform-tools:${GRADLE_HOME_VALUE}/bin

source ~/.profile
if [ -z "$GRADLE_HOME" ] || [ "$GRADLE_HOME" != "$GRADLE_HOME_VALUE" ]; then
	echo "export GRADLE_HOME=$GRADLE_HOME_VALUE" >> ~/.bashrc
fi

if [ -z "$ANDROID_HOME" ] || [ "$ANDROID_HOME" != "$ANDROID_HOME_VALUE" ]; then
	echo "export ANDROID_HOME=$ANDROID_HOME_VALUE" >> ~/.bashrc
fi

if [ -z "$ANDROID_STUDIO_HOME" ] || [ "$ANDROID_STUDIO_HOME" != "$ANDROID_STUDIO_HOME_VALUE" ]; then
	echo "export ANDROID_STUDIO_HOME=$ANDROID_STUDIO_HOME_VALUE" >> ~/.bashrc
fi

if [ -z "$PATH" ] || [ "$PATH" != "$PATH_VALUE" ]; then
	echo "export PATH=$PATH_VALUE" >> ~/.bashrc
fi

