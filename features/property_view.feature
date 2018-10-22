Feature: Property view
  As a generic user
  So that I can know all about a property
  I want to click on the result I’m interested in

Scenario: Find a Property
  Given I am a registered user
  And I log in
  When I create an insertion "Casa grande"
  Given I am on the home page
  And I fill in "Inserisci la località:" with "Rome, Italy"
  When I press "Cerca"
  Then I should see "Casa grande"

Scenario: Not find a property
  Given I am on the home page
  When I fill in "Inserisci la località:" with "Toblerone"
  And I press "Cerca"
  Then I should not see "Toblerone"
  And I should see "Nessun risultato."
