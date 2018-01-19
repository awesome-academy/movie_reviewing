class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :user
      t.belongs_to :watching_time
      t.integer :quantity
      t.integer :status

      t.timestamps
    end
  end
end
