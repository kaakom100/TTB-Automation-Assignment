*** Settings ***
Resource    ${EXECDIR}/Configuration/AllResource.robot
Documentation     `List Keyword in ItemPageMB for to used`
...                Input    : |Input Title|
...                Click    : |Click Summit Button|, |Click Close Button|, |Click Remine Me Button|, |Click Date Button|, |Click Time Button|
...                         : |Click OK Button On Date Popup|, |Click Cancel Button On Date Popup|, |Click OK Button On Time Popup|, |Click Cancel Button On Time Popup|

*** Keywords ***
_Set Test Local Variables
    [Documentation]    เตรียมตัวแปรสำหรับใช้งานในแต่ละ Keywords
    [Tags]    robot:private
    # Timeout
    VAR    ${_TIMEOUT_RETURN_STATUS}              ${Time_Out.Return_Status}                                                   scope=test            
    VAR    ${_TIMEOUT_RETURN_STATUS_MEDIUM}       ${Time_Out.Return_Status_Medium}                                            scope=test
    VAR    ${_TIMEOUT_RETURN_STATUS_QUICK}        ${Time_Out.Return_Status_Quick}                                             scope=test
    VAR    ${_TIMEOUT_LONG}                       ${Time_Out.Long}                                                            scope=test
    VAR    ${_TIMEOUT_DEFAULT}                    ${Time_Out.Default}                                                         scope=test
    # Locator
    VAR    ${_LBL_TITLE}                          ${Xpath.${ENV}.${Device}.AddItemPage.btnTitle}                              scope=test
    VAR    ${_BTN_SUBMIT}                         ${Xpath.${ENV}.${Device}.AddItemPage.btnSumbit}                             scope=test   
    VAR    ${_BTN_REMIND_ME}                      ${Xpath.${ENV}.${Device}.AddItemPage.btnRemindMe}                           scope=test
    VAR    ${_BTN_DATE}                           ${Xpath.${ENV}.${Device}.AddItemPage.btnDate}                               scope=test
    VAR    ${_BTN_TIME}                           ${Xpath.${ENV}.${Device}.AddItemPage.btnTime}                               scope=test
    VAR    ${_BTN_CLOSE}                          ${Xpath.${ENV}.${Device}.AddItemPage.btnClose}                              scope=test
    VAR    ${_BTN_OK_POPUP_DATE}                  ${Xpath.${ENV}.${Device}.AddItemPage.PopupDatePage.btnOK}                   scope=test   
    VAR    ${_BTN_CANCEL_POPUP_DATE}              ${Xpath.${ENV}.${Device}.AddItemPage.PopupDatePage.btnCancel}               scope=test
    VAR    ${_BTN_OK_POPUP_TIME}                  ${Xpath.${ENV}.${Device}.AddItemPage.PopupTimePage.btnOK}                   scope=test
    VAR    ${_BTN_CANCEL_POPUP_TIME}              ${Xpath.${ENV}.${Device}.AddItemPage.PopupTimePage.btnCancel}               scope=test
    VAR    ${_BTN_SWITCH_TIME_POPUP_TIME}         ${Xpath.${ENV}.${Device}.AddItemPage.PopupTimePage.btnSwitchTime}           scope=test

Click Summit Button
    [Documentation]    Owner : Danai Lertkamjornwat
    ...          |     ***| Description |***
    ...          |     Keyword คลิกปุ่ม Summit
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Optional Parameter |***
    ...          |     $timeout    : เวลา Wait Element (ค่า default = ${Time_Out.Default})
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Examples of use |***
    ...          |     Click Summit Button     🗂️ ใช้ภายในไฟล์
    ...          |     ItemPageMB.Click Summit Button   🌐 ใช้ภายนอกไฟล์
    ...          ==>  
    [Setup]    _Set Test Local Variables  
    [Arguments]    ${timeout}=${Time_Out.Default}     
    ${Status}    BuiltIn.Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    ${_BTN_SUBMIT}    ${timeout}       
    IF    ${Status}
        AppiumLibrary.Click Element    ${_BTN_SUBMIT}
    ELSE
        Fail    msg=Button Not Found
    END 

