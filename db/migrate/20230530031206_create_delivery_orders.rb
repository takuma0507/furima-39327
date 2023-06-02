class CreateDeliveryOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_orders do |t|
      t.references :delivery, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.timestamps
    end
  end
end
