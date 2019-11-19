*** Settings ***
Documentation     Our very first Robot Framework API test using RESTinstance.
Library           REST  http://api.zippopotam.us

*** Test Cases ***
Check that US zip code 90210 returns HTTP 200 and country United States
    GET  /us/90210
    Integer  response status  200
    String  response body country  United States

    