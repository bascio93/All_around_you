Feature: Property Reviews
  As a lessee
  So that I can share my opinion about a property
  I want to write a review

Scenario: Leave a review
  Given I am a registered user
  And there's another user
  When he logs in
  And he creates an insertion "Casa grande"
  And he logs out
  When I log in
  When I go to the last insertion page
  And I follow "Scrivi una recensione"
  And I fill in "review[title]" with "Molto bella"
  And I fill in "review[body]" with "Ne vale la pena"
  And I press "Invia recensione"
  Then I should see "Molto bella"
  And I should see "Ne vale la pena"
