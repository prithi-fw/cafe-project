class AdminController < ApplicationController
    def index
      redirect_to new_menu_path
    end
end