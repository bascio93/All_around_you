Feature: Proposal
	I want to make a proposal
    As user
    
	Scenario: make proposal1 
		Given a valid user with email "user1@user.it" username "user1" and password "useruser"
        Given a valid user with email "user2@user.it" username "user2" and password "useruser"
    	Given a ProposedBook exists called "Libro1" with isbn "1234567890" from user with 1 as id
        Given a ProposedBook exists called "Libro2" with isbn "1234567891" from user with 2 as id
        Given a Proposal mid 1 did 2 lm 1 ld 2
        When I go to the login page
    	When I sign in with email "user2@user.it" and password "useruser"
    	Then I should see "Welcome to BookKing !"
    	When I visit my proposal
    	Then I should see a proposalcalled "Libro1"


    Scenario: make proposal2 
        Given a valid user with email "user1@user.it" username "user1" and password "useruser"
        Given a valid user with email "user2@user.it" username "user2" and password "useruser"
        Given a ProposedBook exists called "Libro1" with isbn "1234567890" from user with 1 as id
        Given a ProposedBook exists called "Libro2" with isbn "1234567891" from user with 2 as id
        Given a Proposal mid 2 did 1 lm 1 ld 2
        When I go to the login page
        When I sign in with email "user1@user.it" and password "useruser"
        Then I should see "Welcome to BookKing !"
        When I visit my proposal
        Then I should see a proposalcalled "Libro1"

    Scenario: make proposal3
        Given a valid user with email "user1@user.it" username "user1" and password "useruser"
        Given a valid user with email "user2@user.it" username "user2" and password "useruser"
        Given a ProposedBook exists called "Libro1" with isbn "1234567890" from user with 1 as id
        Given a ProposedBook exists called "Libro2" with isbn "1234567891" from user with 2 as id
        Given a ProposedBook exists called "Libro1" with isbn "1234567892" from user with 1 as id
        Given a Proposal mid 2 did 1 lm 1 ld 2
        When I go to the login page
        When I sign in with email "user1@user.it" and password "useruser"
        Then I should see "Welcome to BookKing !"
        When I visit my proposal
        Then I shouldn't see a proposalcalled "Libro3"