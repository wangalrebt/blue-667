class Specialist < ActiveRecord::Base
  attr_accessible :date

  has_many :specialists_products, :primary_key => "id", :foreign_key => "specialist_id"
  has_many :products, :through => :specialists_products


end
