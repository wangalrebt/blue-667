class AddSpecialistIdToSpecialistsProduct < ActiveRecord::Migration
  def change
    add_column :specialists_products, :specialist_id, :integer
  end
end
