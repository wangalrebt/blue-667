class CreateSpecialists < ActiveRecord::Migration
  def change
    create_table :specialists do |t|
      t.datetime :date

      t.timestamps
    end
  end
end
