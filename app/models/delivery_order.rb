class DeliveryOrder 

    include ActiveModel::Model
    attr_accessor :user_id, :item_id, :post_code, :send_region_id, :municipality, :address, :building_name, :tel, :token
    with_options presence: true do
      validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'は正確に入力してください' }
      validates :send_region_id, numericality: { other_than: 1, message: "を選択してください"} 
      validates :municipality
      validates :address
      validates :tel, length: { minimum: 10, maximum: 11, message: 'は10桁から11桁の数字を入力してください' }, format: { with: /\A\d{10,11}\z/, message: 'は正確に入力してください' }
      validates :token
      validates :item_id
      validates :user_id
    end
  
    def save
      order = Order.create(user_id: user_id, item_id: item_id)
      delivery = Delivery.create(post_code: post_code, send_region_id: send_region_id, municipality: municipality, address: address, building_name: building_name, tel: tel, order_id: order.id)
    end
  end

