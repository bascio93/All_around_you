include Registrazione
Given ('i am on a service page to add a review') do
    user1=User.create(name: "Matteo", email: "matteo10@omega.it", password: "avalidpassword1234*")
    user2=User.create(name: "PGreco", email: "PGrecoa10@omega.it", password: "avalidpassword1234*")
    user1.update_attributes(:activated => true)
    user2.update_attributes(:activated => true)
    loggati(user1.email, "avalidpassword1234*")
    s2=Servizi.new(nome: "ciaoa", tipo: "bar", indirizzo: "Corso Garibaldi Ariccia", descrizione: "provaa")
    s2.user=user2
    s2.save
    visit servizi_path(s2)
end
When ("i add a review with titolo {string} voto {int} contenuto {string}") do |string1, arg, string3|
    fill_in('titolo', with: string1)
    fill_in('votoserv', with: arg)
    fill_in('recensionecontent', with: string3)
end
When("i click on post button of the review") do
    click_button('Invia Recensione')
end
Then ('i should view in the service page titolo {string} voto {int} contenuto {string}') do |string1,arg2,string2|
    expect(page).to have_content(string1)
    expect(page).to have_content(arg2)
    expect(page).to have_content(string2)
end
