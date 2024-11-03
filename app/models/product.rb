class Product < ApplicationRecord
    validates :nombre, presence: true
    validates :descripcion, presence: true
    validates :precio, presence: true
    validates :imagen, presence: true
end
