class OrderType < ActiveRecord::Base
  attr_accessible :name
  belongs_to :order
end
