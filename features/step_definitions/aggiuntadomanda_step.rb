include Registrazione
Given ('i am on a service page') do
    user1=User.create(name: "Matteo", email: "matteo10@omega.it", password: "avalidpassword1234*")
    user2=User.create(name: "PGreco", email: "PGrecoa10@omega.it", password: "avalidpassword1234*")
    user1.update_attributes(:activated => true)
    user2.update_attributes(:activated => true)
    loggati(user1.email, "avalidpassword1234*")
    s2=Servizi.new(nome: "ciaoa", tipo: "bar", indirizzo: "Corso Garibaldi Ariccia", descrizione: "provaa")
    user=User.create(:name => "abc", :email => "ciao@omega.it", :password => "avalidpassword1234*")
    s2.user=user2
    s2.save
    visit servizi_path(s2)
    expect(page).to have_current_path(servizi_path(s2))
end
When ("i add a question asking {string}") do |string1|
    fill_in('domandacontent', with: string1)
end
When("i click on post button of the question") do
    click_button('Invia Domanda')
end
Then ('i should view into the service page my question {string}') do |arg1|
    expect(page).to have_content(arg1)
end
