class AddOrderIdToUserAddresses < ActiveRecord::Migration
  def change
    add_column :user_addresses, :order_id, :integer
  end
end
