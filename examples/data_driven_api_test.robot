*** Settings ***
Documentation     Making our Robot Framework API test data driven.
Library           REST  https://jsonplaceholder.typicode.com
Test Template     Call JsonPlaceholder Api

*** Test Cases ***  USER_ID  EXPECTED_NAME
User One            1        Leanne Graham
User Two            2        Ervin Howell

*** Keywords ***
Call JsonPlaceholder Api
    [Arguments]  ${userid}  ${expectedName}
    GET  /users/${userid}
    Integer  response status  200
    String  response body name  ${expectedName}

