FactoryBot.define do

  factory :item do
    image {"aaa"}
    name {"gazo"}
    describe {"aaa"}
    category_id {1}
    condition_id {1}
    shipping_charge_id {1}
    shipping_region_id {1}
    days_until_shipping_id {1}
    price {1000}
    association :user, factory: :seller
  end

  factory :category do
    name {"aaa"}
  end

  factory :condition do
    name {"aaa"}
  end

  factory :shipping_charge do
    name {"aaa"}
  end

  factory :shipping_region do
    name {"aaa"}
  end

  factory :days_until_shipping do
    name {"aaa"}
  end

end