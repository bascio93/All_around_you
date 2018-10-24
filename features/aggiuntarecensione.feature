Feature: Add a review
    As a registered user
    I want to add a review to a service
Scenario: Adding review with valid fields
    Given i am on a service page to add a review
    When i add a review with titolo "bel bar" voto 7 contenuto "bel bar"
    And i click on post button of the review
    Then i should view in the service page titolo "bel bar" voto 7 contenuto "bel bar"
