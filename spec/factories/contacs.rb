require 'faker'
FactoryGirl.define do
  factory :contact do |f|
    f.firstname "John"
    f.lastname "Doe"
  end
end
