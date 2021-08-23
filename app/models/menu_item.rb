class MenuItem < ActiveRecord::Base
    belongs_to :menu
    def to_pleasant_string
        "#{menu_item_id}.  #{menu_item_name}  #{menu_item_price}"
      end
  end
