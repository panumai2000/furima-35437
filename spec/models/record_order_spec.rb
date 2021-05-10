require 'rails_helper'

RSpec.describe RecordOrder, type: :model do
  before do
    @record_order = FactoryBot.build(:record_order)
  end

  describe '商品購入機能' do
    context '商品購入できるとき' do
      it 'postal_code,delivery_prefectures_id,ctiy,address,phone_number,tokenが存在すれば登録できる' do
        expect(@record_order).to be_valid
      end
    end
    context '商品購入できないとき' do
      it 'postal_codeが空では購入できない' do
        @record_order.postal_code = ''
        @record_order.valid?
        expect(@record_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'delivery_prefectures_idが空では購入できない' do
        @record_order.delivery_prefectures_id = ''
        @record_order.valid?
        expect(@record_order.errors.full_messages).to include("Delivery prefectures can't be blank")
      end
      it 'cityが空では購入できない' do
        @record_order.city = ''
        @record_order.valid?
        expect(@record_order.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では購入できない' do
        @record_order.address = ''
        @record_order.valid?
        expect(@record_order.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @record_order.phone_number = ''
        @record_order.valid?
        expect(@record_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが11桁以内でないと購入できない' do
        @record_order.phone_number = '090111111111'
        @record_order.valid?
        expect(@record_order.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberは整数でないと購入できない' do
        @record_order.phone_number = 'aaaaaaaaaaa'
        @record_order.valid?
        expect(@record_order.errors.full_messages).to include("Phone number is invalid")
      end
      it 'postal_codeは-を入力しないと購入できない' do
        @record_order.postal_code = '1111111'
        @record_order.valid?
        expect(@record_order.errors.full_messages).to include("Postal code is invalid")
      end
      it 'postal_codeは整数をでないと購入できない' do
        @record_order.postal_code = 'aaa-aaaa'
        @record_order.valid?
        expect(@record_order.errors.full_messages).to include("Postal code is invalid")
      end
      it "tokenが空では登録できないこと" do
        @record_order.token = nil
        @record_order.valid?
        expect(@record_order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end