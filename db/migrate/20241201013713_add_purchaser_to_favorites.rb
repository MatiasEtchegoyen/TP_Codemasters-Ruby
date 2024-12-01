class AddPurchaserToFavorites < ActiveRecord::Migration[8.0]
  def change
    add_reference :favorites, :purchaser, null: false, foreign_key: true
  end
end
