class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :nombre
      t.text :descripcion
      t.integer :precio
      t.text :imagen

      t.timestamps
    end
  end
end
