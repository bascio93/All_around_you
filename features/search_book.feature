Feature: Search book
	I want to search for a book
	As guest

	Scenario: Search book 1
		Given a valid user with email "admin1@admin.it" username "admin1" and password "adminadmin"
		Given a valid user with email "admin2@admin.it" username "admin2" and password "adminadmin"
		Given a ProposedBook exists called "Libro1" with isbn "1234567891" from user with 1 as id
		Given a ProposedBook exists called "Libro2" with isbn "1234567892" from user with 2 as id
		Given a ProposedBook exists called "Libro3" with isbn "1234567893" from user with 1 as id
		When I visit homepage
		Then I should see "Welcome to BookKing !"
		When I search for book "Libro"
		Then I should see "Libro1" "Libro2" "Libro3"

	Scenario: Search book 2
		Given a valid user with email "admin1@admin.it" username "admin1" and password "adminadmin"
		Given a valid user with email "admin2@admin.it" username "admin2" and password "adminadmin"
		Given a ProposedBook exists called "Libro1" with isbn "1234567891" from user with 1 as id
		Given a ProposedBook exists called "Libro2" with isbn "1234567892" from user with 2 as id
		Given a ProposedBook exists called "Libro3" with isbn "1234567893" from user with 1 as id
		When I visit homepage
		Then I should see "Welcome to BookKing !"
		When I search for book "Libro1"
		Then I shouldn't see "Libro2" "Libro3"
		Then I should see "Libro1"


	Scenario: Search book 3
		Given a valid user with email "admin1@admin.it" username "admin1" and password "adminadmin"
		Given a valid user with email "admin2@admin.it" username "admin2" and password "adminadmin"
		Given a ProposedBook exists called "Libro1" with isbn "1234567891" from user with 1 as id
		Given a ProposedBook exists called "Libro2" with isbn "1234567892" from user with 2 as id
		Given a ProposedBook exists called "Libro3" with isbn "1234567893" from user with 1 as id
		When I visit homepage
		Then I should see "Welcome to BookKing !"
		When I search for book "Libro4"
		Then I shouldn't see "Libro1" "Libro2" "Libro3"