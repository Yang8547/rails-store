class CartsController < ApplicationController
    def index 
        @cart = current_cart
        @Total = current_cart.total_price
    end

    def clean 
        current_cart.cart_items.destroy_all
        redirect_to carts_path, notice: "Cart Clean!"
    end

end
