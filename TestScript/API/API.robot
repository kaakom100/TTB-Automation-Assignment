*** Settings ***
Resource    ${EXECDIR}/Configuration/AllResource.robot

*** Variables ***
# Config 
${_BASE_URL}    https://reqres.in/api
${_API_KEY}     reqres-free-v1
${_SESSION}     api_session

*** Test Cases ***
Get User Profile success
    [Documentation]    Owner : Danai Lertkamjornwat
    ...           |    ***| Description |***
    ...           |    ตรวจสอบยิง API Status 200
    ...           --------------------------------------------------------------------------
    ...           |    ***| Test Step |***
    ...           |    1.Send Get requestto url https://reqres.in/api/users/12
    ...           --------------------------------------------------------------------------
    ...           |    ***| Expected Result |***
    ...           |    ตรวจสอบถูกต้องและ API ขึ้น Status 200
    ...           ==> 
    [Tags]    api
    RequestsLibrary.Create Session    ${_SESSION}    ${_BASE_URL}    headers={"x-api-key": "${_API_KEY}"}
    ${response}=    RequestsLibrary.GET On Session    ${_SESSION}    /users/12
    BuiltIn.Should Be Equal As Integers    ${response.status_code}    200
    ${jsondata}=    RequestsLibrary.To Json    ${response.text}
    ${data}=    Collections.Get From Dictionary    ${jsondata}    data
    BuiltIn.Should Be Equal As Integers    ${data['id']}    12
    BuiltIn.Should Be Equal    ${data['email']}    rachel.howell@reqres.in
    BuiltIn.Should Be Equal    ${data['first_name']}    Rachel
    BuiltIn.Should Be Equal    ${data['last_name']}     Howell
    BuiltIn.Should Be Equal    ${data['avatar']}    https://reqres.in/img/faces/12-image.jpg

Get User Profile Not Found
    [Documentation]    Owner : Danai Lertkamjornwat
    ...           |    ***| Description |***
    ...           |    ตรวจสอบยิง API Status 404
    ...           --------------------------------------------------------------------------
    ...           |    ***| Test Step |***
    ...           |    1.Send Get requestto url https://reqres.in/api/users/1234
    ...           --------------------------------------------------------------------------
    ...           |    ***| Expected Result |***
    ...           |    ยิงไปต้องได้ Status 404 และไม่มีข้อมูล
    ...           ==> 
    [Tags]    api
    RequestsLibrary.Create Session    ${_SESSION}    ${_BASE_URL}    headers={"x-api-key": "${_API_KEY}"}
    ${response}=    RequestsLibrary.GET On Session    ${_SESSION}    /users/1234    expected_status=any
    BuiltIn.Should Be Equal As Integers    ${response.status_code}    404
    BuiltIn.Should Be Equal    ${response.text}    {}

  