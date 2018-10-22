Feature: Ordering results
  As a visitor
  So that I can better organize the results of my search
  I want to order results by some parameters

Scenario: Order results
  Given I am a registered user
  When I log in
  And I create an insertion "Casa grande"
  And I create an insertion "Casa bella"
  When I am on the home page
  And I fill in "Inserisci la località:" with "Rome, Italy"
  When I press "Cerca"
  Then I should see "Casa grande"
  And I should see "Casa bella"
  When I select "Più recenti" from "ordine"
  And I press "Ordina"
  Then I should see "Casa bella" first
