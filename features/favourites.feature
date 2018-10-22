Feature: Favourites
  As a registered user
  So that I can remember the properties I like
  I want to add them to my favourites

Scenario: Add to favourites
  Given I am a registered user
  And there's another user
  And he logs in
  And he creates an insertion "Casa grande"
  And he logs out
  When I log in
  And I am on the last insertion page
  And I follow "Aggiungi ai preferiti"
  When I follow "Preferiti"
  Then I should see "Casa grande"
