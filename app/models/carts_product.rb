class CartsProduct < ActiveRecord::Base
  attr_accessible :carts_id, :products_id, :quantity
  before_create :set_default

  belongs_to :product, :primary_key => "id", :foreign_key => "products_id"
  belongs_to :cart

  def full_price
    quantity * product.price
  end

  private

  def set_default
    self.quantity = 1 unless self.quantity
  end


end
