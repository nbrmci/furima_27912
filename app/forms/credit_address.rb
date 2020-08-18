class CreditAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :address, :building_name, :phone_number, :user_id, :item_id, :token, :price

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :address
  end

  with_options numericality: { only_integer: true } do
    validates :prefecture
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end

  def save
    Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, address:address, building_name: building_name, phone_number: phone_number, item_id: item_id)
  end

end