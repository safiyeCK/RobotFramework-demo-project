*** Settings ***
Variables    ../resources/variables/environment.py
Resource    ../resources/common/browser.robot
Resource    ../resources/pages/login_page.robot
Resource    ../resources/pages/dashboard_page.robot
Suite Setup    Open Application Browser    ${LOGIN_PATH}
Test Setup    Open Login Page
Suite Teardown    Close Application Browser

*** Test Cases ***
TC01 - Login Test With Valid Data
    [Tags]    smoke    regression    login
    Login With Credentials    ${VALID_EMAIL}    ${VALID_PASSWORD}
    Dashboard Url Should Contain    ${DASHBOARD_PATH}

TC02 - Login Test With Invalid Email
    [Tags]    regression    login    negative
    Login With Credentials    ${INVALID_EMAIL}    ${VALID_PASSWORD}
    Invalid Login Message Should Be    ${INVALID_LOGIN_MESSAGE}

TC03 - Login Test With Invalid Password
    [Tags]    regression    login    negative
    Login With Credentials    ${VALID_EMAIL}    ${INVALID_PASSWORD}
    Invalid Login Message Should Be    ${INVALID_LOGIN_MESSAGE}

TC04 - Login Test With Invalid Data
    [Tags]    regression    login    negative
    Login With Credentials    ${INVALID_EMAIL}    ${INVALID_PASSWORD}
    Invalid Login Message Should Be    ${INVALID_LOGIN_MESSAGE}
