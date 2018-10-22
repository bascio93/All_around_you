Feature: User can set an avatar
  As a registered user
  So that I can show an image representing me
  I want to set an avatar

Scenario: Add an avatar
  Given I am a registered user
  When I log in
  And I am on my profile page
  When I follow "Modifica info"
  And I attach the file "/Users/Francesco/Pictures/Napoli/2017-07-30 00.32.27.jpg" to "Avatar"
  And I fill in "user[current_password]" with "123456"
  And I press "Aggiorna"
  Then I should be on the home page
  And I should see "Profilo"
  When I follow "Profilo"
  Then I should see "Dhug95"
  And I should see "dabbraccio.francesco@gmail.com"
  And I should see the image
