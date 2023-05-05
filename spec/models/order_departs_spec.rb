require 'rails_helper'

RSpec.describe OrderDeparts, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_departs = FactoryBot.build(:order_departs, user_id: user.id, item_id: item.id)
    end

    context '商品購入できる時' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_departs).to be_valid
      end
      it '建物名は任意であること' do
        @order_departs.building = ''
        expect(@order_departs).to be_valid
      end
    end

    context '商品が購入できない時' do
      it '郵便番号が必須' do
        @order_departs.post_cord = ''
        @order_departs.valid?
        expect(@order_departs.errors.full_messages).to include "Post cord can't be blank"
      end
      it '郵便番号は「3桁ハイフン4桁」の半角文字列のみ保存可能' do
        @order_departs.post_cord = '1234567'
        @order_departs.valid?
        expect(@order_departs.errors.full_messages).to include
      end
      it '都道府県の情報は2以上のidが選択さることが必須である' do
        @order_departs.area_id = 1
        @order_departs.valid?
        expect(@order_departs.errors.full_messages).to include "Area must be other than 1"
      end
      it '市区町村が必須であること' do
        @order_departs.municipalities = ''
        @order_departs.valid?
        expect(@order_departs.errors.full_messages).to include "Municipalities can't be blank"
      end
      it '番地が必須であること' do
        @order_departs.address = ''
        @order_departs.valid?
        expect(@order_departs.errors.full_messages).to include "Address can't be blank"
      end
      it '電話番号が必須であること' do
        @order_departs.telephone = ''
        @order_departs.valid?
        expect(@order_departs.errors.full_messages).to include "Telephone can't be blank"
      end
      it '電話番号は10桁以上で保存可能' do
        @order_departs.telephone = '123456789'
        @order_departs.valid?
        expect(@order_departs.errors.full_messages).to include
      end
      it '電話番号は11桁以下で保存可能' do
        @order_departs.telephone = '123456789123'
        @order_departs.valid?
        expect(@order_departs.errors.full_messages).to include
      end
      it '電話番号は半角数値のみ保存可能' do
        @order_departs.telephone = '０８０１２３４５６７８'
        @order_departs.valid?
        expect(@order_departs.errors.full_messages).to include
      end
      it 'user_idが紐づいていない場合は保存できない' do
        @order_departs.user_id = nil
        @order_departs.valid?
        expect(@order_departs.errors.full_messages).to include "User can't be blank"
      end
      it 'item_idが紐づいていない場合は保存できない' do
        @order_departs.item_id = nil
        @order_departs.valid?
        expect(@order_departs.errors.full_messages).to include "Item can't be blank"
      end
      it "tokenが空では登録できないこと" do
        @order_departs.token = nil
        @order_departs.valid?
        expect(@order_departs.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
