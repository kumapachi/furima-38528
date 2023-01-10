class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user

  belongs_to :item_category
  belongs_to :item_condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  with_options presence: true do
    validates :item_name, :item_info
    validates :item_category
  end
  with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :item_category_id, :item_condition, :shipping_fee, :prefecture, :scheduled_delivery
  end

end
