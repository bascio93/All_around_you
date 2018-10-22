Feature: Suggest
	I want to see some suggest
	As user

	Scenario: Suggest 1
		Given a valid user with email "admin1@admin.it" username "admin1" and password "adminadmin"
		Given a valid user with email "admin2@admin.it" username "admin2" and password "adminadmin"
		Given a ProposedBook exists called "Libro1" with isbn "1234567891" from user with 1 as id
		Given a ProposedBook exists called "Libro2" with isbn "1234567892" from user with 1 as id
		Given a DesideredBook exists called "Libro1" with isbn "1234567891" from user with 2 as id
    	When I go to the login page
    	And I sign in with email "admin2@admin.it" and password "adminadmin"
    	Then I should see "Welcome to BookKing !"
		Then I should see "Libro1"
		Then I shouldn't see "Libro2"


	Scenario: Suggest 2
		Given a valid user with email "admin1@admin.it" username "admin1" and password "adminadmin"
		Given a valid user with email "admin2@admin.it" username "admin2" and password "adminadmin"
		Given a ProposedBook exists called "Libro1" with isbn "1234567891" from user with 1 as id
		Given a ProposedBook exists called "Libro2" with isbn "1234567892" from user with 1 as id
		Given a DesideredBook exists called "Libro1" with isbn "1234567891" from user with 2 as id
		Given a DesideredBook exists called "Libro2" with isbn "1234567892" from user with 2 as id
    	When I go to the login page
    	And I sign in with email "admin2@admin.it" and password "adminadmin"
    	Then I should see "Welcome to BookKing !"
		Then I should see "Libro1" "Libro2"

	Scenario: Suggest 3
		Given a valid user with email "admin1@admin.it" username "admin1" and password "adminadmin"
		Given a valid user with email "admin2@admin.it" username "admin2" and password "adminadmin"
		Given a ProposedBook exists called "Libro1" with isbn "1234567891" from user with 1 as id
		Given a ProposedBook exists called "Libro2" with isbn "1234567892" from user with 1 as id
		Given a DesideredBook exists called "Libro3" with isbn "1234567891" from user with 2 as id
		Given a DesideredBook exists called "Libro4" with isbn "1234567892" from user with 2 as id
    	When I go to the login page
    	And I sign in with email "admin2@admin.it" and password "adminadmin"
    	Then I should see "Welcome to BookKing !"
		Then I shouldn't see "Libro1" "Libro2"
		Then I shouldn't see "Libro3" "Libro4"

	Scenario: Suggest 4
		Given a valid user with email "admin1@admin.it" username "admin1" and password "adminadmin"
		Given a valid user with email "admin2@admin.it" username "admin2" and password "adminadmin"
		Given a valid user with email "admin3@admin.it" username "admin3" and password "adminadmin"
		Given a ProposedBook exists called "Libro1" with isbn "1234567891" from user with 1 as id
		Given a ProposedBook exists called "Libro2" with isbn "1234567892" from user with 2 as id
		Given a DesideredBook exists called "Libro1" with isbn "1234567891" from user with 3 as id
		Given a DesideredBook exists called "Libro2" with isbn "1234567892" from user with 3 as id
    	When I go to the login page
    	And I sign in with email "admin3@admin.it" and password "adminadmin"
    	Then I should see "Welcome to BookKing !"
		Then I should see "Libro1" "Libro2"

