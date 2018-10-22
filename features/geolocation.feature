Feature: Geolocation
  As a user
  So that I can Google Maps APIs
  I want to set the GPS position of my property

Scenario: Set GPS position of a property
  Given I am a registered user
  When I log in
  And I create an insertion "Casa grande"
  Then my property has GPS coordinates
