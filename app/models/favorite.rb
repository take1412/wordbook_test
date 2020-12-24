class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :wordlist

  validates :user_id, uniqueness: { scope: :wordlist_id }
end
