*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN_TITLE}           css=h3
${EMAIL_INPUT}           id=email
${PASSWORD_INPUT}        id=password
${LOGIN_BUTTON}          css=[value="Login"]
${LOGIN_ERROR_MESSAGE}   css=.help-block

*** Keywords ***
Open Login Page
    Go To    ${BASE_URL}${LOGIN_PATH}

Login With Credentials
    [Arguments]    ${email}    ${password}
    Wait Until Element Is Visible    ${EMAIL_INPUT}
    Input Text    ${EMAIL_INPUT}    ${email}
    Input Text    ${PASSWORD_INPUT}    ${password}
    Click Element    ${LOGIN_BUTTON}

Login Page Title Should Be
    [Arguments]    ${expected_title}
    Wait Until Element Contains    ${LOGIN_TITLE}    ${expected_title}    20s
    Element Text Should Be    ${LOGIN_TITLE}    ${expected_title}

Invalid Login Message Should Be
    [Arguments]    ${expected_message}
    Wait Until Element Contains    ${LOGIN_ERROR_MESSAGE}    ${expected_message}    20s
    Element Text Should Be    ${LOGIN_ERROR_MESSAGE}    ${expected_message}
