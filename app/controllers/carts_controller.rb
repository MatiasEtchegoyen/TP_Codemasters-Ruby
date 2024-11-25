class CartsController < ApplicationController
    before_action :set_product, only: [:create, :destroy]
    def create
        @current_cart.cart_items.create(product_id: params[:product_id])
        redirect_to :products
    end
    def show
        
    end
    def checkout 
        if @current_cart.cart_items.any?
            session[:current_cart_id] = nil
        end
        redirect_to :products, notice: 'Compra realizada con exito! Gracias!'
    end

    def destroy
        @cart_item = @current_cart.cart_items.find_by_product_id(@product.id)
        @cart_item.destroy
        redirect_to cart_path(@current_cart)
    end
    
    private 
    
    def set_product
        @product = Product.find(params[:product_id])
    end
end