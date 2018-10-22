Feature: Edit account
  As a registered user
  So that I can change the info about me
  I want to edit my account

Scenario: Edit account
  Given I am a registered user
  And I log in
  When I follow "Profilo"
  And I follow "Modifica info"
  And I fill in "Username" with "CarmineMariaMansueto95.dragonball"
  And I fill in "user[current_password]" with "123456"
  And I press "Aggiorna"
  Then I am on the home page
  When I follow "Profilo"
  Then I should see "CarmineMariaMansueto95.dragonball"
