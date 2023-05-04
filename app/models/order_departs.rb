class OrderDeparts
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_cord, :area_id, :municipalities,:address, :building, :telephone, :token
  with_options presence: true do
    validates :post_cord,      format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :area_id,        numericality:  { other_than: 1 }
    validates :municipalities
    validates :address
    validates :telephone,      format: { with: /\A[0-9]{10,11}\z/ }
    validates :user_id
    validates :item_id
  end
  
  def save
    ordre = Order.create(user_id: user_id, item_id: item_id)
    departs = Depart.create(post_cord: post_cord , area_id: area_id, municipalities: municipalities, address: address, building: building, telephone: telephone, order_id: ordre.id)
  end
end