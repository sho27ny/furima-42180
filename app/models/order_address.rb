class OrderAddress
  include ActiveModel::Model

  attr_accessor :user_id, :item_id,
                :token,
                :postal_code, :prefecture_id, :city,
                :house_number, :building_name, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    #validates :token
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end

  def save
    ActiveRecord::Base.transaction do
      order = Order.create(user_id: user_id, item_id: item_id)
      puts " Order created: #{order.id}" if order.persisted?
  
      unless order.persisted?
        puts " Order保存に失敗しました: #{order.errors.full_messages}"
        raise ActiveRecord::Rollback
      end
  
      address = Address.create(
        postal_code: postal_code,
        prefecture_id: prefecture_id,
        city: city,
        house_number: house_number,
        building_name: building_name,
        phone_number: phone_number,
        order_id: order.id
      )
      puts " Address created: #{address.id}" if address.persisted?
  
      unless address.persisted?
        puts " Address保存に失敗しました: #{address.errors.full_messages}"
        raise ActiveRecord::Rollback
      end
  
      # ✅ 成功した場合は true を返す
      return true
    end
  
    # トランザクションが失敗したときは false を返す
    false
  end
  
end
