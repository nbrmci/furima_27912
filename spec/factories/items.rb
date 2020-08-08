FactoryBot.define do

  factory :item do
    name {"gazo"}
    describe {"aaa"}
    category_id {1}
    condition_id {1}
    shipping_charge_id {1}
    shipping_region_id {1}
    days_until_shipping_id {1}
    price {1000}
    association :user, factory: :user
  end

  factory :category do
    name {"aaa"}
  end

end