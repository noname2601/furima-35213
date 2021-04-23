class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
  validates :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_day, presence: true

  validates :family_name, :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥]+\z/}

  validates :family_name_kana, :first_name_kana, format: {with: /\p{katakana}/}

  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
validates :password, format: { with: VALID_PASSWORD_REGEX }

   
end

