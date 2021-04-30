*** Settings ***
Resource  resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Browser
Test Setup  Go To Register Page

*** Test Cases ***

Register With Valid Username And Password
    Set Username  pikkumyy
    Set Password  pokkimaa
    Confirm Password  pokkimaa
    Submit Credentials
    Registration Should Succeed

Register With Too Short Username And Valid Password
    Set Username  lo
    Set Password  okeidokei
    Confirm Password  okeidokei
    Submit Credentials
    Registration Should Fail With Message  Username lo is too short

Register With Valid Username And Too Short Password
    Set Username  okeidokei
    Set Password  nu
    Confirm Password  nu
    Submit Credentials
    Registration Should Fail With Message  Password nu is too short

Register With Nonmatching Password And Password Confirmation
    Set Username  okeidokei
    Set Password  helsinki
    Confirm Password  helsinki2
    Submit Credentials
    Registration Should Fail With Message  Passwords do not match

Login After Successful Registration
    Set Username  pikkumyy
    Set Password  pokkimaa
    Confirm Password  pokkimaa
    Submit Credentials
    Go To Login Page
    Set Username  pikkumyy
    Set Password  pokkimaa
    Submit Login Credentials
    Login Should Succeed

Login After Failed Registration
    Set Username  lo
    Set Password  okeidokei
    Confirm Password  okeidokei
    Submit Credentials
    Go To Login Page
    Set Username  lo
    Set Password  okeidokei
    Submit Login Credentials
    Login Should Fail With Message  Invalid username or password

*** Keywords ***

Set Username
    [Arguments]  ${username}
    Input Text  username  ${username}

Set Password
    [Arguments]  ${password}
    Input Password  password  ${password}

Confirm Password
    [Arguments]  ${password}
    Input Password  password_confirmation  ${password}

Submit Credentials
    Click Button  Register


Submit Login Credentials
    Click Button  Login


Registration Should Succeed
    Welcome Page Should Be Open

Registration Should Fail With Message
    [Arguments]  ${message}
    Page Should Contain  ${message}

Login Should Succeed
    Main Page Should Be Open

Login Should Fail With Message
    [Arguments]  ${message}
    Login Page Should Be Open
    Page Should Contain  ${message}