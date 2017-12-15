class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :user
      t.integer :quantity
      t.float :price
      t.integer :status

      t.timestamps
    end
  end
end
