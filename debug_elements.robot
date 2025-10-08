*** Settings ***
Library           SeleniumLibrary
Library           Collections

*** Variables ***
${SERVER}         http://localhost:3000
${BROWSER}        Chrome

*** Test Cases ***
Debug Elements
    [Documentation]    ทดสอบเพื่อหา element IDs ที่ถูกต้อง
    Open Browser    ${SERVER}    ${BROWSER}
    Maximize Browser Window
    Sleep    2s
    
    # ลองหา input fields ทั้งหมด
    ${inputs}=    Get WebElements    xpath=//input
    ${input_count}=    Get Length    ${inputs}
    Log    Found ${input_count} input elements
    
    FOR    ${index}    IN RANGE    ${input_count}
        ${element}=    Get From List    ${inputs}    ${index}
        ${type}=    Get Element Attribute    ${element}    type
        ${id}=    Get Element Attribute    ${element}    id
        ${name}=    Get Element Attribute    ${element}    name
        ${class}=    Get Element Attribute    ${element}    class
        Log    Input ${index}: type=${type}, id=${id}, name=${name}, class=${class}
    END
    
    # ลองหา button elements ทั้งหมด
    ${buttons}=    Get WebElements    xpath=//button
    ${button_count}=    Get Length    ${buttons}
    Log    Found ${button_count} button elements
    
    FOR    ${index}    IN RANGE    ${button_count}
        ${element}=    Get From List    ${buttons}    ${index}
        ${type}=    Get Element Attribute    ${element}    type
        ${id}=    Get Element Attribute    ${element}    id
        ${text}=    Get Text    ${element}
        ${class}=    Get Element Attribute    ${element}    class
        Log    Button ${index}: type=${type}, id=${id}, text=${text}, class=${class}
    END
    
    [Teardown]    Close Browser