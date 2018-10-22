Feature: Offer
  As a visitor
  So that I can save my money
  I want to know which properties are in offering

Scenario: Show properties in offering
  Given I am a registered user
  When I log in
  And I create an insertion "Casa costosa"
  Given I am on the last insertion page
  When I follow "Modifica"
  And I fill in "property_offer" with "18"
  And I press "Modifica"
  When I am on the home page
  Then I should see "Proprietà in offerta:"
  And I should see "Casa costosa"
  And I should see "18"
