require 'rails_helper'

describe Item do
  before do
    @item = FactoryBot.build(:item)
  end
    
  describe '商品の出品' do
    context '出品ができるとき' do
      it 'imageとnameとdescriptionとcategory_idとstate_id とpostage_idとprefectures_idとshipping_date_idとpriceがあれば出品できること' do
        expect(@item).to be_valid
      end

      it "priceが300だと登録できる" do
        @item.price = 300
        expect(@item).to be_valid

      end

      it "priceが9999999だと登録できる" do
        @item.price = 9999999
        expect(@item).to be_valid
      end
    end

    context '出品ができないとき' do
      it "imageがないと出品できないこと" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "nameがないと出品できないこと" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "descriptionがないと出品できないこと" do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it "category_idが未選択(id=1)だと出品できないこと" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "state_idが未選択(id=1)だとと出品できないこと" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "postage_idが未選択(id=1)だとと出品できないこと" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "prefectures_idが未選択(id=1)だとと出品できないこと" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "shipping_date_idが未選択(id=1)だとと出品できないこと" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "priceがないと出品できないこと" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 半角数字で入力してください")
      end

      it "priceは半角数字でないと出品できないこと" do
        @item.price = "１１１１"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "priceが299以下では出品できないこと" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 299")
      end

      it "priceが10000000以上では出品できないこと" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end
    end
  end
end
