require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
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
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end

  it '商品名が空だと投稿できない' do
    @item = Item.new(item: '')
    @item.valid?
    expect(@item.errors.full_messages).to include("Item can't be blank")
  end

  it '商品説明が空だと投稿できない' do
    @item = Item.new(item_comment: '')
    @item.valid?
    expect(@item.errors.full_messages).to include("Item comment can't be blank")
  end

  it 'カテゴリー情報が空だと投稿できない' do
    @item = Item.new(item_category_id: '')
    @item.valid?
    expect(@item.errors.full_messages).to include("Item category can't be blank")
  end

  it '商品状態が空だと投稿できない' do
    @item = Item.new(item_situation_id: '')
    @item.valid?
    expect(@item.errors.full_messages).to include("Item situation can't be blank")
  end

  it '配送料の負担が空だと投稿できない' do
    @item = Item.new(delivery_money_id: '')
    @item.valid?
    expect(@item.errors.full_messages).to include("Delivery money can't be blank")
  end

  it '発送元の情報が空だと投稿できない' do
    @item = Item.new(send_region_id: '')
    @item.valid?
    expect(@item.errors.full_messages).to include("Send region can't be blank")
  end

  it '発送までの日数が空だと投稿できない' do
    @item = Item.new(send_day_id: '')
    @item.valid?
    expect(@item.errors.full_messages).to include("Send day can't be blank")
  end

  it '価格の情報が空だと投稿できない' do
    @item = Item.new(price: '')
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
  end

  it '価格が¥300より少ない時は出品できない' do
    @item = Item.new(price: '299')
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
  end

  it '価格が¥9,999,999より少ない時は出品できない' do
    @item = Item.new(price: '10_000_000')
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
  end

  it '価格は半角数値でなければ投稿できない' do
    @item = Item.new(price:'aびー')
    @item.valid?
    expect(@item.errors.full_messages).to include('Price is not a number')
  end
  end
end
end
