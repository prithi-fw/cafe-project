class MenusController < ApplicationController
    def index
      render plain: Menu.all.map { |menu| menu.to_pleasant_string }.join("\n")
    end
  end