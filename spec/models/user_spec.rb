require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  describe "ユーザー新規登録" do
    context '新規登録できるとき' do
      it 'nickname、email、password、password_confirmation、first_name、last_name、first_name_kana 、last_name_kana、birthが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない' do
      it "ニックネームが必須であること" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it "メールアドレスが必須であること" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it "メールアドレスが一意性であること" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
      it "メールアドレスは、@を含む必要があること" do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include"Email is invalid"
      end
      it "パスワードが必須であること" do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it "パスワードは、6文字以上での入力が必須であること"  do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include"Password is too short (minimum is 6 characters)"
      end
      it "パスワードは、半角英数字混合での入力が必須であること" do
        @user.password = 'aaaaaaa'
        @user.password_confirmation = 'bbbbbbb'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it "パスワードは、半角英数字混合での入力が必須であること" do
        @user.password = '111111'
        @user.password_confirmation = '222222'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it "全角文字を含むパスワードでは登録できない" do
        @user.password = '1234５'
        @user.password_confirmation = '1234５'
        @user.valid?
        expect(@user.errors.full_messages).to include"Password is invalid"
      end
      it "パスワードとパスワード（確認）は、値の一致が必須であること" do
        @user.password = '123456'
        @user.password_confirmation = '134567'
        @user.valid?
        expect(@user.errors.full_messages).to include"Password confirmation doesn't match Password"
      end
      it "お名前(全角)は、名字が必須であること" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it "お名前(全角)は、名前が必須であること" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it "名字は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
        @user.last_name = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid"  
      end
      it "名前は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
        @user.first_name = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"  
      end
      it "お名前カナ(全角)は、名字が必須であること。" do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it "お名前カナ(全角)は、名前が必須であること。" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it "名字は、全角（カタカナ）での入力が必須であること" do
        @user.last_name_kana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana is invalid"
      end
      it "名前は、全角（カタカナ）での入力が必須であること" do
        @user.first_name_kana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana is invalid"
      end
      it "生年月日が必須であること" do
        @user.birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth can't be blank"
      end
    end
  end
end
