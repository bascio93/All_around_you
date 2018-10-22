Feature: Correlated
  As a visitor
  So that I can rapidly find similar properties
  I want to look for properties which are correlated with the current one

Scenario: See the properties
  Given I am a registered user
  When I log in
  And I create an insertion "Casa bella"
  And I create an insertion "Caseificio di bufala"
  When I am on the last insertion page
  Then I should see "Proprietà Correlate:"
  And I should see "Casa bella"
