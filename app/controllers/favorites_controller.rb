class FavoritesController < ApplicationController
  before_action :require_login

  def index
    @favorites = current_purchaser.favorites.includes(:product)
  end

  def create
    @favorite = current_purchaser.favorites.new(favorite_params)

    if @favorite.save
      redirect_to @favorite.product
    else
      redirect_to products_path, alert: 'No se pudo añadir a favoritos.'
    end
  end

  def destroy
    @favorite = current_purchaser.favorites.find(params[:id])
    @favorite.destroy
    redirect_to request.referrer || products_path
  end

  private

  def favorite_params
    params.require(:favorite).permit(:product_id)
  end

  def require_login
    unless purchaser_signed_in?
      flash[:alert] = 'Debes iniciar sesión para añadir productos a tus favoritos.'
      redirect_to request.referrer || products_path
    end
  end
end
