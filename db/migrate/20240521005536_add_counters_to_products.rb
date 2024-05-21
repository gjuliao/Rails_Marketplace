class AddCountersToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :likes_counter, :integer, default: 0
    rename_column :products, :user_id, :owner_id
  end
end
