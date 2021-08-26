class RemoveColumnFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :add_to_cart

  end
end
