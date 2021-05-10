class RecordOrder

  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_prefectures_id, :city, :address, :building, :phone_number, :user_id, :item_id, :token
  
  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :delivery_prefectures_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
    validates :token
    validates :user_id
    validates :item_id
  end
  def save
    record = Record.create(user_id: user_id, item_id:item_id)
    Order.create(postal_code: postal_code, delivery_prefectures_id: delivery_prefectures_id, city: city, address: address, building: building, phone_number: phone_number,record_id: record)
  end

end