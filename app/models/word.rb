class Word < ApplicationRecord

  belongs_to :user
  belongs_to :wordlist

  with_options presence: true do
    validates :wordname
    validates :mean
  end
end
