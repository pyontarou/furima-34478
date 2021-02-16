class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image
  belongs_to :category
  belongs_to :state
  belongs_to :postage
  belongs_to :prefectures
  belongs_to :shipping_date

  validates :name, presence:true
  validates :description, presence:true
  validates :category_id,  numericality: { other_than: 1 }
  validates :state_id,  numericality: { other_than: 1 }
  validates :postage_id,  numericality: { other_than: 1 }
  validates :prefectures_idame,  numericality: { other_than: 1 }
  validates :shipping_date_id,  numericality: { other_than: 1 }
  validates :price,  numericality: { other_than: 1 }

end
