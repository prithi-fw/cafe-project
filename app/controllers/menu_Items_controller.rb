class MenuItemsController < ApplicationController
    def index
        render "index"
    end
    def create
        id = params[:menu_id]
        item_name = params[:menu_item_name]
        item_price = params[:menu_item_price]
        new_menu_item = MenuItem.new(menu_id: id, menu_item_name: item_name, menu_item_price: item_price)
        if new_menu_item.save
            redirect_to menu_path(id: id)
        else
            flash[:error] = new_menu_item.errors.full_messages.join(",")
            redirect_to menu_path(id: id)
        end
    end
 
    def destroy
      id = params[:id]
      menu_item_id = MenuItem.find(id).menu_id
      MenuItem.find(id).destroy
      redirect_to menu_path(id: menu_item_id)
     end
end
