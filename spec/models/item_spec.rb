require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe "商品出品" do 
    context '商品出品できるとき' do  
      it "image,name、content、category_id、condition_id、postage_id、area_id、number_id、priceが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end
    context '商品出品できない' do
      it "商品画像を1枚つけることが必須である" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it "商品名が必須である" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it "商品の説明が必須である" do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Content can't be blank"
      end
      it "カテゴリーの情報が必須である" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it "商品の状態の情報が必須である" do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it "配送料の負担の情報が必須である" do
        @item.postage_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Postage can't be blank"
      end
      it "発送元の地域の情報が必須である" do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Area can't be blank"
      end
      it "発送までの日数の情報が必須である" do
        @item.number_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Number can't be blank"
      end
      it "価格の情報が必須である" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it "価格は、¥300以上が必須である" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"
      end
      it "価格は、¥9,999,999以下が必須である" do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"
      end
      it "価格は半角数値のみ保存可能である" do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"
      end
    end
  end
end