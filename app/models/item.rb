class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :name, presence:true
  validates :description, presence:true
  validates :category_id, presence:true
  validates :state_id, presence:true
  validates :postage_id, presence:true
  validates :prefectures_idame, presence:true
  validates :shipping_date_id, presence:true
  validates :price, presence:true

end
