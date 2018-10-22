Feature: Search user
	I want to search for a user
	As guest

	Scenario: Search user 1
		Given a valid user with email "admin1@admin.it" username "admin1" and password "adminadmin"
		Given a valid user with email "admin2@admin.it" username "admin2" and password "adminadmin"
		Given a valid user with email "admin3@admin.it" username "admin3" and password "adminadmin"
		When I visit homepage
		Then I should see "Welcome to BookKing !"
		When I search for user "admin"
		Then I should see "admin1" "admin2" "admin3"

	Scenario: Search user 2
		Given a valid user with email "admin1@admin.it" username "admin1" and password "adminadmin"
		Given a valid user with email "admin2@admin.it" username "admin2" and password "adminadmin"
		Given a valid user with email "admin3@admin.it" username "admin3" and password "adminadmin"
		When I visit homepage
		Then I should see "Welcome to BookKing !"
		When I search for user "admin1"
		Then I shouldn't see "admin2" "Libro3"
		Then I should see "admin1"


	Scenario: Search user 3
		Given a valid user with email "admin1@admin.it" username "admin1" and password "adminadmin"
		Given a valid user with email "admin2@admin.it" username "admin2" and password "adminadmin"
		Given a valid user with email "admin3@admin.it" username "admin3" and password "adminadmin"
		When I visit homepage
		Then I should see "Welcome to BookKing !"
		When I search for user "ciao"
		Then I shouldn't see "admin1" "admin2" "admin3"