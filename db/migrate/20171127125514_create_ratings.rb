class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.references :film
      t.references :user
      t.integer :mark, default: 0

      t.timestamps
    end
    add_index :ratings, [:film_id, :user_id]
  end
end
