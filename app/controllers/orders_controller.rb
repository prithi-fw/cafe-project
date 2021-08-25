class OrdersController < ApplicationController
    def index
        @orders = Order.pending
        render "index"
    end
    def create 
        item_ids = params[:item_ids]
        clean_item_ids = item_ids - [nil]

        Order.create_order_and_order_items(current_user.id, clean_item_ids)
        redirect_to menus_path
    end
    def update
        id = params[:id]
        order = Order.find(id)
        order.delivered_at = DateTime.now
        order.save!
        redirect_to orders_path
    end
end