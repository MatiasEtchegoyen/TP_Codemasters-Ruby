class Cart < ApplicationRecord
    belongs_to :purchaser, optional: true
    before_create :set_secret_id
    has_many :cart_items, dependent: :destroy
    has_many :products, through: :cart_items

    private
    
    def set_secret_id
        self.secret_id = SecureRandom.uuid + DateTime.now.to_i.to_s
    end
end
