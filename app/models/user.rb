class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password,length: { minimum: 6 }, format: {
    with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  }
  validates :nick_name, presence: true
  validates :family_name, presence: true, format: {
    with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/
    }
  validates :first_name, presence: true, format: {
    with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/
    }
  validates :family_name_kana, presence: true, format: {
    with: /\A[ァ-ヶー－]+\z/
   }
  validates :first_name_kana, presence: true, format: {
    with: /\A[ァ-ヶー－]+\z/
   }
  validates :birthday, presence: true
  
  has_many :orders
  has_many :items
  

end
