class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :being_created, :add_to_cart
    rename_column :orders, :order_confirmed, :place_order
   
  end
end
