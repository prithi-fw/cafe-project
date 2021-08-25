class HomeController < ApplicationController
    skip_before_action :ensure_user_logged_in

    def index
      @current_user = current_user
      if @current_user
        if @current_user.role == "customer"
          redirect_to menus_path
        elsif @current_user.role == "owner"
          redirect_to admin_index_path
        else
          redirect_to clerk_index_path
        end
        
      else
        render "index"
      end

    end
end