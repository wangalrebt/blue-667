class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.datetime :start_date
      t.integer :number_of_tables
      t.integer :order_id
      t.string :name
      t.integer :phone

      t.timestamps
    end
  end
end
