class Authority < ApplicationRecord
  belongs_to :wordlist

  validates :authority_user_code, presence: true, length: { maximum: 8 }
  validates :authority_user_code, uniqueness: { scope: :wordlist_id }
end
