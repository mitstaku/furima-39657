require 'rails_helper'

RSpec.describe OrderDeliveryAddress, type: :model do
  before do
    @order_delivery_address = FactoryBot.build(:order_delivery_address)
  end

  # 成功パターン
  describe 'ユーザー新規登録' do
    context '新規登録成功' do
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@order_delivery_address).to be_valid
      end
      it '建物名:任意' do
        @order_delivery_address.building_name = ''
        expect(@order_delivery_address).to be_valid
      end
    end

    # 失敗パターン
    context '新規登録失敗' do
      # 郵便番号
      it 'zip_code:空欄' do
        @order_delivery_address.zip_code = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include "Zip code can't be blank",
                                                                        'Zip code is invalid. Include hyphen(-)'
      end

      it 'zip_code:ハイフンなし' do
        @order_delivery_address.zip_code = '1111111'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include 'Zip code is invalid. Include hyphen(-)'
      end

      it 'zip_code:半角数字以外' do
        @order_delivery_address.zip_code = '１１１-１１１'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include 'Zip code is invalid. Include hyphen(-)'
      end

      # 都道府県
      it 'prefecture_id:--' do
        @order_delivery_address.prefecture_id = '0'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include "Prefecture can't be blank"
      end

      # 市区町村
      it 'city:空欄' do
        @order_delivery_address.city = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include "City can't be blank"
      end

      # 市区町村
      it 'street_address:空欄' do
        @order_delivery_address.street_address = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include "Street address can't be blank"
      end

      # 電話番号
      it 'telephone_number:空欄' do
        @order_delivery_address.telephone_number = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include "Telephone number can't be blank",
                                                                        'Telephone number is invalid'
      end

      it 'telephone_number:半角数字以外' do
        @order_delivery_address.telephone_number = '０９０１２３４５６７８'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include 'Telephone number is invalid'
      end

      it 'token:空' do
        @order_delivery_address.token = nil
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
