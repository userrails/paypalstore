class OrderTransaction < ActiveRecord::Base
   attr_accessible :cart_id, :ip_address, :first_name, :last_name, :card_type, :card_expires_on,:action, :amount, :response, :success, :authorization, :message, :params
   attr_accessor :action, :amount, :response, :order_id
  
    belongs_to :order
    serialize :params
  
  def response=(response)
    self.success       = response.success?
    self.authorization = response.authorization
    self.message       = response.message
    self.params        = response.params
  rescue ActiveMerchant::ActiveMerchantError => e
    self.success       = false
    self.authorization = nil
    self.message       = e.message
    self.params        = {}
  end
end