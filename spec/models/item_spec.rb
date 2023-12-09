require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  # 新規商品出品画面

  # 成功パターン
  describe '商品出品' do
    context '出品成功' do
      it '全て正常値' do
        expect(@item).to be_valid
      end

      it 'name:40字' do
        @item.name = '1234567890123456789012345678901234567890'
        @item.valid?
        expect(@item).to be_valid
      end

      it 'price:300' do
        @item.price = '300'
        expect(@item).to be_valid
      end

      it 'price:9999999' do
        @item.price = '9999999'
        expect(@item).to be_valid
      end
    end

    # 失敗パターン
    context '出品失敗' do
      # 商品画像
      it 'image:空欄' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      # 商品名
      it 'name:空欄' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end

      it 'name:41字' do
        @item.name = '12345678901234567890123456789012345678901'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Name is too long (maximum is 40 characters)'
      end

      # 商品の説明
      it 'description:空欄' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end

      # カテゴリー
      it 'category_id:0' do
        @item.category_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category must be other than 0'
      end

      # 商品の状態
      it 'status_id:0' do
        @item.status_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Status must be other than 0'
      end

      # 配送料の負担
      it 'delivery_charge_id:0' do
        @item.delivery_charge_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Delivery charge must be other than 0'
      end

      # 発送元の地域
      it 'prefecture_id:0' do
        @item.prefecture_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Prefecture must be other than 0'
      end

      # 発送までの日数
      it 'delivery_day_id:0' do
        @item.delivery_day_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Delivery day must be other than 0'
      end

      # 価格
      it 'price:空欄' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank", 'Price is not a number'
      end

      it 'price:0' do
        @item.price = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end

      it 'price:300未満' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end

      it 'price:10万以上' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
      end

      it 'price:小数' do
        @item.price = '1000.5'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be an integer'
      end

      it 'price:数字以外' do
        @item.price = 'あああ'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end

      it 'price:全角数字' do
        @item.price = '１２３４'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end

      # ユーザー
      it 'user:紐づいていない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
    end
  end
end
