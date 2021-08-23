class MenusController < ApplicationController
    def index
      #render plain: Menu.all.map { |menu| menu.to_pleasant_string }.join("\n")
      render "index"
    end
    def show
        render "show"
      end
      def create
        id = params[:menu_id]
        item_name = params[:menu_item]
        Menu.create!(menu_id: id, menu_item: item_name)
        
        redirect_to menus_path
      end
      def destroy
        id = params[:id]
        Menu.find(id).destroy
        redirect_to menus_path
      end
  end


  