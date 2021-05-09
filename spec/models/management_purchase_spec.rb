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
        expect(@managements_purchases.errors.full_messages).to include("郵便番号を入力してください")
      end
      it "郵便番号の保存にはハイフンが必要であること" do
        @managements_purchases.post_code = "6550031"
        @managements_purchases.valid?
        expect(@managements_purchases.errors.full_messages).to include("郵便番号ハイフンを入力してください")
      end
      it "都道府県が必須であること" do
        @managements_purchases.area_id = ""
        @managements_purchases.valid?
        expect(@managements_purchases.errors.full_messages).to include("都道府県を入力してください")
      end
      it "都道府県が1の場合登録できないこと" do
        @managements_purchases.area_id = 1
        @managements_purchases.valid?
        expect(@managements_purchases.errors.full_messages).to include("都道府県は1以外の値にしてください")
      end
      it "市区町村が必須であること" do
        @managements_purchases.city = ""
        @managements_purchases.valid?
        expect(@managements_purchases.errors.full_messages).to include("市区町村を入力してください")
      end
      it "番地が必須であること" do
        @managements_purchases.adress = ""
        @managements_purchases.valid?
        expect(@managements_purchases.errors.full_messages).to include("番地を入力してください")
      end
      it "電話番号が必須であること" do
        @managements_purchases.phone_number = ""
        @managements_purchases.valid?
        expect(@managements_purchases.errors.full_messages).to include("電話番号を入力してください")
      end
      it "電話番号は12桁以上は登録ができないこと" do
        @managements_purchases.phone_number = "090123456789"
        @managements_purchases.valid?
        expect(@managements_purchases.errors.full_messages).to include("電話番号は不正な値です")
      end
      it "電話番号は英数混合では登録できないこと" do
        @managements_purchases.phone_number = "a090123b567"
        @managements_purchases.valid?
        expect(@managements_purchases.errors.full_messages).to include("電話番号は数値で入力してください")
      end
      it "クレジットカード情報は必須であること" do
        @managements_purchases.token = ""
        @managements_purchases.valid?
        expect(@managements_purchases.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it "user_idが空だと登録できない" do
        @managements_purchases.user_id = ""
        @managements_purchases.valid?
        expect(@managements_purchases.errors.full_messages).to include("Userを入力してください")
      end
      it "item_idが空だと登録できない" do
        @managements_purchases.item_id = ""
        @managements_purchases.valid?
        expect(@managements_purchases.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end
