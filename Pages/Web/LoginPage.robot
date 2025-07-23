*** Settings ***
Resource    ${EXECDIR}/Configuration/AllResource.robot
Documentation     `List Keyword in LoginPage for to used`
...                Open     : |Open Web Browser| 
...                Input    : |Input Username|, |Input Password|
...                Validate : |Validate Popup Message|
...                Click    : |Click Login Button|

*** Keywords ***
_Set Test Local Variables
    [Documentation]    เตรียมตัวแปรสำหรับใช้งานในแต่ละ Keywords
    [Tags]    robot:private
    # Timeout
    VAR    ${_TIMEOUT_RETURN_STATUS}              ${Time_Out.Return_Status}                               scope=test            
    VAR    ${_TIMEOUT_RETURN_STATUS_MEDIUM}       ${Time_Out.Return_Status_Medium}                        scope=test
    VAR    ${_TIMEOUT_RETURN_STATUS_QUICK}        ${Time_Out.Return_Status_Quick}                         scope=test
    VAR    ${_TIMEOUT_LONG}                       ${Time_Out.Long}                                        scope=test
    VAR    ${_TIMEOUT_DEFAULT}                    ${Time_Out.Default}                                     scope=test
    # Locator
    VAR    ${_BTN_USERNAME}                       ${Xpath.${ENV}.Web.LoginPage.btnUsername}               scope=test
    VAR    ${_BTN_PASSWORD}                       ${Xpath.${ENV}.Web.LoginPage.btnPassword}               scope=test   
    VAR    ${_BTN_LOGIN}                          ${Xpath.${ENV}.Web.LoginPage.btnLogin}                  scope=test
    VAR    ${_BTN_INVALID}                        ${Xpath.${ENV}.Web.LoginPage.btnInvalid}                scope=test
   # VAR    ${_LBL_INVALID}                        ${Xpath.${ENV}.Web.LoginPage.Invalid}                scope=test

Open Web Browser
    [Documentation]    Owner : Danai Lertkamjornwat
    ...          |     ***| Description |***
    ...          |     Keyword สำหรับเข้าสูเว็บไซต์
    ...          --------------------------------------------------------------------------
    ...          |     ***| Required Parameter |***
    ...          |     $url       : ระบุลิ้งเว็ปไซต์
    ...          |     $browser   : ระบุบราวเซอร์
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Examples of use |***
    ...          |     Open Web Browser     ${url}    ${browser}  🗂️ ใช้ภายในไฟล์
    ...          |     LoginPage.Open Web Browser   ${url}    ${browser}  🌐 ใช้ภายนอกไฟล์
    ...          ==>  
    [Setup]    _Set Test Local Variables
    [Arguments]    ${url}    ${browser}    
    ${browser_lower}    String.Convert To Lower Case    ${browser}
    SeleniumLibrary.Open Browser    url=${url}    browser=${browser_lower}
    SeleniumLibrary.Maximize Browser Window

Input Username
    [Documentation]    Owner : Danai Lertkamjornwat
    ...          |     ***| Description |***
    ...          |     Keyword ระบุ Username
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Required Parameter |***
    ...          |     $username   : รหัสชื่อผู้ใช้งาน
    ...          --------------------------------------------------------------------------
    ...          |     ***| Optional Parameter |***
    ...          |     $timeout    : เวลา Wait Element (ค่า default = ${Time_Out.Default})
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Examples of use |***
    ...          |     Input Username    ${username}     🗂️ ใช้ภายในไฟล์
    ...          |     LoginPage.Input Username    ${username}   🌐 ใช้ภายนอกไฟล์
    ...          ==>  
    [Setup]    _Set Test Local Variables  
    [Arguments]    ${username}    ${timeout}=${Time_Out.Default}     
    ${Status}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${_BTN_USERNAME}    ${timeout}       
    IF    ${Status}
        SeleniumLibrary.Input Text    locator=${_BTN_USERNAME}    text=${username}
    ELSE
        Fail    msg=${_BTN_USERNAME} Not Found
    END

