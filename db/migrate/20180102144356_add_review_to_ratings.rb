class AddReviewToRatings < ActiveRecord::Migration[5.1]
  def change
    add_column :ratings, :review, :text
  end
end
