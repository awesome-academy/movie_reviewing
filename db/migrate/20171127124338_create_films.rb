class CreateFilms < ActiveRecord::Migration[5.1]
  def change
    create_table :films do |t|
      t.string :name
      t.integer :play_time
      t.string :link_trailer
      t.string :image
      t.float :imdb_rate, default: 0

      t.timestamps
    end
  end
end
