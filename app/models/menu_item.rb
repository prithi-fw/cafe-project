class MenuItem < ActiveRecord::Base
    belongs_to :menu
    has_one_attached :image
    def to_pleasant_string
        "#{menu_item_name}  #{menu_item_price}"
    end
  end
