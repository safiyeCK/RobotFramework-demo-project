*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${FIRST_NAME_INPUT}              id=first_name
${LAST_NAME_INPUT}               id=last_name
${DATE_OF_BIRTH_INPUT}           id=dob
${POST_CODE_INPUT}               id=postal_code
${HOUSE_NUMBER_INPUT}            id=house_number
${STREET_INPUT}                  id=street
${CITY_INPUT}                    id=city
${STATE_INPUT}                   id=state
${COUNTRY_SELECT}                id=country
${PHONE_INPUT}                   id=phone
${EMAIL_INPUT}                   id=email
${PASSWORD_INPUT}                id=password
${REGISTER_BUTTON}               css=[type="submit"]
${EMAIL_ALREADY_EXISTS_MESSAGE}  css=.help-block
${PASSWORD_MIN_ERROR}            css=[data-test="password-error"]
${FIRST_NAME_ERROR}              css=[data-test="first-name-error"]
${LAST_NAME_ERROR}               css=[data-test="last-name-error"]
${DOB_ERROR}                     css=[data-test="dob-error"]
${HOUSE_NUMBER_ERROR}            css=[data-test="house_number-error"]
${STREET_ERROR}                  css=[data-test="street-error"]
${POST_CODE_ERROR}               css=[data-test="postal_code-error"]
${CITY_ERROR}                    css=[data-test="city-error"]
${STATE_ERROR}                   css=[data-test="state-error"]
${COUNTRY_ERROR}                 css=[data-test="country-error"]
${PHONE_ERROR}                   css=[data-test="phone-error"]
${EMAIL_ERROR}                   css=[data-test="email-error"]
${PASSWORD_ERROR}                css=[data-test="password-error"]

*** Keywords ***
Open Register Page
    Go To    ${BASE_URL}${REGISTER_PATH}

Fill Registration Form
    [Arguments]    ${first_name}    ${last_name}    ${date_of_birth}    ${house_number}    ${street}    ${post_code}    ${city}    ${state}    ${country}    ${phone}    ${email}    ${password}
    Wait Until Element Is Visible    ${FIRST_NAME_INPUT}
    Input Text    ${FIRST_NAME_INPUT}    ${first_name}
    Input Text    ${LAST_NAME_INPUT}    ${last_name}
    Input Text    ${DATE_OF_BIRTH_INPUT}    ${date_of_birth}
    Input Text    ${HOUSE_NUMBER_INPUT}    ${house_number}
    Input Text    ${STREET_INPUT}    ${street}
    Input Text    ${POST_CODE_INPUT}    ${post_code}
    Input Text    ${CITY_INPUT}    ${city}
    Input Text    ${STATE_INPUT}    ${state}
    Select From List By Label    ${COUNTRY_SELECT}    ${country}
    Input Text    ${PHONE_INPUT}    ${phone}
    Input Text    ${EMAIL_INPUT}    ${email}
    Input Text    ${PASSWORD_INPUT}    ${password}

Submit Registration Form
    Click Button    ${REGISTER_BUTTON}

Email Already Exists Message Should Be
    [Arguments]    ${expected_message}
    Wait Until Page Contains    ${expected_message}    20s
    Page Should Contain    ${expected_message}

Password Min Length Message Should Be
    [Arguments]    ${expected_message}
    Page Should Contain    ${expected_message}

Required Field Message Should Be
    [Arguments]    ${field_error_locator}    ${expected_message}
    ${field_error_text}=    Get Text    ${field_error_locator}
    Should Contain    ${field_error_text}    ${expected_message}
