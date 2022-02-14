*** Settings ***
Documentation      This suit file handles all the test case related to the invalid credentials
Resource    ../pages/login_page.resource

Test Setup      Launch Browser
Test Teardown   End Browser

Test Template       Verify Invalid Credential Template

*** Test Cases ***
TC1     john    wick    john@gmail.com    Sales Manager    Ltts    1 - 15 employees    ${EMPTY}      United Kingdom     Enter a valid phone number
TC2     jeenu    jolly      jeenu@gmail.com     Operations Manager      dell    101 - 500 employees     ${EMPTY}    United Kingdom      Enter a valid phone number

*** Keywords ***
Verify Invalid Credential Template
    [Arguments]     ${firstname}     ${lastname}     ${email}     ${user_title}     ${company_title}    ${no_of_employees}      ${phone_no}     ${country}   ${expected_error}
    Enter Firstname    ${firstname}
    Enter Lastname    ${lastname}
    Enter Email    ${email}
    Select Title Using Label       ${user_title}
    Enter Company_title    ${company_title}
    Select Employees Using Label        ${no_of_employees}
    Enter Phoneno    ${phone_no}
    Select Country Using Label     ${country}
    Execute Javascript   document.getElementById('SubscriptionAgreement').click()
    Click Login
    Validate Invalid Error Message    ${expected_error}
