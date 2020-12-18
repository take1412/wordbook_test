class Authority < ApplicationRecord
  belongs_to :wordlist

  validates :authority_user_code, presence: true
  validates :wordlist_id, uniqueness: { scope: :authority_user_code }
end
