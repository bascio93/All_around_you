Feature: Results pagination
  As a user
  So that I can better view my results
  I want to have the results ordered by page

Scenario: Show the pages
  Given I am a registered user
  When I log in
  And I create an insertion "Casa piccola"
  And I create an insertion "Casa grande"
  And I create an insertion "Casa molto grande"
  And I create an insertion "Casa davvero molto grande"
  When I go to my insertions page
  Then I should see "Next ›"
  And I should see "Last »"
  When I follow "Next ›"
  Then I should see "Casa davvero molto grande"
