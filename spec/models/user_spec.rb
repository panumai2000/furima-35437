require 'rails_helper'

RSpec.describe User, type: :model do
  before do
      @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation,last_name_japaneseとfirst_name_japanese,last_name_katakanaとfirst_name_katakana,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = '00000a'
        @user.password_confirmation = '00000a'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_name_japaneseが空では登録できない' do
        @user.last_name_japanese = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name japanese can't be blank")
      end
      it 'first_name_japaneseが空では登録できない' do
        @user.first_name_japanese = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name japanese can't be blank")
      end
      it 'last_name_katakanaが空では登録できない' do
        @user.last_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana can't be blank")
      end
      it 'first_name_katakanaが空では登録できない' do
        @user.first_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana can't be blank")
      end
      it 'birthdayがからでは登録できない' do 
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'password:半角英数混合(半角英語のみ)' do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password には英字と数字の両方を含めて設定してください")
      end  
      it 'password:半角英数混合(半角数字のみ)' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password には英字と数字の両方を含めて設定してください")
      end  
      it 'passwordが半角でなければ登録できない' do
        @user.password = 'ａ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it 'last_name_japaneseは日本語以外だと登録できない' do
        @user.last_name_japanese = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name japanese Full-width characters")
      end
      it 'first_name_japaneseは日本語以外だと登録できない' do
        @user.first_name_japanese = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name japanese Full-width characters")
      end
      it 'last_name_katakanaはひらがな以外だと登録できない' do
        @user.last_name_katakana = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana Full-width katakana characters")
      end 
      it 'first_name_katakanaはひらがな以外だと登録できない' do
        @user.first_name_katakana = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana Full-width katakana characters") 
      end   
      it 'emailに@を含めないと登録できない' do
        @user.email = 'aabb'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid") 
      end
      it 'last_name_japaneseが半角では登録できない' do
        @user.last_name_japanese = 'ｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name japanese Full-width characters')
      end
      it 'first_name_japaneseが半角では登録できない' do
        @user.first_name_japanese = 'ｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name japanese Full-width characters')
      end
      it 'last_name_katakanaが半角では登録できない' do
        @user.last_name_katakana = 'ｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name katakana Full-width katakana characters')
      end
      it 'first_name_katakanaが半角では登録できない' do
        @user.first_name_katakana = 'ｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name katakana Full-width katakana characters')
      end
    end
  end
end
 