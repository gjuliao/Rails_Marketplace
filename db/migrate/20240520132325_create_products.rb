class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :assistants
      t.string :comments
      t.integer :like
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
