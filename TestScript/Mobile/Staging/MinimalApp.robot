*** Settings ***
# Page
Resource    ${EXECDIR}/Pages/Mobile/MainPageMB.robot
Resource    ${EXECDIR}/Pages/Mobile/ItemPageMB.robot
Resource    ${EXECDIR}/Pages/Mobile/AboutPageMB.robot
Resource    ${EXECDIR}/Pages/Mobile/SettingPageMB.robot
Suite Teardown    Close Application

*** Variables ***
# Data Test    
${_ANDROID}                       Android  
${_13}                            13
${_DEVICE_NAME}                   R5CWA3BGJ3Z
${_DANAI01}                       Danai01
${_DANAI02}                       Danai02
   
*** Test Cases ***
Main Flow Add Item Success
    [Documentation]    Owner : Danai Lertkamjornwat
    ...           |    ***| Description |***
    ...           |    ตรวจสอบ Flow การทำงาน
    ...           --------------------------------------------------------------------------
    ...           |    ***| Test Step |***
    ...           |    1. เปิดเปิดแอปพลิเคชัน 
    ...           |    2. คลิกปุ่มเพิ่มข้อมูล
    ...           |    3. คลิกปุ่มปิด
    ...           |    4. คลิกปุ่มเพิ่มข้อมูล
    ...           |    5. ระบุข้อมูล
    ...           |    6. คลิกปุ่ม Remind Me
    ...           |    7. คลิกปุ่ม Date
    ...           |    8. คลิกปุ่ม Cancel On Date Popup
    ...           |    9. คลิกปุ่ม Date
    ...           |   10. คลิกปุ่ม Ok On Date Popup
    ...           |   11. คลิกปุ่ม Time
    ...           |   12. คลิกปุ่ม Cencel On Time Popup
    ...           |   13. คลิกปุ่ม Time
    ...           |   14. คลิกปุ่ม OK On Time Popup
    ...           |   15. คลิกปุ่ม Remind Me
    ...           |   16. คลิกปุ่ม Submit
    ...           --------------------------------------------------------------------------
    ...           |    ***| Expected Result |***
    ...           |    สามารถระบุข้อมูลได้และปุ่มทั้งหมดในหน้า Item สามารถคลิกได้ทั้งหมด
    ...           ==> 
    [Tags]    success
    MainPageMB.Open Appication    os=${_ANDROID}    version=${_13}    devicename=${_DEVICE_NAME}
    MainPageMB.Click Add Item Button
    ItemPageMB.Click Close Button
    MainPageMB.Click Add Item Button
    ItemPageMB.Input Title    text=${_DANAI01}
    ItemPageMB.Click Remine Me Button
    ItemPageMB.Click Date Button
    ItemPageMB.Click Cancel Button On Date Popup
    ItemPageMB.Click Date Button
    ItemPageMB.Click OK Button On Date Popup
    ItemPageMB.Click Time Button
    ItemPageMB.Click Cancel Button On Time Popup
    ItemPageMB.Click Time Button
    ItemPageMB.Click OK Button On Time Popup
    ItemPageMB.Click Remine Me Button
    ItemPageMB.Click Summit Button

Main Flow Click About Success
    [Documentation]    Owner : Danai Lertkamjornwat
    ...           |    ***| Description |***
    ...           |    ตรวจสอบ Flow การทำงาน
    ...           --------------------------------------------------------------------------
    ...           |    ***| Test Step |***
    ...           |    1. เปิดเปิดแอปพลิเคชัน 
    ...           |    2. คลิกปุ่ม Option
    ...           |    3. คลิกปุ่ม About
    ...           |    4. คลิกปุ่ม Back
    ...           --------------------------------------------------------------------------
    ...           |    ***| Expected Result |***
    ...           |    สามารถคลิกปุ่มทั้งหมดในหน้า About ได้ทั้งหมด
    ...           ==> 
    [Tags]    success
    MainPageMB.Open Appication    os=${_ANDROID}    version=${_13}    devicename=${_DEVICE_NAME}
    MainPageMB.Click Option Button
    MainPageMB.Click About Button
    AboutPageMB.Click Back Button

Main Flow Click Setting Success
    [Documentation]    Owner : Danai Lertkamjornwat
    ...           |    ***| Description |***
    ...           |    ตรวจสอบ Flow การทำงาน
    ...           --------------------------------------------------------------------------
    ...           |    ***| Test Step |***
    ...           |    1. เปิดเปิดแอปพลิเคชัน 
    ...           |    2. คลิกปุ่ม Option
    ...           |    3. คลิกปุ่ม Setting
    ...           |    4. คลิกปุ่ม Switch Mode
    ...           |    5. คลิกปุ่ม Back Mode
    ...           --------------------------------------------------------------------------
    ...           |    ***| Expected Result |***
    ...           |    สามารถคลิกปุ่มทั้งหมดในหน้า Setting ได้ทั้งหมด
    ...           ==> 
    [Tags]    success
    MainPageMB.Open Appication    os=${_ANDROID}    version=${_13}    devicename=${_DEVICE_NAME}
    MainPageMB.Click Option Button
    MainPageMB.Click Setting Button
    SettingPageMB.Click Switch Mode Button
    SettingPageMB.Click Switch Mode Button
    SettingPageMB.Click Back Button

Main Flow Edit Item Success
    [Documentation]    Owner : Danai Lertkamjornwat
    ...           |    ***| Description |***
    ...           |    ตรวจสอบ Flow การทำงาน
    ...           --------------------------------------------------------------------------
    ...           |    ***| Test Step |***
    ...           |    1. เปิดเปิดแอปพลิเคชัน 
    ...           |    2. คลิกที่รายชื่อ
    ...           |    3. แก้ไขข้อมูล
    ...           |    4. คลิกปุ่ม Switch Mode
    ...           |    5. คลิกปุ่ม Back Mode
    ...           --------------------------------------------------------------------------
    ...           |    ***| Expected Result |***
    ...           |    สามารถคลิกปุ่มทั้งหมดในหน้า Setting ได้ทั้งหมด
    ...           ==> 
    [Tags]    success
    MainPageMB.Open Appication    os=${_ANDROID}    version=${_13}    devicename=${_DEVICE_NAME}
    MainPageMB.Click Item Button
    ItemPageMB.Input Title    text=${_DANAI02}
    ItemPageMB.Click Summit Button

Main Flow Delete Item Success
    [Documentation]    Owner : Danai Lertkamjornwat
    ...           |    ***| Description |***
    ...           |    ตรวจสอบ Flow การทำงาน
    ...           --------------------------------------------------------------------------
    ...           |    ***| Test Step |***
    ...           |    1. เปิดเปิดแอปพลิเคชัน 
    ...           |    2. ลบรายชื่อ
    ...           --------------------------------------------------------------------------
    ...           |    ***| Expected Result |***
    ...           |    สามารถลบรายชื่อได้
    ...           ==> 
    [Tags]    success
    MainPageMB.Open Appication    os=${_ANDROID}    version=${_13}    devicename=${_DEVICE_NAME}
    Sleep    2s
    Swipe    start_x=550    start_y=550    offset_x=1000    offset_y=600    duration=500





