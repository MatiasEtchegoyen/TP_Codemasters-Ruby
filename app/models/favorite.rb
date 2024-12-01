class Favorite < ApplicationRecord
  belongs_to :product
  belongs_to :purchaser

  validates :product_id, uniqueness: { scope: :purchaser_id }
end
