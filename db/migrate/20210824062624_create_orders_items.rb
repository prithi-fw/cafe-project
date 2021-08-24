class CreateOrdersItems < ActiveRecord::Migration[6.1]
  def change
    create_table :orders_items do |t|
      t.string :order_id
      t.string :menu_item_id
      t.string :menu_item_name
      t.string :menu_item_price
    
      t.timestamps
    end
  end
end
