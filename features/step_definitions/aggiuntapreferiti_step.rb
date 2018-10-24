include Registrazione
Given ('i am on a service with id {int} with the purpose of adding it to favorites') do |int|
    user1=User.create(name: "Matteo", email: "matteo10@omega.it", password: "avalidpassword1234*")
    user2=User.create(name: "PGreco", email: "PGrecoa10@omega.it", password: "avalidpassword1234*")
    user1.update_attributes(:activated => true)
    user2.update_attributes(:activated => true)
    loggati(user1.email, "avalidpassword1234*")
    s2=Servizi.new(nome: "ciaoa", tipo: "bar", indirizzo: "Corso Garibaldi Ariccia", descrizione: "provaa")
    s2.user=user2
    s2.id=int
    s2.save
    visit servizi_path(s2)
    expect(page).to have_current_path(servizi_path(s2))
end
When("i click into aggiunti ai preferiti") do
    click_link('Aggiungi ai preferiti')
end
Then ('i should see the service with id {int} into the service list') do |arg1|
    s=Servizi.find(arg1)
    expect(page).to have_content(s.nome)
end
