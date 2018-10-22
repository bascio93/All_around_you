Feature: Delete favourite
  As a registered user
  So that I can no longer have updates about a property
  I want to delete it from my favourites

Scenario: Delete a property from list
  Given I am a registered user
  And there's another user
  When he logs in
  And he creates an insertion "Mondial casa"
  And he logs out
  When I log in
  And I am on the last insertion page
  And I follow "Aggiungi ai preferiti"
  When I follow "Preferiti"
  Then I should see "Mondial casa"
  When I am on the last insertion page
  And I follow "Rimuovi dai preferiti"
  When I follow "Preferiti"
  Then I should not see "Mondial casa"
