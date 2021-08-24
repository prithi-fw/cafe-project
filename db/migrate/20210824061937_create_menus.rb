class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.int :menu_id
      t.string :menu_item
      t.timestamps
    end
  end
end
