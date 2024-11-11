class Product < ApplicationRecord
    ORDENAR_POR = {
        recientes: "created_at DESC",
        menor_precio: "precio ASC",
        mayor_precio: "precio DESC"
    }


    validates :nombre, presence: true
    validates :descripcion, presence: true
    validates :precio, presence: true
    validates :imagen, presence: true
end
