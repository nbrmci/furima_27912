FactoryBot.define do
  factory :credit_address do

    token {"sampletokensampletoken"}
    postal_code {"123-4567"}
    prefecture {1}
    city {"横浜市"}
    address {"横浜1-1-1"}
    building_name {"横浜ハイツ"}
    phone_number {'01234567891'}
    association :user_id, factory: :buyer

  end
end