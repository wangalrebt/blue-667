class Product < ActiveRecord::Base
  attr_accessible :description, :name, :picture, :price, :product_type
  has_one :product_types, :primary_key => "product_type"

  def self.my_find type
    where("type = ?", type)
  end
end
