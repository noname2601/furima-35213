require 'rails_helper'

RSpec.describe ManagementPurchase, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @managements_purchases = FactoryBot.build(:management_purchase, user_id: @user.id , item_id: @item.id)
    sleep 0.1
  end


  describe "商品購入機能" do
    
    context '商品が購入できるとき' do
      it "商品購入が全て入力済みであること" do
      expect(@managements_purchases).to be_valid
      end
      it "建物名が空でも購入できること" do
      @managements_purchases.building_name = ""
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
      it "都道府県が1の場合登録できないこと" do
        @managements_purchases.area_id = 1
        @managements_purchases.valid?
        expect(@managements_purchases.errors.full_messages).to include("Area must be other than 1")
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
      it "電話番号は12桁以上は登録ができないこと" do
        @managements_purchases.phone_number = "090123456789"
        @managements_purchases.valid?
        expect(@managements_purchases.errors.full_messages).to include("Phone number is invalid")
      end
      it "電話番号は英数混合では登録できないこと" do
        @managements_purchases.phone_number = "a090123b567"
        @managements_purchases.valid?
        expect(@managements_purchases.errors.full_messages).to include("Phone number is invalid")
      end
      it "クレジットカード情報は必須であること" do
        @managements_purchases.token = ""
        @managements_purchases.valid?
        expect(@managements_purchases.errors.full_messages).to include("Token can't be blank")
      end
      it "user_idが空だと登録できない" do
        @managements_purchases.user_id = ""
        @managements_purchases.valid?
        expect(@managements_purchases.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空だと登録できない" do
        @managements_purchases.item_id = ""
        @managements_purchases.valid?
        expect(@managements_purchases.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
