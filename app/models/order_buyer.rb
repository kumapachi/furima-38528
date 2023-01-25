class OrderBuyer
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number

  with_options presence: true do
    # orderモデルのバリデーション
    validates :user_id
    validates :item_id
    # トークンのバリデーション
    validates :token
    # buyerモデルのバリデーション
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :addresses
    validates :phone_number, format: { with: /\A[0-9]{11}\z/ },
                             length: { minimum: 10, message: 'is too short' }
  end

  def save
    # 購入情報を保存し、変数orderに代入する
    order = Order.create(user_id: user_id, item_id: item_id)
    # 購入者情報を保存し、order.idと紐付ける
    Buyer.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number)
  end

end