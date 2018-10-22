Feature:  Nearest properties
  As a user
  So that I can quickly find other properties
  I want to see the properties which are nearest to the current

Scenario: Show the properties
  Given I am a registered user
  When I log in
  And I create an insertion "Casa grande"
  And I create an insertion "Casa molto grande"
  When I am on the last insertion page
  Then I should see "Proprietà nelle vicinanze"
  And I should see "Casa grande"