Click Close Button
    [Documentation]    Owner : Danai Lertkamjornwat
    ...          |     ***| Description |***
    ...          |     Keyword คลิกปุ่ม Close
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Optional Parameter |***
    ...          |     $timeout    : เวลา Wait Element (ค่า default = ${Time_Out.Default})
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Examples of use |***
    ...          |     Click Close Button     🗂️ ใช้ภายในไฟล์
    ...          |     ItemPageMB.Click Close Button   🌐 ใช้ภายนอกไฟล์
    ...          ==>  
    [Setup]    _Set Test Local Variables  
    [Arguments]    ${timeout}=${Time_Out.Default}     
    ${Status}    BuiltIn.Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    ${_BTN_CLOSE}    ${timeout}       
    IF    ${Status}
        AppiumLibrary.Click Element    ${_BTN_CLOSE}
    ELSE
        Fail    msg=Button Not Found
    END   

Click Remine Me Button
    [Documentation]    Owner : Danai Lertkamjornwat
    ...          |     ***| Description |***
    ...          |     Keyword คลิกปุ่ม Remine Me
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Optional Parameter |***
    ...          |     $timeout    : เวลา Wait Element (ค่า default = ${Time_Out.Default})
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Examples of use |***
    ...          |     Click Remine Me Button     🗂️ ใช้ภายในไฟล์
    ...          |     ItemPageMB.Click Remine Me Button   🌐 ใช้ภายนอกไฟล์
    ...          ==>  
    [Setup]    _Set Test Local Variables  
    [Arguments]    ${timeout}=${Time_Out.Default}     
    ${Status}    BuiltIn.Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    ${_BTN_REMIND_ME}    ${timeout}       
    IF    ${Status}
        AppiumLibrary.Click Element    ${_BTN_REMIND_ME}
    ELSE
        Fail    msg=Button Not Found
    END
    
Click Date Button
    [Documentation]    Owner : Danai Lertkamjornwat
    ...          |     ***| Description |***
    ...          |     Keyword คลิกปุ่ม Date
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Optional Parameter |***
    ...          |     $timeout    : เวลา Wait Element (ค่า default = ${Time_Out.Default})
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Examples of use |***
    ...          |     Click Date Button     🗂️ ใช้ภายในไฟล์
    ...          |     ItemPageMB.Click Date Button   🌐 ใช้ภายนอกไฟล์
    ...          ==>  
    [Setup]    _Set Test Local Variables  
    [Arguments]    ${timeout}=${Time_Out.Default}     
    ${Status}    BuiltIn.Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    ${_BTN_DATE}    ${timeout}       
    IF    ${Status}
        AppiumLibrary.Click Element    ${_BTN_DATE}
    ELSE
        Fail    msg=Button Not Found
    END

Click Time Button
    [Documentation]    Owner : Danai Lertkamjornwat
    ...          |     ***| Description |***
    ...          |     Keyword คลิกปุ่ม Time
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Optional Parameter |***
    ...          |     $timeout    : เวลา Wait Element (ค่า default = ${Time_Out.Default})
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Examples of use |***
    ...          |     Click Time Button     🗂️ ใช้ภายในไฟล์
    ...          |     ItemPageMB.Click Time Button   🌐 ใช้ภายนอกไฟล์
    ...          ==>  
    [Setup]    _Set Test Local Variables  
    [Arguments]    ${timeout}=${Time_Out.Default}     
    ${Status}    BuiltIn.Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    ${_BTN_TIME}    ${timeout}       
    IF    ${Status}
        AppiumLibrary.Click Element    ${_BTN_TIME}
    ELSE
        Fail    msg=Button Not Found
    END

Click OK Button On Date Popup
    [Documentation]    Owner : Danai Lertkamjornwat
    ...          |     ***| Description |***
    ...          |     Keyword คลิกปุ่ม OK
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Optional Parameter |***
    ...          |     $timeout    : เวลา Wait Element (ค่า default = ${Time_Out.Default})
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Examples of use |***
    ...          |     Click OK Button On Date Popup     🗂️ ใช้ภายในไฟล์
    ...          |     ItemPageMB.Click OK Button On Date Popup   🌐 ใช้ภายนอกไฟล์
    ...          ==>  
    [Setup]    _Set Test Local Variables  
    [Arguments]    ${timeout}=${Time_Out.Default}     
    ${Status}    BuiltIn.Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    ${_BTN_OK_POPUP_DATE}    ${timeout}       
    IF    ${Status}
        AppiumLibrary.Click Element    ${_BTN_OK_POPUP_DATE}
    ELSE
        Fail    msg=Button Not Found
    END

