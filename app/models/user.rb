class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :last_name_japanese, format: { with: LAST_NAME_JAPANESE_REGEX = /\A(?=.*?[ぁ-んァ-ヶ一-龥々])[ぁ-んァ-ヶ一-龥々]+\z/i.freeze, message: 'Full-width characters' } do
    end 
    validates :first_name_japanese, format: { with: FIRST_NAME_JAPANESE_REGEX = /\A(?=.*?[ぁ-んァ-ヶ一-龥々])[ぁ-んァ-ヶ一-龥々]+\z/i.freeze, message: 'Full-width characters' } do
    end
    validates :last_name_katakana, format: { with: LAST_NAME_KATAKANA_REGEX = /\A(?=.*?[ァ-ヴ])[ァ-ヴ]+\z/i.freeze, message: 'Full-width katakana characters'  } do
    end
    validates :first_name_katakana, format: { with: FIRST_NAME_KATAKANA_REGEX = /\A(?=.*?[ァ-ヴ])[ァ-ヴ]+\z/i.freeze, message: 'Full-width katakana characters'  } do
    end
    validates :birthday
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 

end
