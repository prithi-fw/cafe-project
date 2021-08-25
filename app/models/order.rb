class Order < ActiveRecord::Base
    has_many :order_items
    has_many :order_items, :dependent => :destroy
    belongs_to :user
    
    def self.create_order_and_order_items(user_id, item_ids, place_order, add_to_cart)
      new_order = Order.create!(
          user_id: user_id,
          delivered_at: nil,
          place_order: place_order,
          add_to_cart: add_to_cart,
          order_delivered: false,
        )
        id = new_order.id
        item_ids.each { |menu_item_id|
          OrderItem.create!(order_id: id,
                            menu_item_id: menu_item_id,
                            menu_item_name: MenuItem.find(menu_item_id).menu_item_name,
                            menu_item_price: MenuItem.find(menu_item_id).menu_item_price)
        }
    end
    def self.pending
      where(order_delivered: false)
    end
    def self.cart_items(orders)
      orders.where(add_to_cart: true)
    end
 
    def self.cart_order(order_ids)
      order_ids.each { |order_id|
        place_order(Order.find(order_id))
      }
    end
 
    def self.place_order(order)
      order.add_to_cart = false
      order.place_order = true
    
    end
end