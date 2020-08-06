FactoryBot.define do
  factory :user do
    nickname { 'nbrmci' }
    email { 'nbrmci@sample.com' }
    password { 'nbr3nbr3' }
    first_name { 'もち' }
    last_name { 'のぼ' }
    first_name_kana { 'モチ' }
    last_name_kana { 'ノボ' }
    birthday { 2020/8/6 }    
  end
end