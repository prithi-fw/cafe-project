class CreateOrdersItems < ActiveRecord::Migration[6.1]
  def change
    create_table :orders_items do |t|

      t.timestamps
    end
  end
end
