Feature: Sign up as a visitator
    As a visitator
    I want to register
    so that i can interact with website
Scenario: Register with valid fields
    Given i am on the signup page
    When i put value on fields with email "matteo5@omega.it" username "Matteo" and password "avalidpassword1234*"
    And i click on Registrati button and then on the activation link sent at email "matteo5@omega.it"
    Then i should be redirected to my profile with email "matteo5@omega.it" username "Matteo"
