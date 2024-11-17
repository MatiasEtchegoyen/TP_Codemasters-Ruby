class AdminController < ApplicationController
    before_action :check_admin
    def show
        @products = Product.all
    end

end