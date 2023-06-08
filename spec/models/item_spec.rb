require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user: @user)
  end

  describe '商品投稿' do
    context '新規登録できるとき' do
      it '全てのカラムの値が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規登録できないとき' do
      it '商品画像が空だと投稿できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end

      it '商品名が空だと投稿できない' do
        @item = Item.new(item: '')
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      it '商品説明が空だと投稿できない' do
        @item = Item.new(item_comment: '')
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end

      it 'カテゴリー情報が空だと投稿できない' do
        @item = Item.new(item_category_id: '')
        @item.valid?
       expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end

      it '商品状態が空だと投稿できない' do
        @item = Item.new(item_situation_id: '')
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end

      it '配送料の負担が空だと投稿できない' do
        @item = Item.new(delivery_money_id: '')
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end

      it '発送元の情報が空だと投稿できない' do
        @item = Item.new(send_region_id: '')
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end

      it '発送までの日数が空だと投稿できない' do
        @item = Item.new(send_day_id: '')
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end

      it '発送までの日数に1が選択されている場合は出品できない' do
        @item.send_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end

      it '価格の情報が空だと投稿できない' do
        @item = Item.new(price: '')
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end

      it '価格が¥300より少ない時は出品できない' do
        @item = Item.new(price: '299')
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は300円以上9,999,999以下で入力してください")
      end

      it '価格が¥9,999,999より少ない時は出品できない' do
        @item = Item.new(price: '10_000_000')
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は300円以上9,999,999以下で入力してください")
      end

      it '価格は半角数値でなければ投稿できない' do
        @item = Item.new(price:'aびー')
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は300円以上9,999,999以下で入力してください")
      end

      it 'userが紐付いていなければ出品できない' do
        @item = Item.new(user_id:'1')
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
