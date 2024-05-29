class RenameUserIdToCustomerIdInBookings < ActiveRecord::Migration[7.1]
  def change
    rename_column :bookings, :user_id, :customer_id
  end
end
