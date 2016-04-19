FactoryGirl.define do
  factory :gallery do
    name "The Artiste"
    representative_name "Jenn Eng"
    sequence(:email) { |n| "jenneng#{n}@gmail.com" }
    password "password"
  end
end
