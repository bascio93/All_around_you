Feature: User’s properties
  As a generic user
  So that I can have a summary of a user
  I want to see the list of his properties

Scenario: See user's properties
  Given I am a registered user
  When I log in
  And I create an insertion "Bello figo"
  And I create an insertion "Casa Raimondo"
  When I am on the last insertion page
  And I follow "Vedi altro dall'utente"
  Then I should see "Inserzioni dell'utente: Dhug95"
  And I should see "Bello figo"
