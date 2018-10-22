Feature: Exchange
	I want to see my exchange
    As user
    
	Scenario: make exchange1 
		Given a valid user with email "user1@user.it" username "user1" and password "useruser"
        Given a valid user with email "user2@user.it" username "user2" and password "useruser"
        Given a valid exchange with mid 1 did 2 libromittente "libromittente" librodestinatario "librodestinatario"
        When I go to the login page
    	When I sign in with email "user2@user.it" and password "useruser"
    	Then I should see "Welcome to BookKing !"
    	When I visit my proposal
    	Then I should see a exchange involving "librodestinatario" "libromittente" and "user1"


    Scenario: make exchange2 
        Given a valid user with email "user1@user.it" username "user1" and password "useruser"
        Given a valid user with email "user2@user.it" username "user2" and password "useruser"
        Given a valid exchange with mid 1 did 2 libromittente "libromittente" librodestinatario "librodestinatario"
        When I go to the login page
        When I sign in with email "user1@user.it" and password "useruser"
        Then I should see "Welcome to BookKing !"
        When I visit my proposal
        Then I should see a exchange involving "librodestinatario" "libromittente" and "user2"

    Scenario: make exchange3
        Given a valid user with email "user1@user.it" username "user1" and password "useruser"
        Given a valid user with email "user2@user.it" username "user2" and password "useruser"
        Given a valid exchange with mid 1 did 2 libromittente "libromittente" librodestinatario "librodestinatario"
        When I go to the login page
        When I sign in with email "user1@user.it" and password "useruser"
        Then I should see "Welcome to BookKing !"
        When I visit my proposal
        Then I shouldn't see a exchange involving "user1"