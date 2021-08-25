class Order < ActiveRecord::Base
    has_many :order_items
    belongs_to :user
    
    def self.create_order_and_order_items(user_id, item_ids)
        new_order = Order.create!(
          user_id: user_id,
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
        where(delivered_at: nil)
    end
   
end