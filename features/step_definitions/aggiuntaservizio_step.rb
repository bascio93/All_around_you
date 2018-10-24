include Registrazione
Given ('i am on the logged home page') do
    registrati("Matteo", "matteo5@omega.it", "avalidpasword1234*")
    click_link('Home Utente')
end
When ("i add a new service with name {string} indirizzo {string} tipo {string} descrizione {string}") do |string1, string2, string3, string4|
    fill_in('nome', with: string1)
    fill_in('indirizzi1', with: string2)
    fill_in('tipo', with: string3)
    fill_in('descrizione', with: string4)
end
When("i click on crea button") do
    click_button('Crea')
end
Then ('i should be redirected to my new service and i should see name {string} indirizzo {string} tipo {string} descrizione {string} in the page') do |string, string2,string3,string4|
    expect(page).to have_content(string)
    expect(page).to have_content(string2)
    expect(page).to have_content(string3)
    expect(page).to have_content(string4)
end
