*** Settings ***
Resource    ${EXECDIR}/Configuration/AllResource.robot
Documentation     `List Keyword in MainPageMB for to used`
...                Open     : |Open Appication| 
...                Click    : |Click Add Item Button|, |Click Option Button|, |Click Setting Button|, |Click About Button|, |Click Item Button|

*** Keywords ***
_Set Test Local Variables
    [Documentation]    เตรียมตัวแปรสำหรับใช้งานในแต่ละ Keywords
    [Tags]    robot:private
    # Timeout
    VAR    ${_TIMEOUT_RETURN_STATUS}              ${Time_Out.Return_Status}                                      scope=test            
    VAR    ${_TIMEOUT_RETURN_STATUS_MEDIUM}       ${Time_Out.Return_Status_Medium}                               scope=test
    VAR    ${_TIMEOUT_RETURN_STATUS_QUICK}        ${Time_Out.Return_Status_Quick}                                scope=test
    VAR    ${_TIMEOUT_LONG}                       ${Time_Out.Long}                                               scope=test
    VAR    ${_TIMEOUT_DEFAULT}                    ${Time_Out.Default}                                            scope=test
    # Locator
    VAR    ${_BTN_ADD_ITEM}                       ${Xpath.${ENV}.${Device}.MinimalPage.btnAddItem}               scope=test
    VAR    ${_BTN_OPTION}                         ${Xpath.${ENV}.${Device}.MinimalPage.btnOption}                scope=test   
    VAR    ${_BTN_SETTING}                        ${Xpath.${ENV}.${Device}.MinimalPage.btnSetting}               scope=test
    VAR    ${_BTN_ABOUT}                          ${Xpath.${ENV}.${Device}.MinimalPage.btnAbout}                 scope=test
    VAR    ${_BTN_ITEM}                           ${Xpath.${ENV}.${Device}.MinimalPage.btnItem}                  scope=test
 
Open Appication
    [Documentation]    Owner : Danai Lertkamjornwat
    ...          |     ***| Description |***
    ...          |     Keyword เปิดแอปพลิเคชั่น
    ...          --------------------------------------------------------------------------
    ...          |     ***| Required Parameter |***
    ...          |     $os         : ระบบของโทรศัพท์
    ...          |     $version    : เวอร์ชั่นของโทรศัพท์
    ...          |     $devicename : ชื่อเครื่อง
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Examples of use |***
    ...          |     Open Appication     ${url}    ${browser}  🗂️ ใช้ภายในไฟล์
    ...          |     MainPage.Open Appication   ${url}    ${browser}  🌐 ใช้ภายนอกไฟล์
    ...          ==>  
    [Setup]    _Set Test Local Variables
    [Arguments]    ${os}    ${version}    ${devicename}    
    AppiumLibrary.Open Application    http://localhost:4723/wd/hub
    ...    platformName=${os}
    ...    platformVersion=${version}
    ...    deviceName=${devicename}
    ...    appPackage=com.avjindersinghsekhon.minimaltodo
    ...    appActivity=com.example.avjindersinghsekhon.toodle.MainActivity
    ...    automationName=UiAutomator2  
    ...    noReset=true
    ...    fullReset=false

Click Item Button
    [Documentation]    Owner : Danai Lertkamjornwat
    ...          |     ***| Description |***
    ...          |     Keyword คลิกปุ่มรายชื่อติดต่อ
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Optional Parameter |***
    ...          |     $timeout    : เวลา Wait Element (ค่า default = ${Time_Out.Default})
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Examples of use |***
    ...          |     Click Item Button     🗂️ ใช้ภายในไฟล์
    ...          |     MainPage.Click Item Button   🌐 ใช้ภายนอกไฟล์
    ...          ==>  
    [Setup]    _Set Test Local Variables  
    [Arguments]    ${timeout}=${Time_Out.Default}     
    ${Status}    BuiltIn.Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible        ${_BTN_ITEM}    ${timeout}       
    IF    ${Status}
        AppiumLibrary.Click Element    ${_BTN_ITEM}
    ELSE
        Fail    msg=${_BTN_ADD_ITEM}
    END

