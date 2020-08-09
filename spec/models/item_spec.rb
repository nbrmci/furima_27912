require 'rails_helper'

RSpec.describe Item, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe '出品機能のテスト' do
    it "商品名、商品説明、カテゴリー情報、商品状態情報、配送料の負担、発送元の地域、発送までの日数、価格情報が必須かつ価格の範囲が300円から9,999,999円の間である場合有効である" do
      @item = FactoryBot.build(:item)
      @user = FactoryBot.build(:user)
      @category = FactoryBot.build(:category)
      @condition = FactoryBot.build(:condition)
      @shipping_charge = FactoryBot.build(:shipping_charge)
      @shipping_region = FactoryBot.build(:shipping_region)
      @days_until_shipping =FactoryBot.build(:days_until_shipping)
      expect(@item).to be_valid
    end
    before do
      @user = FactoryBot.build(:user)
      @item = FactoryBot.build(:item)
      @category = FactoryBot.build(:category)
      @condition = FactoryBot.build(:condition)
      @shipping_charge = FactoryBot.build(:shipping_charge)
      @shipping_region = FactoryBot.build(:shipping_region)
      @days_until_shipping =FactoryBot.build(:days_until_shipping)
    end

    it '商品名がないと出品できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品説明がないと出品できないこと' do
      @item.describe = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Describe can't be blank")
    end

    it 'カテゴリー情報がないと出品できないこと' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it '商品状態の情報がないと出品できないこと' do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end

    it '配送料の負担がないと出品できないこと' do
      @item.shipping_charge_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge is not a number")
    end

    it '発送元の地域がないと出品できないこと' do
      @item.shipping_region_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping region is not a number")
    end

    it '配送料の負担がないと出品できないこと' do
      @item.shipping_charge_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge is not a number")
    end

    it '発送までの日数がないと出品できないこと' do
      @item.days_until_shipping_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Days until shipping is not a number")
    end

    it '価格がないと出品できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it '価格の範囲は300円から9,999,999でないと出品できないこと' do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than 300")
    end

    it '価格の範囲は300円から9,999,999円でないと出品できないこと' do
      @item.price = 20,000,000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number")
    end

    it '価格は整数でなければ出品できないこと' do
      @item.price = "aaaa"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it 'category_idは整数でなければ出品できないこと' do
      @item.category_id = "aaaa"
      @item.valid?
      expect(@item.errors.full_messages).to include("Category is not a number")
    end

    it 'condition_idは整数でなければ出品できないこと' do
      @item.condition_id = "aaaa"
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition is not a number")
    end

    it 'category_idは整数でなければ出品できないこと' do
      @item.category_id = "aaaa"
      @item.valid?
      expect(@item.errors.full_messages).to include("Category is not a number")
    end

    it 'shipping_charge_idは整数でなければ出品できないこと' do
      @item.shipping_charge_id = "aaaa"
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge is not a number")
    end

    it 'shipping_region_idは整数でなければ出品できないこと' do
      @item.shipping_region_id = "aaaa"
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping region is not a number")
    end

    it 'days_until_shipping_idは整数でなければ出品できないこと' do
      @item.days_until_shipping_id = "aaaa"
      @item.valid?
      expect(@item.errors.full_messages).to include("Days until shipping is not a number")
    end

  end
end