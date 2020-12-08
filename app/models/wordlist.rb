class Wordlist < ApplicationRecord

  belongs_to :user
  has_manny :words

  with_options presence: true do
    validates :listname
    validates :text
  end
end
