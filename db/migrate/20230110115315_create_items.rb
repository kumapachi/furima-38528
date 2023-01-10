class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string     :item_name,          null: false
      t.text       :item_info,          null: false
      t.integer    :item_category_id,   null: false
      t.integer    :item_condition_id,  null: false
      t.integer    :shipping_fee_id,    null: false
      t.integer    :prefecture_id,      null: false
      t.integer    :scheduled_delivery, null: false
      t.integer    :price,              null: false
      t.timestamps
    end
  end
end
