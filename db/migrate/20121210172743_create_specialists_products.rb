class CreateSpecialistsProducts < ActiveRecord::Migration
  def change
    create_table :specialists_products do |t|
      t.integer :product_id

      t.timestamps
    end
  end
end
