class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image
  has_many :messages
  
  with_options presence: true do
    validates :name
    validates :description
    validates :image
  end  

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :postage_id
    validates :prefectures_id
    validates :shipping_date_id
  end

  validates :price, format: {with: /\A[0-9]+\z/, message:'半角数字で入力してください' }, numericality: { greater_than: 299, less_than: 10000000}

  def self.search(search)
    if search != ""
      Item.where('name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :postage
  belongs_to :prefectures
  belongs_to :shipping_date
  
end
