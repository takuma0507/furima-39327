class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item,                null: false
      t.text :item_comment,                null: false
      t.integer :item_category_id,                null: false
      t.integer :item_situation_id,                null: false
      t.integer :delivery_money_id,                null: false
      t.integer :send_region_id,                null: false
      t.integer :send_day_id,                null: false
      t.integer :price,                null: false
      t.references :user,                null: false, foreign_key: true
      t.timestamps
    end
  end
end
