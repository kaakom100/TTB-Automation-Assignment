*** Settings ***
Resource    ${EXECDIR}/Configuration/AllResource.robot
Documentation     `List Keyword in LoginSuccessPageWeb for to used`
...                Validate : |Validate Popup Message|
...                Click    : |Click Login Button|

*** Keywords ***
_Set Test Local Variables
    [Documentation]    เตรียมตัวแปรสำหรับใช้งานในแต่ละ Keywords
    [Tags]    robot:private
    # Timeout
    VAR    ${_TIMEOUT_RETURN_STATUS}              ${Time_Out.Return_Status}                                     scope=test            
    VAR    ${_TIMEOUT_RETURN_STATUS_MEDIUM}       ${Time_Out.Return_Status_Medium}                              scope=test
    VAR    ${_TIMEOUT_RETURN_STATUS_QUICK}        ${Time_Out.Return_Status_Quick}                               scope=test
    VAR    ${_TIMEOUT_LONG}                       ${Time_Out.Long}                                              scope=test
    VAR    ${_TIMEOUT_DEFAULT}                    ${Time_Out.Default}                                           scope=test
    # Locator
    VAR    ${_BTN_LOGOUT}                         ${Xpath.${ENV}.${Device}.LoginSuccessPage.btnLogout}          scope=test
    VAR    ${_BTN_INVALID}                        ${Xpath.${ENV}.${Device}.LoginSuccessPage.btnInvalid}         scope=test

Validate Popup Message
    [Documentation]    Owner : Danai Lertkamjornwat
    ...          |     ***| Description |***
    ...          |     Keyword ตรวจสอบ Validate Popup Message
    ...          --------------------------------------------------------------------------
    ...          |     ***| Required Parameter |***
    ...          |     $expect     : ข้อความที่จะ Validate
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Optional Parameter |***
    ...          |     $timeout    : เวลา Wait Element (ค่า default = ${Time_Out.Default})
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Examples of use |***
    ...          |     Validate Popup Message    🗂️ ใช้ภายในไฟล์
    ...          |     LoginSuccessPage.Validate Popup Message   🌐 ใช้ภายนอกไฟล์
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

Click Logout Button
    [Documentation]    Owner : Danai Lertkamjornwat
    ...          |     ***| Description |***
    ...          |     Keyword คลิกปุ่ม Logout
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Optional Parameter |***
    ...          |     $timeout    : เวลา Wait Element (ค่า default = ${Time_Out.Default})
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Examples of use |***
    ...          |     Click Logout Button     🗂️ ใช้ภายในไฟล์
    ...          |     LoginSuccessPage.Click Logout Button   🌐 ใช้ภายนอกไฟล์
    ...          ==>  
    [Setup]    _Set Test Local Variables  
    [Arguments]    ${timeout}=${Time_Out.Default}     
    ${Status}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${_BTN_LOGOUT}    ${timeout}       
    IF    ${Status}
        SeleniumLibrary.Click Element    ${_BTN_LOGOUT}
    ELSE
        Fail    msg=Button Not Found
    END
