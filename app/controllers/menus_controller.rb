class MenusController < ApplicationController
    def index
      render plain: Menu.all.map { |menu| menu.to_pleasant_string }.join("\n")
    end
    def show
        id = params[:id]
        menu_items = MenuItem.where("menu_id=?", id)
        render plain: menu_items.all.map { |menu_item| menu_item.to_pleasant_string }.join("\n")
      end
  end