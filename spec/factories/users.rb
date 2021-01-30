FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    user_code             { '12345678' }
    email                 { Faker::Internet.free_email }
    password              { '111xxx' }
    password_confirmation { password }
  end
end
