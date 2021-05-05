class ManagementPurchase
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :city, :adress, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    VALID_PHONE_NUMBER_REGEX = /\A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}\z|\A0[5789]0[-]?\d{4}[-]?\d{4}\z/
  validates :phone_number, format: { with: VALID_PHONE_NUMBER_REGEX }, numericality: {only_integer: true, }

    validates :area_id
    validates :city
    validates :adress
    validates :token
    validates :user_id
    validates :item_id

end

 def save
  management = Management.create(user_id: user_id, item_id: item_id)
  Purchase.create(post_code: post_code, phone_number: phone_number, area_id: area_id, city: city, adress: adress, building_name: building_name, management_id: management.id )
 end
end
