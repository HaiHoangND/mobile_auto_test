*** Settings ***
Documentation    Keywords tai su dung cho test SauceLabs My Demo App RN.
...              Cac keyword nay duoc goi tu test cases trong tests/*.robot.
Library          AppiumLibrary
Resource         variables.robot
Resource         locators.robot

*** Keywords ***
# ============================================================
# Setup / teardown
# ============================================================
Open Demo App
    [Documentation]    Mo SauceLabs My Demo App RN tren Android emulator.
    Open Application    ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    appium:automationName=${AUTOMATION_NAME}
    ...    appium:deviceName=${DEVICE_NAME}
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
    ...    appium:autoGrantPermissions=true
    ...    appium:noReset=false
    ...    appium:newCommandTimeout=120
    Set Appium Timeout    ${IMPLICIT_WAIT}

Close Demo App
    [Documentation]    Dong app va capture screenshot neu test fail.
    Close Application

# ============================================================
# Navigation keywords
# ============================================================
Go To Menu Tab
    Wait Until Element Is Visible    ${TAB_MENU}    timeout=${EXPLICIT_TIMEOUT}
    Click Element    ${TAB_MENU}

Go To Catalog Tab
    Wait Until Element Is Visible    ${TAB_CATALOG}    timeout=${EXPLICIT_TIMEOUT}
    Click Element    ${TAB_CATALOG}

Go To Cart Tab
    Wait Until Element Is Visible    ${TAB_CART}    timeout=${EXPLICIT_TIMEOUT}
    Click Element    ${TAB_CART}

# ============================================================
# Login flow
# ============================================================
Open Login Screen From Menu
    [Documentation]    Tu tab Menu, mo man hinh Login.
    Go To Menu Tab
    Wait Until Element Is Visible    ${MENU_ITEM_LOGIN}    timeout=${EXPLICIT_TIMEOUT}
    Click Element    ${MENU_ITEM_LOGIN}
    Wait Until Element Is Visible    ${BTN_LOGIN}    timeout=${EXPLICIT_TIMEOUT}

Login With Credentials
    [Documentation]    Nhap username + password va tap Login.
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    ${INPUT_USERNAME}    timeout=${EXPLICIT_TIMEOUT}
    Input Text       ${INPUT_USERNAME}    ${username}
    Input Password   ${INPUT_PASSWORD}    ${password}
    Click Element    ${BTN_LOGIN}

Login As Valid User
    Open Login Screen From Menu
    Login With Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}

Verify Login Successful
    [Documentation]    Sau khi login thanh cong, app dieu huong ve Catalog.
    Wait Until Element Is Visible    ${PRODUCT_SCREEN}    timeout=${EXPLICIT_TIMEOUT}

# ============================================================
# Cart flow
# ============================================================
Add First Product To Cart
    [Documentation]    Tu Catalog, click san pham dau tien -> Add To Cart.
#    Go To Catalog Tab
    Wait Until Element Is Visible    ${PRODUCT_FIRST_ITEM}    timeout=${EXPLICIT_TIMEOUT}
    Click Element    ${PRODUCT_FIRST_ITEM}
    Wait Until Element Is Visible    ${BTN_ADD_TO_CART}    timeout=${EXPLICIT_TIMEOUT}
    Click Element    ${BTN_ADD_TO_CART}

Verify Cart Contains At Least One Item
    Go To Cart Tab
    Wait Until Element Is Visible    ${CART_ITEM}    timeout=${EXPLICIT_TIMEOUT}
    ${count}=    Get Matching Xpath Count    //*[@content-desc="product row"]
    Should Be True    ${count} >= 1    Mong doi cart co >= 1 item, thuc te ${count}

# ============================================================
# Logout flow
# ============================================================
Logout From Menu
    [Documentation]    Tu tab Menu -> Log Out -> confirm.
    Go To Menu Tab
    Wait Until Element Is Visible    ${MENU_ITEM_LOGOUT}    timeout=${EXPLICIT_TIMEOUT}
    Click Element    ${MENU_ITEM_LOGOUT}
    Wait Until Element Is Visible    ${MENU_ITEM_LOGOUT_OK}    timeout=${EXPLICIT_TIMEOUT}
    Click Element    ${MENU_ITEM_LOGOUT_OK}
    Click Element    ${MENU_ITEM_LOGOUT_OK}

Verify User Is Logged Out
    [Documentation]    Sau khi logout, menu hien lai option "Log In".
    Go To Menu Tab
    Wait Until Element Is Visible    ${MENU_ITEM_LOGIN}    timeout=${EXPLICIT_TIMEOUT}
