class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.references :board, foreign_key: true
      t.references :image, foreign_key: true

      t.timestamps
    end
  end
end
