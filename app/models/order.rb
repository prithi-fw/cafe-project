class Order < ActiveRecord::Base
    has_many :order_items
    has_many :order_items, :dependent => :destroy
    belongs_to :user
    
 
    def self.place_order(order)
      order.add_to_cart = false
      order.place_order = true
    
    end
    def self.new_order(user_id)
      new_order = Order.create!(user_id: user_id, place_order: false, total_price: 0)
      new_order.id
    end
 
    def self.placed_orders(user_id)
      orders = User.find(user_id).orders.where(place_order: true)
    end
    def self.pending_orders?
      orders = Order.where(order_delivered: false)
    end
  
 
end