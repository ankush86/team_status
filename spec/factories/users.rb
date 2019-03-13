FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    skills { "[js, paython]" }
    email {Faker::Internet.email}
    contact { Faker::PhoneNumber.cell_phone }
  end
end
