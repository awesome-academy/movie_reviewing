class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.references :user
      t.references :post_review

      t.timestamps
    end
    add_index :likes, [:user_id, :post_review_id], unique: true
  end
end
