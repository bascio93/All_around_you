Feature: PMs
  As a registered user
  So that I can communicate with another user in private
  I want to send him a PM

Scenario: Sending a message
  Given I am a registered user
  And there's another user
  When I log in
  And I am on conversations page
  And I follow "Scrivi un Nuovo Messaggio"
  And I select "MarioBiondi" from "user_id"
  And I fill in "Oggetto" with "Ciao bello"
  And I fill in "Corpo del messaggio" with "Come stai?"
  When I press "Invia messaggio"
  Then I should see "Dhug95 ha scritto:"
  And I should see "Ciao bello"
  And I should see "Come stai?"
