class Event < ActiveRecord::Base
  attr_accessible :name, :order_id, :requirement, :user_id
  belongs_to :user
  belongs_to :order
end
