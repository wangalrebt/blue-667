class SpecialistsProduct < ActiveRecord::Base
  attr_accessible :product_id

  belongs_to :specialist, :foreign_key => "specialist_id"
  belongs_to :product, :foreign_key => "product_id"


end
