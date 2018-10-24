Feature: Sign in as a registered user
    As a registered user
    I want to sign in
    so that i can interact again with the website
Scenario: Register with valid fields
    Given the login page and an already registered user "Matteo" email "matteo5@omega.it" password "avalidpassword1234*"
    When i put email "matteo5@omega.it" and password "avalidpassword1234*"
    And i click on login
    Then i should be on my site's page and my username "Matteo" and my email "matteo5@omega.it" should appear
