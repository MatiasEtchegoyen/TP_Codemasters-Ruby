class Product < ApplicationRecord
    ORDENAR_POR = {
        mas_recientes: "created_at DESC",
        mas_antiguos: "created_at ASC",
        menor_precio: "precio ASC",
        mayor_precio: "precio DESC"
    }


    validates :nombre, presence: true
    validates :descripcion, presence: true
    validates :precio, presence: true
    validates :imagen, presence: true
    has_many :cart_items
    has_many :favorites, dependent: :destroy
end
