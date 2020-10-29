class CartsController < ApplicationController
    def index 
        @cart = current_cart
        @Total = current_cart.total_price
    end
end
