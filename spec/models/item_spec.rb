require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
     @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できるとき' do
      it 'image,item_name,description,category_id,status_id,delivery_burden_id,delivery_prefectures_id,delivery_days_id,priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it 'item_nameが空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'descriptionが空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'category_idが空では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'status_idが空では出品できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'delivery_burden_idが空では出品できない' do
        @item.delivery_burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery burden can't be blank")
      end
      it 'delivery_prefectures_idが空では出品できない' do
        @item.delivery_prefectures_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery prefectures can't be blank")
      end
      it 'delivery_days_idが空ではできない' do
        @item.delivery_days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery days can't be blank")
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'userが紐付いていないと出品できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it 'priceは半角数字でなければ出品できないこと' do
        @item.price = '１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceは、300以上でなければ出品できないこと' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceは、9,999,999以下でなければ出品できないこと' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'category_idのidの1を選択すると出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'status_idのidの1を選択すると出品できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it 'delivery_burden_idのidの1を選択すると出品できない' do
        @item.delivery_burden_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery burden must be other than 1")
      end
      it 'delivery_prefectures_idのidの1を選択すると出品できない' do
        @item.delivery_prefectures_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery prefectures must be other than 1")
      end
      it 'delivery_days_idのidの1を選択すると出品できない' do
        @item.delivery_days_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery days must be other than 1")
      end
    end
  end
end
