class MenusController < ApplicationController
  def index
    @current_user = current_user
    render "index"
  end
  def new
    render "new"
  end
  def show
    render "show"
  end
  def create
    id = params[:menu_id]
    item_name = params[:menu_item]
    Menu.create!(id: id, menu_name: item_name)
    
    redirect_to new_menu_path
  end
  def destroy
    id = params[:id]
    Menu.find(id).destroy
    redirect_to menus_path
  end
  def edit
    @id = params[:id]
    render "edit"
  end
end


  