Given ("i am on my favorite services list and i want to delete a service with id {int} from favorites") do |int|
    user1=User.create(name: "Matteo", email: "matteo10@omega.it", password: "avalidpassword1234*")
    user2=User.create(name: "PGreco", email: "PGrecoa10@omega.it", password: "avalidpassword1234*")
    user1.update_attributes(:activated => true)
    user2.update_attributes(:activated => true)
    loggati(user1.email, "avalidpassword1234*")
    s2=Servizi.new(nome: "ciaoa", tipo: "bar", indirizzo: "Corso Garibaldi Ariccia", descrizione: "provaa")
    s2.user=user1
    s2.id=int
    s2.save
    f=Favorite.new
    f.user=user1
    f.servizi=s2
    visit root_url
    click_link("Mostra preferiti")
end
When("i click cancella") do 
    expect(page).to have_current_path(preferiti_path)
    click_link('Cancella')
    visit root_path
end
Then('i shouldnt see the service with id {int} into the favorite list') do |int|
    click_link("Mostra preferiti")
    s=Servizi.find(int)
    expect(page).to not_have_content(s.nome)
end
