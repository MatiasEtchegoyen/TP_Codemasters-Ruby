class AddNullFalseProducts < ActiveRecord::Migration[8.0]
  def change
    change_column_null :products, :nombre, false
    change_column_null :products, :descripcion, false
    change_column_null :products, :precio, false
    change_column_null :products, :imagen, false
  end
end
