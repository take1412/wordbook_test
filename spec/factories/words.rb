FactoryBot.define do
  factory :word do
    wordname              { 'aaa' }
    mean                  { 'bbb' }
    association :user
    association :wordlist
  end
end
