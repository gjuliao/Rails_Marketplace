class ChangeCategoryIdInProducts < ActiveRecord::Migration[7.1]
  def change
    change_column_null :products, :category_id, false
  end
end
