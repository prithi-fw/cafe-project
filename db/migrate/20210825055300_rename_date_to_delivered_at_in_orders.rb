class RenameDateToDeliveredAtInOrders < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :date, :delivered_at

  end
end
