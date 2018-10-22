Feature: User can create a new account
  As a visitor
  So that the system remembers me
  I want to create a new account

Scenario: Create a new account
  Given I am on the sign up page
  When I fill in "Email" with "dabbraccio.francesco@gmail.com"
  And I fill in "Username" with "Dhug95"
  And I fill in "Password" with "123456"
  And I fill in "user[password_confirmation]" with "123456"
  And I press "Crea account"
  Then I should be on the home page
  And I should see "Profilo"
  When I follow "Profilo"
  Then I should see "Dhug95"
  And I should see "dabbraccio.francesco@gmail.com"

Scenario: Can't create an account (username required)
  Given I am on the sign up page
  When I fill in "Username" with "Dhug95"
  And I fill in "Password" with "123456"
  And I fill in "user[password_confirmation]" with "123456"
  And I press "Crea account"
  Then I should see "Email can't be blank"
