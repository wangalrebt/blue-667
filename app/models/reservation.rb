class Reservation < ActiveRecord::Base
  attr_accessible :name, :number_of_tables, :order_id, :phone, :start_date, :user_id, :cart_id

  belongs_to :cart, :foreign_key => "cart_id"
  belongs_to :user
  validates_presence_of :name, :number_of_tables, :start_date, :phone
end
