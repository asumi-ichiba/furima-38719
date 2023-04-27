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
      it "category_id、condition_id、postage_id、area_id、number_idは2以上のidが選択されていれば登録できる" do
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
      it "カテゴリーの情報は2以上のidが選択さることが必須である" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end
      it "商品の状態の情報は2以上のidが選択さることが必須である" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition must be other than 1"
      end
      it "配送料の負担の情報は2以上のidが選択さることが必須である" do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Postage must be other than 1"
      end
      it "発送元の地域の情報は2以上のidが選択さることが必須である" do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Area must be other than 1"
      end
      it "発送までの日数の情報は2以上のidが選択さることが必須である" do
        @item.number_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Number must be other than 1"
      end
      it "価格の情報が必須である" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it "価格は、¥300以上が必須である" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
      it "価格は、¥9,999,999以下が必須である" do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end
      it "価格は半角数値のみ保存可能である" do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
    end
  end
end