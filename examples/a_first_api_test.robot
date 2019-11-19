*** Settings ***
Documentation     Our very first Robot Framework API test using RESTinstance.
Library           REST  https://jsonplaceholder.typicode.com

*** Test Cases ***
A First Api Test
    GET  /users/1
    Integer  response status  200
    String  response body name  Leanne Graham

