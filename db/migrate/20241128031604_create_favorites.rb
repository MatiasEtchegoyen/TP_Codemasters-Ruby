class CreateFavorites < ActiveRecord::Migration[8.0]
  def change
    create_table :favorites do |t|
      t.references :product, null: false, foreign_key: true
      t.references :purchaser, null: false, foreign_key: true

      t.timestamps
    end
  end
end
