class Wordlist < ApplicationRecord

  belongs_to :user

  with_options presence: true do
    validates :listname
    validates :text
  end
end
