Feature: DesideredBook
	I want to create a DesideredBook
    As user

	Scenario: Create DesideredBook
		Given a valid user with email "admin@admin.it" username "admin" and password "adminadmin"
    	When I go to the login page
    	And I sign in with email "admin@admin.it" and password "adminadmin"
    	Then I should see "Welcome to BookKing !"
    	Given a DesideredBook exists called "Libro" with isbn "1234567890" from user with 1 as id
    	When I visit my desidered book list
    	Then I should see a DesideredBook called "Libro"

	Scenario: Create DesideredBook
		Given a valid user with email "admin@admin.it" username "admin" and password "adminadmin"
    	When I go to the login page
    	And I sign in with email "admin@admin.it" and password "adminadmin"
    	Then I should see "Welcome to BookKing !"
    	Given a DesideredBook exists called "Libro" with isbn "1234567890" from user with 1 as id
    	When I visit my desidered book list
    	Then I should see a ProposeBook called "1234567890"

    Scenario: Create DesideredBook
        Given a valid user with email "admin@admin.it" username "admin" and password "adminadmin"
        When I go to the login page
        And I sign in with email "admin@admin.it" and password "adminadmin"
        Then I should see "Welcome to BookKing !"
        Given a DesideredBook exists called "Libro" with isbn "1234567890" from user with 1 as id
        When I visit my desidered book list
        Then I shouldn't see a ProposeBook called "1234567891"