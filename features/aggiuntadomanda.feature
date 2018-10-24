Feature: Add a question
    As a registered user
    I want to add a question to the creator of a service about his service
Scenario: Adding question with valid field
    Given i am on a service page
    When i add a question asking "A che ora chiude?"
    And i click on post button of the question
    Then i should view into the service page my question "A che ora chiude?"
