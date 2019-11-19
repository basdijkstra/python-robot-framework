*** Settings ***
Documentation   Examples of how to connect to and work with a SQLite3 database
Library         DatabaseLibrary
Suite Setup     Connect To Database Using Custom Params  sqlite3  database='${DBName}'
Suite Teardown  Disconnect From Database

*** Variables ***
${DBName}         ./examples/cars.db

*** Test Cases ***
Check that a given query yields results
    Check If Exists In Database  SELECT id FROM make WHERE name = 'Fiat';

Check that a given query does not yield results
    Check If Not Exists In Database  SELECT id FROM make WHERE name = 'Volkswagen';

Check the exact row count for a query
    Row Count Is Equal To X  SELECT id FROM make WHERE name = 'Fiat';  1

Log data to log.html
    ${rowCount}  Row Count  SELECT * FROM make
    Log  ${rowCount}
    ${results}  Query  SELECT * FROM make
    Log  ${results}


