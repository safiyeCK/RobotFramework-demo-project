*** Settings ***
Variables    ../resources/variables/environment.py
Resource    ../resources/common/browser.robot
Resource    ../resources/common/data.robot
Resource    ../resources/pages/login_page.robot
Resource    ../resources/pages/register_page.robot
Suite Setup    Open Application Browser    ${REGISTER_PATH}
Test Setup    Open Register Page
Suite Teardown    Close Application Browser

*** Test Cases ***
TC01 - Register Test With Valid Data
    [Tags]    smoke    regression    register
    ${unique_email}=    Generate Unique Email
    ${strong_password}=    Generate Strong Password
    Fill Registration Form    ${REGISTER_FIRST_NAME}    ${REGISTER_LAST_NAME}    ${REGISTER_DATE_OF_BIRTH}    ${REGISTER_HOUSE_NUMBER}    ${REGISTER_STREET}    ${REGISTER_POST_CODE}    ${REGISTER_CITY}    ${REGISTER_STATE}    ${REGISTER_COUNTRY}    ${REGISTER_PHONE}    ${unique_email}    ${strong_password}
    Submit Registration Form
    Login Page Title Should Be    ${PAGE_TITLE}

TC02 - Register Test With Less Than 6 Characters
    [Tags]    regression    register    negative
    Fill Registration Form    ${REGISTER_FIRST_NAME}    ${REGISTER_LAST_NAME}    ${REGISTER_DATE_OF_BIRTH}    ${REGISTER_HOUSE_NUMBER}    ${REGISTER_STREET}    ${REGISTER_POST_CODE}    ${REGISTER_CITY}    ${REGISTER_STATE}    ${REGISTER_COUNTRY}    ${REGISTER_PHONE}    short_${TARGET_ENV}@example.com    ${REGISTER_SHORT_PASSWORD}
    Submit Registration Form
    Password Min Length Message Should Be    ${REGISTER_PASSWORD_ERROR}

TC03 - Register Test With Same Email Data
    [Tags]    regression    register    negative
    ${duplicate_email}=    Generate Unique Email
    ${strong_password}=    Generate Strong Password
    Fill Registration Form    ${REGISTER_FIRST_NAME}    ${REGISTER_LAST_NAME}    ${REGISTER_DATE_OF_BIRTH}    ${REGISTER_HOUSE_NUMBER}    ${REGISTER_STREET}    ${REGISTER_POST_CODE}    ${REGISTER_CITY}    ${REGISTER_STATE}    ${REGISTER_COUNTRY}    ${REGISTER_PHONE}    ${duplicate_email}    ${strong_password}
    Submit Registration Form
    Login Page Title Should Be    ${PAGE_TITLE}
    Open Register Page
    Fill Registration Form    ${REGISTER_FIRST_NAME}    ${REGISTER_LAST_NAME}    ${REGISTER_DATE_OF_BIRTH}    ${REGISTER_HOUSE_NUMBER}    ${REGISTER_STREET}    ${REGISTER_POST_CODE}    ${REGISTER_CITY}    ${REGISTER_STATE}    ${REGISTER_COUNTRY}    ${REGISTER_PHONE}    ${duplicate_email}    ${strong_password}
    Submit Registration Form
    Email Already Exists Message Should Be    ${REGISTER_DUPLICATE_EMAIL_MESSAGE}

TC04 - Validating Required Field Messages
    [Tags]    regression    register    validation
    Open Register Page
    Submit Registration Form
    Required Field Message Should Be    ${FIRST_NAME_ERROR}    ${REGISTER_REQUIRED_FIRST_NAME}
    Required Field Message Should Be    ${LAST_NAME_ERROR}    ${REGISTER_REQUIRED_LAST_NAME}
    Required Field Message Should Be    ${DOB_ERROR}    ${REGISTER_REQUIRED_DOB}
    Required Field Message Should Be    ${HOUSE_NUMBER_ERROR}    ${REGISTER_REQUIRED_HOUSE_NUMBER}
    Required Field Message Should Be    ${STREET_ERROR}    ${REGISTER_REQUIRED_STREET}
    Required Field Message Should Be    ${POST_CODE_ERROR}    ${REGISTER_REQUIRED_POST_CODE}
    Required Field Message Should Be    ${CITY_ERROR}    ${REGISTER_REQUIRED_CITY}
    Required Field Message Should Be    ${STATE_ERROR}    ${REGISTER_REQUIRED_STATE}
    Required Field Message Should Be    ${COUNTRY_ERROR}    ${REGISTER_REQUIRED_COUNTRY}
    Required Field Message Should Be    ${PHONE_ERROR}    ${REGISTER_REQUIRED_PHONE}
    Required Field Message Should Be    ${EMAIL_ERROR}    ${REGISTER_REQUIRED_EMAIL}
    Required Field Message Should Be    ${PASSWORD_ERROR}    ${REGISTER_REQUIRED_PASSWORD}
