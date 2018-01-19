class CreateWatchingDays < ActiveRecord::Migration[5.1]
  def change
    create_table :watching_days do |t|
      t.references :film
      t.date :day_watching

      t.timestamps
    end
  end
end
