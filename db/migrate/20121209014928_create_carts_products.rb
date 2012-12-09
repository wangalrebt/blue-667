class CreateCartsProducts < ActiveRecord::Migration
  def change
    create_table :carts_products do |t|
      t.integer :carts_id
      t.integer :quantity, :default => 1
      t.integer :products_id

      t.timestamps
    end
  end
end
