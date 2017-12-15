class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :content
      t.references :film

      t.timestamps
    end
  end
end
