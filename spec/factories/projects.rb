FactoryBot.define do
  factory :project do
    name { Faker::Commerce.product_name }
    technology { Project::TECH.sample }
  end
end
