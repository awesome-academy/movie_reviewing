class CreateWatchingTimes < ActiveRecord::Migration[5.1]
  def change
    create_table :watching_times do |t|
      t.references :film
      t.references :booking
      t.datetime :time_begin
      t.date :day_watching
      t.integer :total_ticket
      t.integer :remaining_ticket

      t.timestamps
    end
  end
end
