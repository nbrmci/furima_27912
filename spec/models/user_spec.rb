require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー登録情報' do
    before do
      @user = FactoryBot.build(:user)
    end
  # pending "add some examples to (or delete) #{__FILE__}"
    it 'ニックネームは空だと保存できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'アドレスは空だと保存できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'アドレスは同じものは登録できないこと' do
      @user.email = 'nbrmci@sample.com'
      expect(@user).to_not be_valid
      expect(@user.errors.email).to include("has already been taken")
    end
    it 'アドレスは@を含むこと' do
    end
    it 'パスワードは空では保存できないこと' do
    end
    it 'パスワードは６文字以上であること' do
    end
    it 'パスワードは半角英数字混合であること' do
    end
    it 'パスワードは確認のため2回入力すること' do
    end
    it '名字と名前は空だと保存できないこと' do
    end
    it 'ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること' do
    end
    it 'ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること' do
    end
    it 'ユーザー本名のフリガナは全角（カタカナ）で入力させること' do
    end
    it '生年月日が必須であること' do
    end
  end
end
