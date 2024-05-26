class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.date :start_date
      t.date :end_date
      t.time :start_time
      t.time :end_time
      t.integer :total_sits, default: 0
      t.integer :remaining_sits, default: 0
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
