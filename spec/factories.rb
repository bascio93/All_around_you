FactoryGirl.define do
  factory :user do
    id                    "1"
    name                  "Giggi"
    email                 "Gigg10@live.it"
    password              "avalidpassword1234*"
    admin                 "true"
  end

  factory :servizi do
    id                    "1"
    nome             "bar bello"
    tipo                 "bar"
    descrizione "bar aperitivi serali"
    user_id "1"
    indirizzo "Via Tuscolana"
  end
end
