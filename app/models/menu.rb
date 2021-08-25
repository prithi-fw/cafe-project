class Menu < ActiveRecord::Base
    validates :menu_name, presence: true
    validates :menu_name, length: { minimum: 2 }
    has_many :menu_items, :dependent => :destroy
    def self.active
      all.where(active: true)
    end
  end