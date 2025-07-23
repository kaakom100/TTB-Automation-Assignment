*** Settings ***
Resource    ${EXECDIR}/Configuration/AllResource.robot
Documentation     `List Keyword in AboutPageMB for to used`
...                Input    : |Input Title|
...                Click    : |Click Switch Mode Button|, |Click Back Button|

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
    VAR    ${_BTN_BACK}                           ${Xpath.${ENV}.${Device}.AboutPage.btnBack}                                 scope=test 

Click Back Button
    [Documentation]    Owner : Danai Lertkamjornwat
    ...          |     ***| Description |***
    ...          |     Keyword คลิกปุ่ม Back
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Optional Parameter |***
    ...          |     $timeout    : เวลา Wait Element (ค่า default = ${Time_Out.Default})
    ...          -------------------------------------------------------------------------- 
    ...          |     ***| Examples of use |***
    ...          |     Click Back Button     🗂️ ใช้ภายในไฟล์
    ...          |     AboutPageMB.Click Back Button   🌐 ใช้ภายนอกไฟล์
    ...          ==>  
    [Setup]    _Set Test Local Variables  
    [Arguments]    ${timeout}=${Time_Out.Default}     
    ${Status}    BuiltIn.Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    ${_BTN_BACK}    ${timeout}       
    IF    ${Status}
        AppiumLibrary.Click Element    ${_BTN_BACK}
    ELSE
        Fail    msg=Button Not Found
    END 

