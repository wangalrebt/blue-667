class CartsProduct < ActiveRecord::Base
  attr_accessible :cart_id, :product_id, :quantity
  belongs_to :cart, :foreign_key => "product_id"
  belongs_to :product, :foreign_key => "product_id"

  def full_price
    (quantity * product.price).round
  end

  private

  def set_default
    self.quantity = 1 unless self.quantity
  end
end
