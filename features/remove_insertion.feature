Feature: Remove insertion
  As a lessor
  So that I can communicate that the property is no more available
  I want to remove an insertion

Scenario: Remove an insertion
  Given I am a registered user
  When I log in
  And I create an insertion "Casa grande"
  When I am on the last insertion page
  And I follow "Elimina"
  Then I should be on my insertions page
  And I should not see "Casa grande"
