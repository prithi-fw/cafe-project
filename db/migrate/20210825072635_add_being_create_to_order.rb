class AddBeingCreateToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :being_created, :boolean
    add_column :orders, :order_confirmed, :boolean
    add_column :orders, :order_delivered, :boolean
   

  end
end
