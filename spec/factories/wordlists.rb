FactoryBot.define do
  factory :wordlist do
    listname              { 'aaa' }
    text                  { 'bbb' }
    release_id            { 1 }
    association :user
  end
end
