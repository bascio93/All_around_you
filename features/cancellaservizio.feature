Feature: Delete a favorite service
    As a registered user
    I want to delete a service from my favorite list
Scenario: Adding review with valid fields
    Given i am on my favorite services list and i want to delete a service with id 13 from favorites
    When i click cancella 
    Then i shouldnt see the service with id 13 into the favorite list 

