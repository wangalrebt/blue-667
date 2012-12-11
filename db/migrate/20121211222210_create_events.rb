class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :requirement
      t.integer :order_id

      t.timestamps
    end
  end
end
