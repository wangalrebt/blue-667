class Cart < ActiveRecord::Base
  attr_accessible :users_id

  has_many :carts_products, :foreign_key => "carts_id", :class_name => "CartsProduct", :dependent => :destroy
  belongs_to :user, :foreign_key => "users_id", :primary_key => "id"

  def line_item
    CartsProduct.select("id, carts_id, products_id, sum(quantity) as quantity").where("carts_id = ?", id).group("products_id")
  end
end
