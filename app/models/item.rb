class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :days_until_shipping

  with_options presence: true do
    validates :category
    validates :condition
    validates :shipping_charge
    validates :shipping_region
    validates :days_until_shipping
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :shipping_region_id
    validates :days_until_shipping_id
  end
end