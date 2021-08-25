class MenuItem < ActiveRecord::Base
   validates :menu_item_name, presence: true
   validates :menu_item_name, length: { minimum: 2 }
   validates :menu_item_price, presence: true
   validates :menu_item_price, numericality: { only_integer: true }
   
    belongs_to :menu
    
  end
