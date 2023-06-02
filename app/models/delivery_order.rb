class DeliveryOrder < ApplicationRecord

    include ActiveModel::Model
    attr_accessor :user_id, :item_id, :post_code, :send_region_id, :municipality, :address, :building_name, :tel, :order_id, :token
    
    with_options presence: true do
      validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'Please enter a valid postal code (e.g., 123-4567)' }
      validates :send_region_id, numericality: { other_than: 1 } 
      validates :municipality
      validates :address
      validates :tel, length: { minimum: 10, maximum: 11, message: 'Please enter between 10 and 11 digits' }, format: { with: /\A\d{10,11}\z/, message: 'Please enter a valid phone number' }
      validates :token
      validates :item_id
      validates :user_id
    end
  
    def save
      order = Order.create(user_id: user_id, item_id: item_id)
      delivery = Delivery.create(post_code: post_code, send_region_id: send_region_id, municipality: municipality, address: address, building_name: building_name, tel: tel, order_id: order.id)
    end
  end

