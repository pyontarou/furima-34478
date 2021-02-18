class Address < ApplicationRecord
  belongs_to :order

  with_options presence: true do
    validates :city
    validates :house_number
    validates :building_name
    validates :prefectures_id, numericality: { other_than: 1 }
    validates :prefecture_code,format: { with: /\A\d{3}[-]\d{4}\z/, message: '郵便番号はハイフンが必要です'}
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: '電話番号は11桁以内の数値を入力してください' }
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefectures

end

