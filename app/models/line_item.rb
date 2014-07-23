class LineItem < ActiveRecord::Base
   attr_accessible :unit_price, :product_id, :cart_id, :quantity
  
  belongs_to :cart
  belongs_to :product
  
  def full_price
    unit_price * quantity
  end
end