class ChangeColumnFromOrderItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :order_items, :menu_item_price
    add_column :order_items, :menu_item_price, :float
   
  end
end
