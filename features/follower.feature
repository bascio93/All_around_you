Feature: Follower
  As a registered user
  So that I can quickly see posts from people I like
  I want to follow a person

Scenario: Add to following list
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
