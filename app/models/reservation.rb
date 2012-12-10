class Reservation < ActiveRecord::Base
  attr_accessible :name, :number_of_tables, :order_id, :phone, :start_date, :user_id
end
