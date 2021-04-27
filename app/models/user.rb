class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  validates :last_name_japanese, presence: true
  validates :first_name_japanese, presence: true
  validates :last_name_katakana, presence: true
  validates :first_name_katakana, presence: true
  validates :birthday, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 

  LAST_NAME_JAPANESE_REGEX = /\A(?=.*?[ぁ-んァ-ヶ一-龥々])[ぁ-んァ-ヶ一-龥々]+\z/i.freeze
  validates_format_of :last_name_japanese, with: LAST_NAME_JAPANESE_REGEX, message: 'Full-width characters' 
  
  FIRST_NAME_JAPANESE_REGEX = /\A(?=.*?[ぁ-んァ-ヶ一-龥々])[ぁ-んァ-ヶ一-龥々]+\z/i.freeze
  validates_format_of :first_name_japanese, with: FIRST_NAME_JAPANESE_REGEX, message: 'Full-width characters' 

  LAST_NAME_KATAKANA_REGEX = /\A(?=.*?[ァ-ヴ])[ァ-ヴ]+\z/i.freeze
  validates_format_of :last_name_katakana, with: LAST_NAME_KATAKANA_REGEX, message: 'Full-width katakana characters' 

  FIRST_NAME_KATAKANA_REGEX = /\A(?=.*?[ァ-ヴ])[ァ-ヴ]+\z/i.freeze
  validates_format_of :first_name_katakana, with: FIRST_NAME_KATAKANA_REGEX, message: 'Full-width katakana characters' 
end
#111111a