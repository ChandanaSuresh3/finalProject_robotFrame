*** Settings ***
Documentation   This file handles all the menu for salesforce application

Resource    ../base/common_functionality.resource

*** Keywords ***
Main Page Title Should be
    [Arguments]     ${popup_title}
    Title Should Be    ${popup_title}