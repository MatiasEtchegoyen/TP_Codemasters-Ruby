class AddPurchaserToCarts < ActiveRecord::Migration[8.0]
  def change
    add_reference :carts, :purchaser, null: true, foreign_key: true
  end
end
