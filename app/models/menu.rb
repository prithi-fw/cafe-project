class Menu < ActiveRecord::Base
    has_many :menu_items, :dependent => :destroy
    def self.active
      all.where(active: true)
    end
  end