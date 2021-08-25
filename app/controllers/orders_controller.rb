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
        @orders = Order.cart_items(current_user.orders)
        render "cart.html.erb"
    end
    def cart_to_order
        order_ids = params[:order_ids]
        clean_order_ids = order_ids - [nil]
        if clean_order_ids.length() != 0
          Order.cart_order(clean_order_ids)
          @orders = Order.cart_items(current_user.orders)
        end
        redirect_to show_cart_path
    end
end