Input Password
    [Documentation]    Owner : Danai Lertkamjornwat
    ...          |     ***| Description |***
    ...          |     Keyword ระบุ Password
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Required Parameter |***
    ...          |     $password   : รหัสผู้ใช้งาน
    ...          --------------------------------------------------------------------------
    ...          |     ***| Optional Parameter |***
    ...          |     $timeout    : เวลา Wait Element (ค่า default = ${Time_Out.Default})
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Examples of use |***
    ...          |     Input Password    ${password}     🗂️ ใช้ภายในไฟล์
    ...          |     LoginPage.Input Password    ${password}   🌐 ใช้ภายนอกไฟล์
    ...          ==>  
    [Setup]    _Set Test Local Variables  
    [Arguments]    ${password}    ${timeout}=${Time_Out.Default}     
    ${Status}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${_BTN_PASSWORD}    ${timeout}       
    IF    ${Status}
        SeleniumLibrary.Input Text    locator=${_BTN_PASSWORD}    text=${password}
    ELSE
        Fail    msg=${_BTN_USERNAME} Not Found
    END

Validate Popup Message
    [Documentation]    Owner : Danai Lertkamjornwat
    ...          |     ***| Description |***
    ...          |     Keyword ตรวจสอบ Validate Popup Message
    ...          --------------------------------------------------------------------------
    ...          |     ***| Optional Parameter |***
    ...          |     $timeout    : เวลา Wait Element (ค่า default = ${Time_Out.Default})
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Examples of use |***
    ...          |     Validate Popup Message    ${expect}     🗂️ ใช้ภายในไฟล์
    ...          |     LoginPage.Validate Popup Message    ${expect}       🌐 ใช้ภายนอกไฟล์
    ...          ==>  
    [Setup]    _Set Test Local Variables  
    [Arguments]    ${expect}    ${timeout}=${Time_Out.Default}     
    ${Status}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${_BTN_INVALID}    ${timeout}       
    IF    ${Status}
        ${Actual}    SeleniumLibrary.Get Text    ${_BTN_INVALID}
        ${Actual}    Replace String    ${Actual}    ×    ${EMPTY}
        ${Actual}    Strip String     ${Actual}
        Should Be Equal    ${Actual}    ${expect}
    ELSE
        Fail    msg=Popup Not Found
    END

Vlidate Success Message
    [Documentation]    Owner : Danai Lertkamjornwat
    ...          |     ***| Description |***
    ...          |     Keyword ตรวจสอบ Vlidate Success Message
    ...          --------------------------------------------------------------------------
    ...          |     ***| Optional Parameter |***
    ...          |     $timeout    : เวลา Wait Element (ค่า default = ${Time_Out.Default})
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Examples of use |***
    ...          |     Vlidate Success Message    🗂️ ใช้ภายในไฟล์
    ...          |     LoginSuccessPage.Vlidate Success Message   🌐 ใช้ภายนอกไฟล์
    ...          ==>  
    [Setup]    _Set Test Local Variables  
    [Arguments]    ${expect}    ${timeout}=${Time_Out.Default}     
    ${Status}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${_BTN_INVALID}    ${timeout}       
    IF    ${Status}
        ${Actual}    SeleniumLibrary.Get Text    ${_BTN_INVALID}
        ${Actual}    Replace String    ${Actual}    ×    ${EMPTY}
        ${Actual}    Strip String     ${Actual}
        Should Be Equal    ${Actual}    ${expect}
    ELSE
        Fail    msg=Popup Not Found
    END

Click Login Button
    [Documentation]    Owner : Danai Lertkamjornwat
    ...          |     ***| Description |***
    ...          |     Keyword คลิกปุ่ม Login
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Optional Parameter |***
    ...          |     $timeout    : เวลา Wait Element (ค่า default = ${Time_Out.Default})
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Examples of use |***
    ...          |     Click Login Buttonr     🗂️ ใช้ภายในไฟล์
    ...          |     LoginPage.Click Login Button   🌐 ใช้ภายนอกไฟล์
    ...          ==>  
    [Setup]    _Set Test Local Variables  
    [Arguments]    ${timeout}=${Time_Out.Default}     
    ${Status}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${_BTN_LOGIN}    ${timeout}       
    IF    ${Status}
        SeleniumLibrary.Click Element    ${_BTN_LOGIN}
    ELSE
        Fail    msg=Button Not Found
    END


