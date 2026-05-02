*** Settings ***
Documentation    Smoke tests cho cac chuc nang chinh cua SauceLabs My Demo App RN:
...              1. Login voi user hop le -> dieu huong toi Catalog
...              2. Add san pham vao gio hang -> verify cart co item
...              3. Logout -> verify ve trang thai chua dang nhap
...
...              Chay: robot --outputdir results tests/smoke.robot
...              Ket qua: results/log.html, results/report.html
Library          AppiumLibrary
Resource         ../resources/keywords.robot

Suite Setup      Open Demo App
Suite Teardown   Close Demo App
Test Teardown    Run Keyword If Test Failed    Capture Page Screenshot

*** Test Cases ***
TC01 - Dang nhap thanh cong voi user hop le
    [Documentation]    Verify user co the dang nhap voi credential dung.
    [Tags]    smoke    login    positive
    Open Login Screen From Menu
    Login With Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Verify Login Successful

TC02 - Them san pham vao gio hang
    [Documentation]    Sau khi login, them san pham dau tien tu Catalog vao gio hang.
    [Tags]    smoke    cart    positive
    Add First Product To Cart
    Verify Cart Contains At Least One Item

TC03 - Dang xuat thanh cong
    [Documentation]    Verify user dang nhap co the logout va tro ve trang thai chua dang nhap.
    [Tags]    smoke    logout    positive
    Logout From Menu
    Verify User Is Logged Out
