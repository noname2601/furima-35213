require 'rails_helper'

RSpec.describe ManagementPurchase, type: :model do
  before do
    @managements_purchases = FactoryBot.build(:management_purchase)
  end


  describe "商品購入機能" do
    
    context '商品が購入できるとき' do
      it "商品購入が全て入力済みであること" do
      expect(@managements_purchases).to be_valid
      end
    end

    context '商品購入ができない時' do
      it "郵便番号が必須であること" do
        @managements_purchases.post_code = ""
        @managements_purchases.valid?
        expect(@managements_purchases.errors.full_messages).to include("Post code can't be blank")
      end
      it "郵便番号の保存にはハイフンが必要であること" do
        @managements_purchases.post_code = "6550031"
        @managements_purchases.valid?
        expect(@managements_purchases.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it "都道府県が必須であること" do
        @managements_purchases.area_id = ""
        @managements_purchases.valid?
        expect(@managements_purchases.errors.full_messages).to include("Area can't be blank")
      end
      it "市区町村が必須であること" do
        @managements_purchases.city = ""
        @managements_purchases.valid?
        expect(@managements_purchases.errors.full_messages).to include("City can't be blank")
      end
      it "番地が必須であること" do
        @managements_purchases.adress = ""
        @managements_purchases.valid?
        expect(@managements_purchases.errors.full_messages).to include("Adress can't be blank")
      end
      it "電話番号が必須であること" do
        @managements_purchases.phone_number = ""
        @managements_purchases.valid?
        expect(@managements_purchases.errors.full_messages).to include("Phone number can't be blank")
      end
      it "電話番号は11桁以内の数値のみ保存可能なこと" do
        @managements_purchases.phone_number = "090123456789"
        @managements_purchases.valid?
        expect(@managements_purchases.errors.full_messages).to include("Phone number is invalid")
      end
      it "クレジットカード情報は必須であること" do
        @managements_purchases.token = ""
        @managements_purchases.valid?
        expect(@managements_purchases.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end