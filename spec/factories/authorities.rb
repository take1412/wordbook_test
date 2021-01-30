FactoryBot.define do
  factory :authority do
    authority_user_code             { '12345678' }
    association :wordlist
  end
end
