Feature: Questions
  As a registered user
  So that I can be sure about something
  I want to make a question on a place’s page

Scenario: Make a question
  Given I am a registered user
  And there's another user
  When he logs in
  And he creates an insertion "Casa bella"
  When he logs out
  And I log in
  When I am on the last insertion page
  And I follow "Fai una domanda"
  And I fill in "question_body" with "Quanto è grande?"
  And I press "Invia"
  Then I should see "Dhug95"
  And I should see "Quanto è grande?"
