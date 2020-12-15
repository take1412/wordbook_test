class Wordlist < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :release

  belongs_to :user
  has_many :words, dependent: :destroy


  with_options presence: true do
    validates :listname
    validates :text
    validates :release_id, numericality: { other_than: 0 }
  end

end
