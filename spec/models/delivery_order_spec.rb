require 'rails_helper'

RSpec.describe DeliveryOrder, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @deliveryorder = FactoryBot.build(:delivery_order, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end


  describe '商品購入' do
    context '商品購入できるとき' do
      it '全てのカラムの値が存在すれば購入できる' do
        expect(@deliveryorder).to be_valid
      end
      it 'buildingは空でも購入できる' do
        @deliveryorder.building_name = ''
        expect(@deliveryorder).to be_valid
      end
    end

    context '新規登録できないとき' do
        it '郵便番号が空では購入できない' do
          @deliveryorder.post_code = ''
          @deliveryorder.valid?
          expect(@deliveryorder.errors.full_messages).to include("Post code can't be blank")
        end
        
        it '郵便番号は、「3桁ハイフン4桁」の半角文字列でなければ登録できない' do
          @deliveryorder.post_code = '1234'
          @deliveryorder.valid?
          expect(@deliveryorder.errors.full_messages).to include("Post code Please enter a valid postal code (e.g., 123-4567)")
        end
  
        it '都道府県が空では購入できない' do
          @deliveryorder.send_region_id = ' '
          @deliveryorder.valid?
          expect(@deliveryorder.errors.full_messages).to include("Send region can't be blank")
        end

        it '都道府県に1が選択されている場合は出品できない' do
          @deliveryorder.send_region_id = '1'
          @deliveryorder.valid?
          expect(@deliveryorder.errors.full_messages).to include("Send region must be other than 1")
        end
  
        it '市区町村が空では購入できない' do
          @deliveryorder.municipality = ''
          @deliveryorder.valid?
          expect(@deliveryorder.errors.full_messages).to include("Municipality can't be blank")
        end
  
        it '番地が空では購入できない' do
          @deliveryorder.address = ''
          @deliveryorder.valid?
          expect(@deliveryorder.errors.full_messages).to include("Address can't be blank")
        end

        it '電話番号が空では購入できない' do
            @deliveryorder.tel = ''
            @deliveryorder.valid?
            expect(@deliveryorder.errors.full_messages).to include("Tel can't be blank")
        end

        it '電話番号が9桁以下では保存できない' do
          @deliveryorder.tel = '123456789' # 9桁の電話番号
          @deliveryorder.valid?
          expect(@deliveryorder.errors.full_messages).to include("Tel Please enter between 10 and 11 digits")
        end
  
        it '電話番号が12桁以上では保存できない' do
          @deliveryorder.tel = '123456789123' # 12桁の電話番号
          @deliveryorder.valid?
          expect(@deliveryorder.errors.full_messages).to include("Tel Please enter between 10 and 11 digits")
        end

        it '電話番号は半角数字以外が含まれている場合は購入できない' do
          @deliveryorder.tel = '090-1234'
          @deliveryorder.valid?
          expect(@deliveryorder.errors.full_messages).to include("Tel Please enter between 10 and 11 digits")
        end

        it "tokenが空では購入できない" do
          @deliveryorder.token = nil
          @deliveryorder.valid?
          expect(@deliveryorder.errors.full_messages).to include("Token can't be blank")
        end

        it 'userが紐付いていなければ購入できない' do
          @deliveryorder.user_id = nil
          @deliveryorder.valid?
          expect(@deliveryorder.errors.full_messages).to include("User can't be blank")
        end

        it 'itemが紐付いていなければ購入できない' do
          @deliveryorder.item_id = nil
          @deliveryorder.valid?
          expect(@deliveryorder.errors.full_messages).to include("Item can't be blank")
        end
    end
  end
end



