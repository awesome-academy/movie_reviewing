class CreateWatchingTimes < ActiveRecord::Migration[5.1]
  def change
    create_table :watching_times do |t|
      t.references :watching_day, foreign_key: true
      t.datetime :time
      t.integer :total_ticket
      t.integer :remaining_ticket
      t.integer :price

      t.timestamps
    end
  end
end
