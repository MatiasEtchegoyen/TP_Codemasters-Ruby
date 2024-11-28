class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.includes(:product).all
  end

  def create
    @favorite = Favorite.new(favorite_params)

    if @favorite.save
      redirect_to @favorite.product
    else
      redirect_to products_path, alert: 'No se pudo añadir a favoritos.'
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to request.referrer || products_path
  end

  private

  def favorite_params
    params.require(:favorite).permit(:product_id)
  end
end
