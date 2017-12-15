class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.references :post_review
      t.references :user
      t.integer :mark, default: 0

      t.timestamps
    end
    add_index :ratings, [:post_review_id, :user_id], unique: true
  end
end
