class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :set_current_cart
  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_path 
    elsif resource.is_a?(Purchaser)
      products_path  
    else
      super  
    end
  end
  protected
  def check_admin
    if !current_admin
        redirect_to :products
    end
  end

  private
  
  def set_current_cart
    if session[:current_cart_id]
      @current_cart = Cart.find_by_secret_id(session[:current_cart_id])
      if current_purchaser && !@current_cart.purchaser
        @current_cart.update(purchaser_id: current_purchaser.id)
      end
    else
      if current_purchaser && current_purchaser.carts.any?
        @current_cart = current_purchaser.carts.last
        session[:current_cart_id] = @current_cart.secret_id
      end
    end 
  end
end
