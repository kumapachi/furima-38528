class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to       :user
  has_one          :order
  has_one_attached :image

  belongs_to :item_category
  belongs_to :item_condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  with_options presence: true do
    validates :image, :item_name, :item_info
    validates :item_category_id, :item_condition_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
  with_options numericality: { other_than: 1 } do
    validates :item_category_id, :item_condition_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id
  end
end
