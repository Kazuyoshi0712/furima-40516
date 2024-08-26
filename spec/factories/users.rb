FactoryBot.define do
  factory :user do
    name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) + '1a' }
    password_confirmation { password }
  end
end
