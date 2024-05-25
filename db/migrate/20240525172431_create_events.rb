class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.datetime :start_time
      t.datetime :end_time
      t.integer :total_sits, default: 0
      t.integer :remaining_sits, default: 0
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
