# build-android-emulator

build android emulator

## issues

- emulator: Failed to sync vcpu reg

just shut down all virtual boxes. Most people have genymotion running which causes the issue. run one emulator at a time and virtual device.

[http://stackoverflow.com/questions/32586389/android-emulator-is-not-running-error](http://stackoverflow.com/questions/32586389/android-emulator-is-not-running-error)

- kill service

eg: adb shell am force-stop  com.example.helloworld.yuer.freekiteservice
