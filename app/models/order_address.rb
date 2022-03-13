class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building, :telephone, :user_id, :business_id, :token

  with_options presence: true do
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :address
    validates :telephone, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }
    validates :business_id
    validates :user_id
    validates :token
  end

  def save
    order = Order.create(business_id: business_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building,
                   telephone: telephone, order_id: order.id)
  end
end