FactoryBot.define do
  factory :order_address do
    token {'tok_abcdefghijk00000000000000000'}
    prefecture_code {'111-1111'}
    prefectures_id {2}
    city {'東京都'}
    house_number {'1-1'}
    building_name { '東京ハイツ' }
    phone_number {'0901111222'}
    user_id {1}
    item_id {1}
  end
end
