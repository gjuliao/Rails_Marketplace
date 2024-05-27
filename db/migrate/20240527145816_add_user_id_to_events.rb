class AddUserIdToEvents < ActiveRecord::Migration[7.1]
  def change
    add_reference :events, :user, null: true, foreign_key: true
  end
end
