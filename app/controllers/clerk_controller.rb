class ClerkController < ApplicationController
    def index
      @orders = Order.pending_orders?
      render "pending"
    end
  end