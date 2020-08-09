FactoryBot.define do

  factory :user do
    nickname { 'aaaaaa' }
    email { 'aaaaaa@sample.com' }
    password { 'nbr2nbr3' }
    password_confirmation { 'nbr2nbr3' }
    first_name { 'すず' }
    last_name { 'かし' }
    first_name_kana { 'スズキ' }
    last_name_kana { 'タカシ' }
    birthday { "2020-8-6" }    
  end

end