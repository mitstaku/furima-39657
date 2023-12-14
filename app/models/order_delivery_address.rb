class OrderDeliveryAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zip_code, :prefecture_id, :city, :street_address, :building_name, :telephone_number, :order_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :zip_code, format:{with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :street_address
    validates :telephone_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
    validates :order_id
  end
  
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    DeliveryAddress.create(
      zip_code: zip_code,
      prefecture_id: prefecture_id,
      city: city, 
      street_address: street_address,
      building_name: building_name,
      telephone_number: telephone_number,
      order_id: order_id
      )
  end
end