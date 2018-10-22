Feature: Unfollow
  As a registered user
  So that I can no longer have updates from a person
  I want to delete him from my following list

Scenario: Unfollow an user
  Given I am a registered user
  And there's another user
  And he logs in
  When he creates an insertion "Casa enorme"
  And he creates an insertion "Casa bella"
  And he logs out
  When I log in
  And I fill in "Inserisci la località" with "Rome, Italy"
  Then I should see "Casa enorme"
  When I follow "Vedi"
  And I follow "Follow utente"
  When I follow "Following"
  Then I should see "Casa bella"
  When I follow "Vedi"
  And I follow "Unfollow utente"
  And I follow "Following"
  Then I should not see "Casa enorme"
