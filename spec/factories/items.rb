FactoryBot.define do
  factory :item do
    name {"hoge"}
    description {Faker::Lorem.sentence}
    category_id {2}
    state_id {2}
    postage_id {2}
    prefectures_id {2}
    shipping_date_id {2}
    price {1111} 
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
