require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe "商品出品機能" do
    
    context '商品出品ができる時' do
      it "商品出品が全て入力済みであること" do
      expect(@item).to be_valid
      end
    end
  

    context '商品出品ができない時' do
    it "商品画像を1枚つけることが必須であること" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "商品名が必須であること" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "商品の説明が必須であること" do
      @item.introduction = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Introduction can't be blank")
    end
    it "カテゴリーの情報が必須であること" do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
  end
  it "商品の状態についての情報が必須であること" do
    @item.item_condition_id = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Item condition can't be blank")
  end
  it "配送料の負担についての情報が必須であること" do
    @item.shipping_free_id = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping free can't be blank")
  end
  it "発送元の地域についての情報が必須であること" do
    @item.area_id = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Area can't be blank")
  end
  it "発送までの日数についての情報が必須であること" do
    @item.ship_day_id = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Ship day can't be blank")
  end
  it "販売価格についての情報が必須であること" do
    @item.selling_price = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Selling price can't be blank")
  end
  it '販売価格が300未満だと保存できないこと' do
    @item.selling_price = 299
    @item.valid? 
    expect(@item.errors.full_messages).to include('Selling price is invalid')
  end
  it '販売価格が9999999以上だと保存できないこと' do
    @item.selling_price = 10000000
    @item.valid? 
    expect(@item.errors.full_messages).to include('Selling price is invalid')
  end
  it "販売価格は全角文字では登録できないこと" do
    @item.selling_price = "２０００"
    @item.valid?
    expect(@item.errors.full_messages).to include("Selling price is invalid")
  end
  it "販売価格は半角英数混合では登録できないこと" do
    @item.selling_price = "aa500"
    @item.valid?
    expect(@item.errors.full_messages).to include("Selling price is invalid")
  end
  it "販売価格は半角英語だけでは登録できないこと" do
    @item.selling_price = "aaaaaaa"
    @item.valid?
    expect(@item.errors.full_messages).to include("Selling price is invalid")
  end
  it "カテゴリーは１が選択された場合は出品できないこと" do
    @item.category_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Category must be other than 1")
  end
  it "商品の状態は１が選択された場合は出品できないこと" do
   @item.item_condition_id = 1
   @item.valid?
   expect(@item.errors.full_messages).to include("Item condition must be other than 1")
  end
  it "配送料の負担は１が選択された場合は出品できないこと" do
    @item.shipping_free_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping free must be other than 1")
  end
  it "発送元の地域は１が選択された場合は出品できないこと" do
    @item.area_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Area must be other than 1")
  end
  it "発送までの日数は１が選択された場合は出品できないこと" do
    @item.ship_day_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Ship day must be other than 1")
  end
end
end
end


