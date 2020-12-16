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

  def self.search(search)
    if search != ''
      Wordlist.where(['listname LIKE ? OR text LIKE ?', "%#{search}%", "%#{search}%"])
    else
      Wordlist.all
    end
  end

end
