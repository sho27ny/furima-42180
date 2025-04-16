class OrderAddress
  include ActiveModel::Model

  attr_accessor :user_id, :item_id,
                :token,
                :postal_code, :prefecture_id, :city,
                :house_number, :building_name, :phone_number

                with_options presence: true do
                  validates :user_id
                  validates :item_id
                  validates :token 
                  validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
                  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
                  validates :city
                  validates :house_number
                  validates :phone_number,
                            format: { with: /\A\d{10,11}\z/, message: 'is invalid. Input only number' },
                            length: { minimum: 10, too_short: 'is too short' }
                  
                end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    address = Address.create(
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      house_number: house_number,
      building_name: building_name,
      phone_number: phone_number,
      order_id: order.id
    )
  end
  
end
