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
    def cart
        order_item = OrderItem.exist?(session[:current_user_id], session[:current_order_id], params[:menu_item_id])
        if order_item
          updated_quantity = order_item.quantity + params[:quantity].to_i
          order_item.update!(quantity: updated_quantity,
                             price: updated_quantity * params[:item_price].to_f)
        else
          order_item = OrderItem.new(
            order_id: session[:current_order_id],
            menu_item_id: params[:menu_item_id],
            menu_item_name: params[:item_name],
            menu_item_price: params[:item_price],
            quantity: params[:quantity],
            price: params[:quantity].to_f * params[:item_price].to_f,
          )
          if (order_item.save)
            # nothing
          else
            flash[:error] = order_item.errors.full_messages.join(",")
          end
    end
        redirect_to menu_path(params[:menu_id])
    end
end