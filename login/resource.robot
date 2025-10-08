*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         http://localhost:3000
${BROWSER}        Chrome
${VALID USER}     student
${VALID PASSWORD}    123456
${LOGIN URL}      ${SERVER}/
${WELCOME URL}    ${SERVER}/users
${ERROR URL}      ${SERVER}/login

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Create Next App
    Wait Until Page Contains Element    name=username    10s

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    name=username    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    name=password    ${password}

Submit Credentials
    Click Button    xpath=//button[@type='submit']
    Handle Any Popup

Handle Any Popup
    [Documentation]    Handle any popup or modal that might appear after login
    Sleep    2s
    ${popup_present}=    Run Keyword And Return Status    Page Should Contain Element    css=.swal2-container
    Run Keyword If    ${popup_present}    Click Element    css=.swal2-confirm
    Sleep    1s

Welcome Page Should Be Open
    Wait Until Location Contains    /users    10s
    Location Should Be    ${WELCOME URL}
    Title Should Be    Create Next App

Login Should Have Failed
    Location Should Be    ${ERROR URL}
    Title Should Be    Create Next App

