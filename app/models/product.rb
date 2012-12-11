class Product < ActiveRecord::Base
  attr_accessible :description, :name, :picture, :price, :product_type

  has_many :carts_products, :foreign_key => "products_id"
  has_many :carts, :through => :carts_products

  has_one :product_types, :foreign_key => "product_id"
  has_many :specialists_products, :foreign_key => "product_id", :primary_key => "id"
  has_many :specialists, :through => :specialists_products


  def self.my_find type
    where("type = ?", type)
  end
end
