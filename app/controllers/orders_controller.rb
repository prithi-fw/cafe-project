class OrdersController < ApplicationController
    def index
        @orders = Order.pending
        render "index"
    end
    def create 
        item_ids = params[:item_ids]
        clean_item_ids = item_ids - [nil]
        place_order = placing_an_order?
        add_to_cart = adding_to_cart?
        place_order = placing_an_order?
        add_to_cart = adding_to_cart?
        Order.create_order_and_order_items(current_user.id, clean_item_ids, place_order, add_to_cart)
     
        redirect_to menus_path
    end
    def update
        id = params[:id]
        order = Order.find(id)
        order.delivered_at = DateTime.now
        order.order_delivered = true
        order.save!
        redirect_to orders_path
    end
    def placing_an_order?
        params[:commit] == "Place Order"
    end
   
    def adding_to_cart?
        params[:commit] == "Add to Cart"
    end
   
    def show_cart
        @orders = Order.cart_items
        render "cart.html.erb"
    end
end