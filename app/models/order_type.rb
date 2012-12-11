class OrderType < ActiveRecord::Base
  has_many :orders, :foreign_key => "order_type_id"
end
