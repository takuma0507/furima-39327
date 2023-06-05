class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  def sold_out?
    item = item
  end
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_situation
  belongs_to :delivery_money
  belongs_to :send_region
  belongs_to :send_day
  has_one :order

  validates :image, presence: true
  validates :item, presence: true
  validates :item_comment, presence: true
  validates :item_category_id, presence: true
  validates :item_situation_id, presence: true
  validates :delivery_money_id, presence: true
  validates :send_region_id, presence: true
  validates :send_day_id, presence: true, numericality: { other_than: 1, message: "を入力してください"}
  # validates :price, presence: true,
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, only_integer: true, message: "は300円以上9,999,999以下で入力してください" }
  validates :item_category_id, numericality: { other_than: 1, message: "を選択してください" } 
  validates :item_situation_id, numericality: { other_than: 1, message: "を選択してください" } 
  validates :delivery_money_id, numericality: { other_than: 1, message: "を選択してください" } 
  validates :send_region_id, numericality: { other_than: 1, message: "を選択してください" } 
  validates :send_day_id, numericality: { other_than: 1, message: "を選択してください" } 
end
