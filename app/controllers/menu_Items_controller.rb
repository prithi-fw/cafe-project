class MenuItemsController < ApplicationController
    def create
        id = params[:menu_id]
        item_id = params[:menu_item_id]
        item_name = params[:menu_item_name]
        item_price = params[:menu_item_price]
        MenuItem.create!(menu_id: id, menu_item_id: item_id, menu_item_name: item_name, menu_item_price: item_price)
        redirect_to "http://localhost:3000/menus/#{id}"
    end
end
