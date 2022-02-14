*** Settings ***
Documentation   this file handles all the operation in the login page of salesforce

Resource    ../base/common_functionality.resource

*** Variables ***
${FIRSTNAME_LOCATOR}     name=UserFirstName
${LASTNAME_LOCATOR}     name=UserLastName
${EMAIL_LOCATOR}     name=UserEmail
${USERTITLE_LOCATOR}        name=UserTitle
${COMPANYTITLE_LOCATOR}     name=CompanyName
${COMPANYEMPLOYEES_LOCATOR}     name=CompanyEmployees
${PHONENO_LOCATOR}      name=UserPhone
${CCOUNTRY_LOCATOR}     name=CompanyCountry
${LOGIN_LOCATOR}        name=start my free trial
${ERROR_LOCATOR}        xpath=//span[text()='Enter a valid phone number']


*** Keywords ***
Enter Firstname
    [Arguments]     ${firstname}
    Input Text    ${FIRSTNAME_LOCATOR}    ${firstname}

Enter Lastname
    [Arguments]     ${lastname}
    Input Text    ${LASTNAME_LOCATOR}    ${lastname}

Enter Email
    [Arguments]     ${email}
    Input Text    ${EMAIL_LOCATOR}    ${email}

Select Title Using Label
    [Arguments]     ${user_title}
    Select From List By Label    ${USERTITLE_LOCATOR}    ${user_title}


Enter Company_title
    [Arguments]     ${company_title}
    Input Text    ${COMPANYTITLE_LOCATOR}     ${company_title}

Select Employees Using Label
    [Arguments]     ${no_of_employees}
    Select From List By Label    ${COMPANYEMPLOYEES_LOCATOR}    ${no_of_employees}

Enter Phoneno
    [Arguments]     ${phone_no}
    Input Text    ${PHONENO_LOCATOR}     ${phone_no}

Select Country Using Label
    [Arguments]     ${country}
    Select From List By Label    ${CCOUNTRY_LOCATOR}    ${country}

Click Login
        Click Element    ${LOGIN_LOCATOR}

Validate Invalid Error Message
    [Arguments]     ${expected_error}
    Element Should Contain    ${ERROR_LOCATOR}       ${expected_error}