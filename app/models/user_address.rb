class UserAddress < ActiveRecord::Base
  attr_accessible :name, :address1, :address2, :city, :state, :zip

  belongs_to :user
  belongs_to :order, :foreign_key => "order_id"
end
