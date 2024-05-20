class ChangeCommentsAndLikeDefaultsInProducts < ActiveRecord::Migration[7.1]
  def change
    change_column_default :products, :like, from: nil, to: 0
    change_column_default :products, :assistants, from: nil, to: 0
    add_column :products, :comments_counter, :integer, default: 0
  end
end
