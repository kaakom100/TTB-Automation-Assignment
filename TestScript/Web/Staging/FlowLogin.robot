*** Settings ***
# Page
Resource    ${EXECDIR}/Pages/Web/LoginPage.robot
Resource    ${EXECDIR}/Pages/Web/LoginSuccessPage.robot
Suite Teardown    Close Browser

*** Variables ***
# Data Test    
${_URL}                           https://the-internet.herokuapp.com/login  
${_BROWSER}                       chrome
${_USERNAME}                      tomsmith
${_PASSWORD}                      SuperSecretPassword!
${_USERNAME_FAIL}                 tomholland
${_PASSWORD_FAIL}                 Password!
${_USERNAME_ERROR_TEXT}           Your username is invalid!
${_PASSWORD_ERROR_TEXT}           Your password is invalid!
${_LOGIN_SUCCESS_TEXT}            You logged into a secure area!
${_LOGOUT_SUCCESS_TEXT}           You logged out of the secure area!

*** Test Cases ***
Login Success
    [Documentation]    Owner : Danai Lertkamjornwat
    ...           |    ***| Description |***
    ...           |    ตรวจสอบเข้าสู่ระบบสำเร็จ
    ...           --------------------------------------------------------------------------
    ...           |    ***| Test Step |***
    ...           |    1. เปิดแอปพลิเคชัน myAIS
    ...           |    2. ระบุ Username
    ...           |    3. ระบุ Password
    ...           |    4. คลิกปุ่ม Login
    ...           |    5. แสดงหน้าเข้าสู่ระบบ
    ...           |    6. ปิด Browser
    ...           --------------------------------------------------------------------------
    ...           |    ***| Expected Result |***
    ...           |    ต้องเข้าสู่ระบบได้ถูกต้อง
    ...           ==> 
    [Tags]    succes
    LoginPage.Open Web Browser    url=${_URL}    browser=${_BROWSER}
    LoginPage.Input Username    username=${_USERNAME}
    LoginPage.Input Password    password=${_PASSWORD}
    LoginPage.Click Login Button
    LoginSuccessPage.Validate Popup Message    expect=${_LOGIN_SUCCESS_TEXT}
    LoginSuccessPage.Click Logout Button
    LoginPage.Validate Popup Message    expect=${_LOGOUT_SUCCESS_TEXT}

Login Username Not Found
    [Documentation]    Owner : Danai Lertkamjornwat
    ...           |    ***| Description |***
    ...           |    ตรวจสอบเข้าสู่ระบบไม่สำเร็จกรณีระบุ Username ผิด
    ...           --------------------------------------------------------------------------
    ...           |    ***| Test Step |***
    ...           |    1. เปิดแอปพลิเคชัน myAIS
    ...           |    2. ระบุ Username
    ...           |    3. ระบุ Password
    ...           |    4. คลิกปุ่ม Login
    ...           |    5. ไม่สามารถเข้าสู่ระบบได้
    ...           |    6. ปิด Browser
    ...           --------------------------------------------------------------------------
    ...           |    ***| Expected Result |***
    ...           |    ต้องเข้าสู่ระบบได้ถูกต้อง
    ...           ==> 
    [Tags]    fail
    LoginPage.Open Web Browser    url=${_URL}    browser=${_BROWSER}
    LoginPage.Input Username    username=${_USERNAME_FAIL}
    LoginPage.Input Password    password=${_PASSWORD}
    LoginPage.Click Login Button
    LoginPage.Validate Popup Message    expect=${_USERNAME_ERROR_TEXT}

Login Password Not Found
    [Documentation]    Owner : Danai Lertkamjornwat
    ...           |    ***| Description |***
    ...           |    ตรวจสอบเข้าสู่ระบบไม่สำเร็จกรณีระบุ Password ผิด
    ...           --------------------------------------------------------------------------
    ...           |    ***| Test Step |***
    ...           |    1. เปิดแอปพลิเคชัน myAIS
    ...           |    2. ระบุ Username
    ...           |    3. ระบุ Password
    ...           |    4. คลิกปุ่ม Login
    ...           |    5. ไม่สามารถเข้าสู่ระบบได้
    ...           |    6. ปิด Browser
    ...           --------------------------------------------------------------------------
    ...           |    ***| Expected Result |***
    ...           |    ต้องเข้าสู่ระบบได้ถูกต้อง
    ...           ==> 
    [Tags]    fail
    LoginPage.Open Web Browser    url=${_URL}    browser=${_BROWSER}
    LoginPage.Input Username    username=${_USERNAME}
    LoginPage.Input Password    password=${_PASSWORD_FAIL}
    LoginPage.Click Login Button
    LoginPage.Validate Popup Message   expect=${_PASSWORD_ERROR_TEXT}


