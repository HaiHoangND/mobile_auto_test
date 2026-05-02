*** Settings ***
Documentation    Locators cho cac man hinh trong SauceLabs My Demo App RN.
...              Uu tien Accessibility ID (~). Neu locator sai, dung Appium Inspector
...              de inspect lai phan tu va cap nhat cac variable o day.

*** Variables ***
# ============ Bottom navigation tabs ============
${TAB_CATALOG}             accessibility_id=menu item catalog
${TAB_CART}                accessibility_id=cart badge
${TAB_MENU}                accessibility_id=open menu

# ============ Catalog (Products) screen ============
${PRODUCT_SCREEN}          accessibility_id=products screen
#${PRODUCT_FIRST_ITEM}      accessibility_id=store item
${PRODUCT_FIRST_ITEM}      xpath=(//android.view.ViewGroup[@content-desc="store item"])[1]
${PRODUCT_TITLE_BACKPACK}  xpath=//*[@text="Sauce Labs Backpack"]

# ============ Product detail screen ============
${PRODUCT_DETAIL_TITLE}    accessibility_id=product title
${BTN_ADD_TO_CART}         accessibility_id=Add To Cart button
${ICON_BACK}               accessibility_id=container header

# ============ Cart screen ============
${CART_HEADER}             accessibility_id=container header
${CART_ITEM}               accessibility_id=product row
${CART_BADGE}              accessibility_id=tab bar cart button

# ============ Menu / drawer ============
${MENU_ITEM_LOGIN}         accessibility_id=menu item log in
${MENU_ITEM_LOGOUT}        accessibility_id=menu item log out
${MENU_ITEM_LOGOUT_OK}     id=android:id/button1
${MENU_ITEM_RESET}         accessibility_id=menu item reset app

# ============ Login screen ============
${INPUT_USERNAME}          accessibility_id=Username input field
${INPUT_PASSWORD}          accessibility_id=Password input field
${BTN_LOGIN}               accessibility_id=Login button
${LOGIN_ERROR_GENERIC}     accessibility_id=generic-error-message
${LOGIN_LOCKED_MSG}        xpath=//*[contains(@text,"Sorry, this user has been locked out")]
