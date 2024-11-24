class Cart < ApplicationRecord
    before_create :set_secret_id
    has_many :cart_items
    has_many :products, through: :cart_items

    private
    
    def set_secret_id
        self.secret_id = SecureRandom.uuid + DateTime.now.to_i.to_s
    end
end
