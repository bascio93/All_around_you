Feature: Property images
  As a lessor
  So that I can give more info about a property
  I want to add some images to its insertion

Scenario: Add the images
  Given I am a registered user
  And I log in
  When I follow "Mie inserzioni"
  And I follow "+ Crea inserzione +"
  And I fill in "Titolo" with "Casa grande"
  And I fill in "Descrizione" with "Molto grande"
  And I fill in "Prezzo" with "150"
  And I fill in "address_city" with "Rome, Italy"
  And I press "Crea Inserzione"
  Then I should see "Casa grande"
  And I should see "Molto grande"
  And I should see "150"
  And I should see "Rome, Italy"
  When I follow "Modifica"
  And I attach the file "/Users/Francesco/Pictures/Napoli/2017-07-30 00.32.27.jpg" to "property_img1"
  When I press "Modifica"
  Then I should see the property image
