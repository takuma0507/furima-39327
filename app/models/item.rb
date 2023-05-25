class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_situation
  belongs_to :delivery_money
  belongs_to :send_region
  belongs_to :send_day

  validates :image, presence: true
  validates :item, presence: true
  validates :item_comment, presence: true
  validates :item_category_id, presence: true
  validates :item_situation_id, presence: true
  validates :delivery_money_id, presence: true
  validates :send_region_id, presence: true
  validates :send_day_id, presence: true, numericality: { other_than: 1 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with: /\A[0-9]+\z/ } 
  validates :item_category_id, numericality: { other_than: 1 } 
  validates :item_situation_id, numericality: { other_than: 1 } 
  validates :delivery_money_id, numericality: { other_than: 1 } 
  validates :send_region_id, numericality: { other_than: 1 } 
  validates :send_day_id, numericality: { other_than: 1 } 
  # validates :send_region_id, presence: true
end
