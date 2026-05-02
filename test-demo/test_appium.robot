*** Settings ***
Library    AppiumLibrary

*** Variables ***
${REMOTE_URL}       http://127.0.0.1:4723
${PLATFORM}         Android
${DEVICE}           emulator-5554
${APP_PACKAGE}      io.appium.android.apis
${APP_ACTIVITY}     .ApiDemos

*** Keywords ***
Open ApiDemos App
    Open Application    ${REMOTE_URL}
    ...    platformName=${PLATFORM}
    ...    deviceName=${DEVICE}
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
    ...    automationName=UiAutomator2

    Wait Until Page Contains Element    accessibility_id=App    timeout=10s

Go To App Menu
    Click Element    accessibility_id=App
    Wait Until Page Contains Element    accessibility_id=Activity

Open Alert Dialog Flow
    Click Element    accessibility_id=Alert Dialogs
    Wait Until Page Contains Element    accessibility_id=OK Cancel dialog with a message
    Click Element    accessibility_id=OK Cancel dialog with a message
    Wait Until Page Contains Element    id=android:id/button1
    Click Element    id=android:id/button1

*** Test Cases ***
Test Main Flow
    Open ApiDemos App

    Go To App Menu
    Page Should Contain Text    Activity

    Go Back

    Go To App Menu
    Open Alert Dialog Flow

    [Teardown]    Close Application