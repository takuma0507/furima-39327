class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :surname, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :surname_katakana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :giben_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :giben_name_katakana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :dete_of_bith, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は半角英数字混合でなければ登録できない'

  has_many :items
  has_many :order
end
