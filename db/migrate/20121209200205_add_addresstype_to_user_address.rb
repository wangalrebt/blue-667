class AddAddresstypeToUserAddress < ActiveRecord::Migration
  def change
    add_column :user_addresses, :address_type, :string
  end
end
