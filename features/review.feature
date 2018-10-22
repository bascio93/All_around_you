Feature: Review
	I want to review another user
	As a user

	Scenario: make review 1
		Given a valid user with email "user1@user.it" username "user1" and password "useruser"
        Given a valid user with email "user2@user.it" username "user2" and password "useruser"
        Given a valid review with rating 5 and comment "Commento" to user with id 2
        When I go to the login page
    	When I sign in with email "user1@user.it" and password "useruser"
    	Then I should see "Welcome to BookKing !"
    	When I visit 2 profile
    	Then I should see a review with 5 and "Commento"

	Scenario: make review 2
		Given a valid user with email "user1@user.it" username "user1" and password "useruser"
        Given a valid user with email "user2@user.it" username "user2" and password "useruser"
        Given a valid review with rating 5 and comment "Commento" to user with id 1
        When I go to the login page
    	When I sign in with email "user1@user.it" and password "useruser"
    	Then I should see "Welcome to BookKing !"
    	When I visit 1 profile
    	Then I should see a review with 5 and "Commento"

    Scenario: make review 3
        Given a valid user with email "user1@user.it" username "user1" and password "useruser"
        Given a valid user with email "user2@user.it" username "user2" and password "useruser"
        Given a valid review with rating 5 and comment "Commento" to user with id 1
        When I go to the login page
        When I sign in with email "user1@user.it" and password "useruser"
        Then I should see "Welcome to BookKing !"
        When I visit 1 profile
        Then I shouldn't see a review with 5 and "Commenti"
