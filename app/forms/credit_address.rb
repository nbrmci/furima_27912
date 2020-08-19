class CreditAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :address, :building_name, :phone_number, :item_id, :user_id, :token, :price

  with_options presence: true do
    validates :token
    with_hyphen = /\A\d{3}[-]\d{4}\z/
    validates :postal_code, format: { with: with_hyphen }
    zenkaku_japanese = /\A[ぁ-んァ-ン一-龥]/
    validates :city, format: { with: zenkaku_japanese }
    validates :address
  end

  with_options numericality: { only_integer: true } do
    validates :prefecture
    number_within_11_digits = /\A\d{10,11}\z/
    validates :phone_number, format: { with: number_within_11_digits }
  end

  def save
    Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, address: address, building_name: building_name, phone_number: phone_number, item_id: item_id)
  end

end