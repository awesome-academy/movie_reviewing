class AddStatusToFilms < ActiveRecord::Migration[5.1]
  def change
    add_column :films, :status, :integer, default: 0
  end
end
