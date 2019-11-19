*** Settings ***
Documentation   Examples of how to connect to and work with a SQLite3 database
Library         DatabaseLibrary
Suite Setup     Connect To Database Using Custom Params  sqlite3  database='${DBName}'
Suite Teardown  Disconnect From Database

*** Variables ***
${DBName}         ./answers/crm.db

*** Test Cases ***
Check that there is a customer called 'Rebecca' in the database
    Check If Exists In Database  SELECT * FROM customer WHERE first_name = 'Rebecca';

Check that there is no customer called 'Barry' in the database
    Check If Not Exists In Database  SELECT * FROM customer WHERE first_name = 'Barry';

Check that there is one customer in the database that lives in Detroit
    Row Count Is Equal To X  SELECT * FROM customer INNER JOIN address ON customer.id = address.customer_id WHERE address.city = 'Detroit';  1

Store the city for customer with first name 'John' in a variable and write it to the log
    ${city}  Query  SELECT address.city FROM customer INNER JOIN address ON customer.id = address.customer_id WHERE customer.first_name = 'John';
    Log  ${city}[0]