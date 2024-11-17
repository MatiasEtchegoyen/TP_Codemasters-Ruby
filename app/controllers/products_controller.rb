class ProductsController < ApplicationController
    before_action :check_admin, except: ["index", "show"]
    def index
        @products = Product.all

        ordenar_por = Product::ORDENAR_POR.fetch(params[:ordenar_por]&.to_sym, Product::ORDENAR_POR[:mas_recientes])
        
        @products = @products.order(ordenar_por)
    end

    def show
        @product = Product.find(params[:id])
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params) 
        if @product.save
            redirect_to products_path, notice: 'Tu producto ha sido agregado correctamente al catalogo!'
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @product = Product.find(params[:id])
    end

    def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
            redirect_to products_path, notice: 'Tu producto ha sido actualizado!'
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
         redirect_to products_path, notice: 'Tu producto ha sido eliminado correctamente!'
    end
    private

    def product_params
        params.require(:product).permit(:nombre, :descripcion, :precio, :imagen)
    end
end