class CreatePostReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :post_reviews do |t|
      t.references :user
      t.string :title
      t.text :content
      t.boolean :approve, default: false

      t.timestamps
    end
    add_index :post_reviews, [:user_id, :created_at]
  end
end
