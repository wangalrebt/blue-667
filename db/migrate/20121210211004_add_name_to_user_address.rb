class AddNameToUserAddress < ActiveRecord::Migration
  def change
    add_column :user_addresses, :name, :string
  end
end
