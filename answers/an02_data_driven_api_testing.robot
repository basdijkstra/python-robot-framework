*** Settings ***
Documentation     Our very first Robot Framework API test using RESTinstance.
Library           REST  http://api.zippopotam.us
Test Template     Request location data and check country

*** Test Cases ***  country_code  zip_code  expected_country
US zip code 90210 yields United States  us  90210  United States
CA zip code B2A yields Canada           ca  B2A    Canada
NL zip code 1718 yields Netherlands     nl  1718   Netherlands

*** Keywords ***
Request location data and check country
    [Arguments]  ${country_code}  ${zip_code}  ${expected_country}
    GET  /${country_code}/${zip_code}
    Integer  response status  200
    String  response body country  ${expected_country}

    