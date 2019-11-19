*** Settings ***
Documentation     Our very first Robot Framework Selenium test.
Library           SeleniumLibrary

*** Test Cases ***
Perform a Google search
    Open Browser    https://www.google.com  Chrome
    Maximize Browser Window
    Input Text  name:q  Robot Framework
    Click Button    name:btnK
    Title Should Be     Robot Framework - Google zoeken
    Close Browser

    