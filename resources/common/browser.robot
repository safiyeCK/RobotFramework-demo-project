*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}           chrome
${DEFAULT_TIMEOUT}    10s

*** Keywords ***
Open Application Browser
    [Arguments]    ${path}
    Open Browser    ${BASE_URL}${path}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout    ${DEFAULT_TIMEOUT}

Close Application Browser
    Close All Browsers