Click Add Item Button
    [Documentation]    Owner : Danai Lertkamjornwat
    ...          |     ***| Description |***
    ...          |     Keyword คลิกปุ่มเพิ่มรายชื่อติดต่อ
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Optional Parameter |***
    ...          |     $timeout    : เวลา Wait Element (ค่า default = ${Time_Out.Default})
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Examples of use |***
    ...          |     Click Add Item Button     🗂️ ใช้ภายในไฟล์
    ...          |     MainPage.Click Add Item Button   🌐 ใช้ภายนอกไฟล์
    ...          ==>  
    [Setup]    _Set Test Local Variables  
    [Arguments]    ${timeout}=${Time_Out.Default}     
    ${Status}    BuiltIn.Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible        ${_BTN_ADD_ITEM}    ${timeout}       
    IF    ${Status}
        AppiumLibrary.Click Element    ${_BTN_ADD_ITEM}
    ELSE
        Fail    msg=Button Not Found
    END

Click Option Button
    [Documentation]    Owner : Danai Lertkamjornwat
    ...          |     ***| Description |***
    ...          |     Keyword คลิกปุ่มเพิ่มเติม
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Optional Parameter |***
    ...          |     $timeout    : เวลา Wait Element (ค่า default = ${Time_Out.Default})
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Examples of use |***
    ...          |     Click Option Button     🗂️ ใช้ภายในไฟล์
    ...          |     MainPage.Click Option Button   🌐 ใช้ภายนอกไฟล์
    ...          ==>  
    [Setup]    _Set Test Local Variables  
    [Arguments]    ${timeout}=${Time_Out.Default}     
    ${Status}    BuiltIn.Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    ${_BTN_OPTION}    ${timeout}       
    IF    ${Status}
        AppiumLibrary.Click Element    ${_BTN_OPTION}
    ELSE
        Fail    msg=Button Not Found
    END

Click Setting Button
    [Documentation]    Owner : Danai Lertkamjornwat
    ...          |     ***| Description |***
    ...          |     Keyword คลิกปุ่มตั้งค่า
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Optional Parameter |***
    ...          |     $timeout    : เวลา Wait Element (ค่า default = ${Time_Out.Default})
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Examples of use |***
    ...          |     Click Setting Button     🗂️ ใช้ภายในไฟล์
    ...          |     MainPage.Click Setting Button   🌐 ใช้ภายนอกไฟล์
    ...          ==>  
    [Setup]    _Set Test Local Variables  
    [Arguments]    ${timeout}=${Time_Out.Default}     
    ${Status}    BuiltIn.Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    ${_BTN_SETTING}    ${timeout}       
    IF    ${Status}
        AppiumLibrary.Click Element    ${_BTN_SETTING}
    ELSE
        Fail    msg=Button Not Found
    END
    
Click About Button
    [Documentation]    Owner : Danai Lertkamjornwat
    ...          |     ***| Description |***
    ...          |     Keyword คลิกปุ่ม About
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Optional Parameter |***
    ...          |     $timeout    : เวลา Wait Element (ค่า default = ${Time_Out.Default})
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Examples of use |***
    ...          |     Click About Button     🗂️ ใช้ภายในไฟล์
    ...          |     MainPage.Click About Button   🌐 ใช้ภายนอกไฟล์
    ...          ==>  
    [Setup]    _Set Test Local Variables  
    [Arguments]    ${timeout}=${Time_Out.Default}     
    ${Status}    BuiltIn.Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    ${_BTN_ABOUT}    ${timeout}       
    IF    ${Status}
        AppiumLibrary.Click Element    ${_BTN_ABOUT}
    ELSE
        Fail    msg=Button Not Found
    END

