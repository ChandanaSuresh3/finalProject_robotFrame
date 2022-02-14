*** Settings ***
Documentation   This suite file verifies all test cases related to valid credentials

Resource    ../pages/login_page.resource
Resource    ../pages/main_page.resource

Library    DataDriver       file=../test_data/salesForce_data.xlsx         sheet_name=validcredential

Test Setup      Launch Browser
Test Teardown   End Browser

Test Template       Verify Valid Credentials Template

*** Test Cases ***
TC1

*** Keywords ***
Verify Valid Credentials Template
   [Arguments]     ${firstname}     ${lastname}     ${email}     ${user_title}     ${company_title}    ${no_of_employees}      ${phone_no}     ${country}   ${popup_title}
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
   Wait Until Page Contains Element    xpath=//span[text()='Home']/parent::a        timeout=30s
   Main Page Title Should be    ${popup_title}
