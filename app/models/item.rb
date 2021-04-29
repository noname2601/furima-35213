class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :category
  belongs_to :item_condition
  belongs_to :shipping_free
  belongs_to :area
  belongs_to :ship_day

  belongs_to :user
  

  with_options presence: true do
    validates :selling_price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
    validates :name
    validates :introduction
    validates :category_id
    validates :item_condition_id
    validates :shipping_free_id
    validates :area_id
    validates :ship_day_id
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :item_condition_id
    validates :shipping_free_id
    validates :area_id
    validates :ship_day_id
  end
  

end

