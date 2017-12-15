class AddDescribeToFilms < ActiveRecord::Migration[5.1]
  def change
    add_column :films, :describe, :text
  end
end
