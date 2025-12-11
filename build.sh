#!/bin/bash
yum install -y unzip wget git
mkdir -p /opt/android-sdk
cd /opt/android-sdk
wget https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip -O cmdtools.zip
unzip cmdtools.zip
mkdir -p cmdline-tools/latest
mv cmdline-tools/* cmdline-tools/latest/
export ANDROID_HOME=/opt/android-sdk
export ANDROID_SDK_ROOT=/opt/android-sdk
export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH
pwd
cd /devtroncd/android-gradle-java-app-template/
yes | sdkmanager --licenses
sdkmanager "platform-tools" "platforms;android-33"
./gradlew assembleRelease
ls ./build/outputs/apk/release/
