Feature: Insertion
  As a lessor
  So that I can share my property
  I want to create an insertion

Scenario: Create insertion
  Given I am a registered user
  And I log in
  When I follow "Mie inserzioni"
  And I follow "+ Crea inserzione +"
  And I fill in "Titolo" with "Casa grande"
  And I fill in "Descrizione" with "Molto grande"
  And I fill in "Prezzo" with "150"
  And I fill in "address_city" with "Rome, Italy"
  And I press "Crea Inserzione"
  Then I should see "Casa grande"
  And I should see "Molto grande"
  And I should see "150"
  And I should see "Rome, Italy"
