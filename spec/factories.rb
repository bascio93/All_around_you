FactoryGirl.define do
  factory :user do
    id                    "1"
    username              "GianniBiondi"
    email                 "mario@live.it"
    password              "password"
    password_confirmation "password"
    admin                 "true"
  end

  factory :property do
    title "Casa bella grande"
    description "È una casa molto spaziosa"
    user_id "1"
    city "Rome, Italy"
    price "125"
    categories [""]
  end
end
