class OrdersController < ApplicationController
    def index
        @orders = Order.placed_orders(session[:current_user_id])

        render "index"
    end
    def create 
      order = Order.find(session[:current_order_id])
      order.update!(total_price: params[:total_price].to_f,
                    place_order: true, order_delivered: false)
      session[:current_order_id] = Order.new_order(session[:current_user_id])
      redirect_to orders_path
    end
    def update
        id = params[:id]
        order = Order.find(id)
        order.delivered_at = DateTime.now
        order.order_delivered = true
        order.save!
        redirect_to pending_orders_path
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
        redirect_to menus_path
    end

    def pending
      @orders = Order.pending_orders?
      render "pending"
    end
end