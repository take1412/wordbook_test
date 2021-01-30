class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :wordlists, dependent: :destroy
  has_many :words
  has_many :favorite, dependent: :destroy

  with_options presence: true do
    validates :nickname, length: { maximum: 10 }
    validates :user_code, uniqueness: true, length: { maximum: 8 }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は半角英数字どちらも1文字以上入れてください' }
  end

  def self.user_search(search)
    if search != ''
      User.where('nickname LIKE ?', "#{search}%")
    else
      User.all
    end
  end
end
