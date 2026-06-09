*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Dashboard Url Should Contain
    [Arguments]    ${expected_path}
    Wait Until Location Contains    ${expected_path}    20s
    Location Should Contain    ${expected_path}
