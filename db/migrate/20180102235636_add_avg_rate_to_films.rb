class AddAvgRateToFilms < ActiveRecord::Migration[5.1]
  def change
    add_column :films, :avg_rate, :float, :precision => 1, :scale => 2, default: 0
  end
end
