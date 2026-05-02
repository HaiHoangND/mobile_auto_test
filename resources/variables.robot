*** Settings ***
Documentation    Cau hinh capabilities va URL Appium server cho test SauceLabs My Demo App RN.

*** Variables ***
# Appium server (Appium 2.x — KHONG co /wd/hub)
${REMOTE_URL}            http://localhost:4723

# Capabilities cho Android emulator
${PLATFORM_NAME}         Android
${AUTOMATION_NAME}       UiAutomator2
${DEVICE_NAME}           emulator-5554
${APP_PACKAGE}           com.saucelabs.mydemoapp.rn
${APP_ACTIVITY}          .MainActivity

# Path den APK — dat file APK tai apps/MyDemoAppRN.apk
# ${CURDIR} la thu muc cua file .robot hien tai
${APP_PATH}              ${CURDIR}${/}..${/}apps${/}MyDemoAppRN.apk

# Wait
${IMPLICIT_WAIT}         2
${EXPLICIT_TIMEOUT}      2

# Test users (theo doc SauceLabs My Demo App RN)
${VALID_USERNAME}        bob@example.com
${VALID_PASSWORD}        10203040
${LOCKED_USERNAME}       alice@example.com
${LOCKED_PASSWORD}       10203040
