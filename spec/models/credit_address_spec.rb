require 'rails_helper'

RSpec.describe CreditAddress, type: :model do
  describe '住所の保存' do
    before do
     @credit_address = FactoryBot.build(:credit_address)
    end
    
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@credit_address).to be_valid
    end

    it '郵便番号が空だと保存できないこと' do
      @credit_address.postal_code = nil
      @credit_address.valid?
      expect(@credit_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it '郵便番号が半角のハイフンを含んだ正しい形でないと保存できないこと' do
      @credit_address.postal_code = '1234567'
      @credit_address.valid?
      expect(@credit_address.errors.full_messages).to include("Postal code is invalid")
    end

    it '都道府県を選択しないと保存できないこと' do
      @credit_address.prefecture = nil
      @credit_address.valid?
      expect(@credit_address.errors.full_messages).to include("Prefecture is not a number")
    end

    it '市区町村が空だと保存できないこと' do
      @credit_address.city = nil
      @credit_address.valid?
      expect(@credit_address.errors.full_messages).to include("City can't be blank")
    end

    it '市区町村は全角日本語でないと保存できないこと' do
      @credit_address.city = "yokohama"
      @credit_address.valid?
      expect(@credit_address.errors.full_messages).to include("City is invalid")
    end

    it '番地は空だと保存できないこと' do
      @credit_address.address = nil
      @credit_address.valid?
      expect(@credit_address.errors.full_messages).to include("Address can't be blank")
    end

    it '建物名は空でも保存できること' do
      @credit_address.building_name = nil
      expect(@credit_address).to be_valid
    end

    it '電話番号は空だと保存できないこと' do
      @credit_address.phone_number = nil
      @credit_address.valid?
      expect(@credit_address.errors.full_messages).to include("Phone number is invalid")
    end

    it '電話番号は11桁以内でないと保存できないこと' do
      @credit_address.phone_number = '123456789012'
      @credit_address.valid?
      expect(@credit_address.errors.full_messages).to include("Phone number is invalid")
    end

    it '電話番号は整数でなければ保存できないこと' do
      @credit_address.phone_number = '横浜駅'
      @credit_address.valid?
      expect(@credit_address.errors.full_messages).to include("Phone number is invalid")
    end  

  end
end