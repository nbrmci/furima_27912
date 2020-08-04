class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :days_until_shipping

  #空の投稿を保存できないようにする
  validates :title, :text, :category, presence: true
  validates :title, :text, :condition, presence: true
  validates :title, :text, :shipping_charge, presence: true
  validates :title, :text, :shipping_region, presence: true
  validates :title, :text, :days_until_shipping, presence: true

  #選択が「--」のままになっていないか
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :shipping_region_id
    validates :days_until_shipping_id
  end
end