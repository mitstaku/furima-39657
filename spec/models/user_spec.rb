require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  # 新規登録画面

  # 成功パターン
  describe 'ユーザー新規登録' do
    context '新規登録成功' do
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@user).to be_valid
      end
    end

    context '新規登録失敗' do
      # ニックネーム
      it 'nick_name:空欄' do
        @user.nick_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nick name can't be blank"
      end
      # email
      it 'email:空欄' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it 'email:登録済み' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'email:@を含まない' do
        @user.email = 'test111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end

      # パスワード
      it 'password:空欄' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank", "Password confirmation doesn't match Password",
                                                      'Password is invalid'
      end

      it 'password:６文字以下' do
        @user.password = 'a'
        @user.password_confirmation = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)', 'Password is invalid'
      end

      it 'password:不一致' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'bbb111'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'password_confirmation:空欄' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      # お名前（全角）
      it 'お名前(全角)_名字:空欄' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name can't be blank", 'Family name is invalid'
      end

      it 'お名前(全角)_名前:空欄' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank", 'First name is invalid'
      end

      # お名前カナ（全角）
      it 'お名前(全角カナ)_名字:空欄' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kana can't be blank", 'Family name kana is invalid'
      end

      it 'お名前(全角カナ)_名前:空欄' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank", 'First name kana is invalid'
      end

      it 'お名前(全角カナ):半角カナ' do
        @user.family_name_kana = 'ｱｱｱ'
        @user.first_name_kana = 'ｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name kana is invalid', 'First name kana is invalid'
      end

      # 生年月日
      it '生年月日:空欄' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end
