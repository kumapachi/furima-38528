require 'rails_helper'

RSpec.describe OrderBuyer, type: :model do
  describe '寄付情報の保存' do
    before do
      user = FactoryBot.create(:user)
      @order_buyer = FactoryBot.build(:order_buyer, user_id: user.id)
    end

    context '購入者情報が登録できるとき' do
      it 'すべての値が正しく入力されていれば登録できること' do
        expect(@order_buyer).to be_valid
      end
      it '建物名が空でも登録できる' do
        @order_buyer.building = nil
        expect(@order_buyer).to be_valid
      end
    end

    context '購入者情報が登録できないとき' do
      it 'user_idが空だと保存できない' do
        @order_buyer.user_id = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと登録できない' do
        @order_buyer.item_id = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Item can't be blank")
      end
      it 'postal_codeが空だと保存できないこと' do
        @order_buyer.postal_code = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_buyer.postal_code = '1234567'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'prefectureが空だと保存できないこと' do
        @order_buyer.prefecture_id = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが「---」だと保存できないこと' do
        @order_buyer.prefecture_id = 1
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order_buyer.city = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("City can't be blank")
      end
      it 'addressesが空だと保存できないこと' do
        @order_buyer.addresses = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Addresses can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_buyer.phone_number = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が12桁以上だと登録できない' do
        @order_buyer.phone_number = '123456789012'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が9桁以下だと登録できない' do
        @order_buyer.phone_number = '123456789'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Phone number is too short")
      end
      it '電話番号に半角数字以外が含まれると登録できない' do
        @order_buyer.phone_number = '090-1234-5678'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Phone number is invalid")
      end
      it 'トークンが空だと登録できない' do
        @order_buyer.token = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Token can't be blank")
      end
      # bundle exec rspec spec/models/order_buyer_spec.rb 
    end
  end
end
