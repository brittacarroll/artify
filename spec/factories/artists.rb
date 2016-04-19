FactoryGirl.define do
  factory :artist do
    first_name "Lisa"
    last_name "Carroll"
    role "painter"
    sequence(:email) { |n| "lisac#{n}@gmail.com" }
    password "password"
  end
end
