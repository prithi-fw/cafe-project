class Menu < ActiveRecord::Base
    has_many :menu_items

    def to_pleasant_string
        "#{menu_id}. #{menu_item}"
    end
  end