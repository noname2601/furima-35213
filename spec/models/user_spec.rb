require 'rails_helper'
 RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
   describe "ユーザー新規登録" do
     it "nicknameが必須であること" do
       @user.nickname = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end
     it "emailが必須であること" do
       @user.email = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("Email can't be blank")
     end
     it 'passwordが必須であること' do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
   end

   it "passwordは英数字混合でないと登録できない" do
    @user.password = "000000"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end
   it 'family_nameが必須であること' do
    @user.family_name = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Family name can't be blank")
 end
 it 'first_nameが必須であること' do
  @user.first_name = ""
  @user.valid?
  expect(@user.errors.full_messages).to include("First name can't be blank")
end
it 'family_name_kanaが必須であること' do
  @user.family_name_kana = ""
  @user.valid?
  expect(@user.errors.full_messages).to include("Family name kana can't be blank")
end
it 'first_name_kanaが必須であること' do
  @user.first_name_kana = ""
  @user.valid?
  expect(@user.errors.full_messages).to include("First name kana can't be blank")
end
it 'birth_dayが必須であること' do
  @user.birth_day = ""
  @user.valid?
  expect(@user.errors.full_messages).to include("Birth day can't be blank")
end
  it 'family_name_kanaがカタカナで返ること' do
   @user.family_name_kana = ""
   @user.valid?
   expect(@user.errors.full_messages).to include("Family name kana is invalid")
  end

  it 'first_name_kanaがカタカナで返ること' do
    @user.first_name_kana = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana is invalid")
   end


it '重複したemailが存在する場合登録できない' do
  @user.save
  another_user = FactoryBot.build(:user)
  another_user.email = @user.email
  another_user.valid?
  expect(another_user.errors.full_messages).to include("Email has already been taken")
end
it 'パスワードは、6文字以上での入力が必須であること' do
  @user.password = "a0000"
  @user.password_confirmation = "a0000"
  @user.valid?
  expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
end
it "パスワードと確認が一致していないと登録できない" do
  @user.password = "a111111"
  @user.password_confirmation = "b111111"
  @user.valid?
  expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
end
end
 end