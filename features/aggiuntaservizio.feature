Feature: Add a service
    As a registered user
    I want to add a service
    so that i can let people know about my new service!
Scenario: Register with valid fields
    Given i am on the logged home page
    When i add a new service with name "barbello" indirizzo "Corso Garibaldi Ariccia" tipo "Bar" descrizione "è caruccio sto bar"
    And i click on crea button
    Then i should be redirected to my new service and i should see name "barbello" indirizzo "Corso Garibaldi Ariccia" tipo "Bar" descrizione "è caruccio sto bar" in the page