Click Cancel Button On Date Popup
    [Documentation]    Owner : Danai Lertkamjornwat
    ...          |     ***| Description |***
    ...          |     Keyword คลิกปุ่ม Cencel
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Optional Parameter |***
    ...          |     $timeout    : เวลา Wait Element (ค่า default = ${Time_Out.Default})
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Examples of use |***
    ...          |     Click Cencel Button On Date Popup     🗂️ ใช้ภายในไฟล์
    ...          |     ItemPageMB.Click Cencel Button On Date Popup   🌐 ใช้ภายนอกไฟล์
    ...          ==>  
    [Setup]    _Set Test Local Variables  
    [Arguments]    ${timeout}=${Time_Out.Default}     
    ${Status}    BuiltIn.Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    ${_BTN_CANCEL_POPUP_DATE}    ${timeout}       
    IF    ${Status}
        AppiumLibrary.Click Element    ${_BTN_CANCEL_POPUP_DATE}
    ELSE
        Fail    msg=Button Not Found
    END

Click OK Button On Time Popup
    [Documentation]    Owner : Danai Lertkamjornwat
    ...          |     ***| Description |***
    ...          |     Keyword คลิกปุ่ม OK
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Optional Parameter |***
    ...          |     $timeout    : เวลา Wait Element (ค่า default = ${Time_Out.Default})
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Examples of use |***
    ...          |     Click OK Button On Time Popup     🗂️ ใช้ภายในไฟล์
    ...          |     ItemPageMB.Click OK Button On Time Popup   🌐 ใช้ภายนอกไฟล์
    ...          ==>  
    [Setup]    _Set Test Local Variables  
    [Arguments]    ${timeout}=${Time_Out.Default}     
    ${Status}    BuiltIn.Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    ${_BTN_OK_POPUP_TIME}    ${timeout}       
    IF    ${Status}
        AppiumLibrary.Click Element    ${_BTN_OK_POPUP_TIME}
    ELSE
        Fail    msg=Button Not Found
    END

Click Cancel Button On Time Popup
    [Documentation]    Owner : Danai Lertkamjornwat
    ...          |     ***| Description |***
    ...          |     Keyword คลิกปุ่ม Cencel
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Optional Parameter |***
    ...          |     $timeout    : เวลา Wait Element (ค่า default = ${Time_Out.Default})
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Examples of use |***
    ...          |     Click Cencel Button On Time Popup     🗂️ ใช้ภายในไฟล์
    ...          |     ItemPageMB.Click Cencel Button On Time Popup   🌐 ใช้ภายนอกไฟล์
    ...          ==>  
    [Setup]    _Set Test Local Variables  
    [Arguments]    ${timeout}=${Time_Out.Default}     
    ${Status}    BuiltIn.Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    ${_BTN_CANCEL_POPUP_TIME}    ${timeout}       
    IF    ${Status}
        AppiumLibrary.Click Element    ${_BTN_CANCEL_POPUP_TIME}
    ELSE
        Fail    msg=Button Not Found
    END

Input Title
    [Documentation]    Owner : Danai Lertkamjornwat
    ...          |     ***| Description |***
    ...          |     Keyword ระบุข้อความ
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Required Parameter |***
    ...          |     $text   : รหัสผู้ใช้งาน
    ...          --------------------------------------------------------------------------
    ...          |     ***| Optional Parameter |***
    ...          |     $timeout    : เวลา Wait Element (ค่า default = ${Time_Out.Default})
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Examples of use |***
    ...          |     Input Title    ${text}     🗂️ ใช้ภายในไฟล์
    ...          |     LoginPage.Input Title    ${text}   🌐 ใช้ภายนอกไฟล์
    ...          ==>  
    [Setup]    _Set Test Local Variables  
    [Arguments]    ${text}    ${timeout}=${Time_Out.Default}     
    ${Status}    BuiltIn.Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    ${_LBL_TITLE}    ${timeout}       
    IF    ${Status}
        AppiumLibrary.Input Text    locator=${_LBL_TITLE}    text=${text}
    ELSE
        Fail    msg=${_BTN_USERNAME} Not Found
    END