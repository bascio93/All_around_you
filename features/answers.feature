Feature: Answer questions
  As a registered user
  So that I can give more info about a place
  I want to reply to users questions

Scenario: Give an answer
  Given I am a registered user
  And there's another user
  And he logs in
  And he creates an insertion "Casa bella"
  And he logs out
  When I log in
  And I am on the last insertion page
  And I follow "Fai una domanda"
  And I fill in "question[body]" with "Quanto è grande?"
  And I press "Invia"
  Then I should see "Dhug95"
  And I should see "Quanto è grande?"
  When I follow "Vedi risposte"
  Then I should see "Aggiungi una risposta"
  When I fill in "answer[body]" with "Più grande"
  And I press "Invia"
  Then I should see "Risposte"
  And I should see "Più grande"
