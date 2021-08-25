class MenuItemsController < ApplicationController
    def create
        id = params[:menu_id]
        item_name = params[:menu_item_name]
        item_price = params[:menu_item_price]
        MenuItem.create!(menu_id: id, menu_item_name: item_name, menu_item_price: item_price)
        redirect_to menu_path(id: id)
    end
 
    def destroy
      id = params[:id]
      menu_item_id = MenuItem.find(id).menu_id
      MenuItem.find(id).destroy
      redirect_to menu_path(id: menu_item_id)
     end
end
