*** Settings ***
Documentation   This file contains reusable keywords

Library     SeleniumLibrary
Library     OperatingSystem

*** Variables ***
${BROWSER_NAME}     chrome
${URL}      https://www.salesforce.com/in/form/signup/freetrial-sales/


*** Keywords ***
Launch Browser

     Set Local Variable    ${driver}        chromedriver
     Append To Environment Variable    path      ${EXECDIR}\\drivers
     Open Browser  url=${URL}     browser=${BROWSER_NAME}
     Maximize Browser Window
     Set Selenium Implicit Wait    30s
     Set Screenshot Directory    ${EXECDIR}${/}screenshot

End Browser
    Capture Page Screenshot
    Close Browser