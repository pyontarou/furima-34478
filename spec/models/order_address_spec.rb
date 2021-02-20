require 'rails_helper'

  describe OrderAddress do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    describe '商品の購入' do
      context '商品が購入できるとき' do
        it 'tokenとprefecture_codeとprefectures_idとcityとhouse_numberとphone_numberがあれば購入できること' do
          expect(@order_address).to be_valid
        end

        it 'building_nameは空でも購入できること' do
          @order_address.building_name = ""
          expect(@order_address).to be_valid 
        end
      end 

      context '商品が購入できないとき' do
        it 'tokenが空では購入できない' do
          @order_address.token = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Token can't be blank")
        end

        it 'prefecture_codeが空では購入できない' do
          @order_address.prefecture_code = ""
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Prefecture code can't be blank")
        end

        it 'prefecture_codeがハイフンを含んだ正しい形式でないと保存できないこと' do
          @order_address.prefecture_code = "1111111"
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Prefecture code Input correctly")
        end

        it 'prefectures_idが未選択(id=1)だと購入できない' do
          @order_address.prefecture_code = 1
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Prefecture code Input correctly")
        end

        it 'cityが空では購入できない' do
          @order_address.city = ""
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("City can't be blank")
        end

        it 'house_numberが空では購入できない' do
          @order_address.house_number = ""
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("House number can't be blank")
        end 

        it 'phone_numberが空では購入できない' do
          @order_address.phone_number = ""
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
        end

        it 'phone_numberにハイフンを含でいると購入できない' do
          @order_address.prefecture_code = "090-111111"
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Prefecture code Input correctly") 
        end

        it 'phone_numberは数字でないと購入できない' do
          @order_address.prefecture_code = "aaaaaaaaaa"
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Prefecture code Input correctly")
        end

        it 'phone_numberは12桁以上では購入できない' do
          @order_address.prefecture_code = "aaaaaaaaaaaa"
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Prefecture code Input correctly")
        end

        it 'user_idが空では購入できない' do
          @order_address.user_id = ""
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("User can't be blank")
        end

        it 'item_idが空では購入できない' do
          @order_address.item_id = ""
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Item can't be blank")
        end
      end
    end
end
