class CartItemsController < ApplicationController
    def destroy 
        @cart = current_cart
        @item = @cart.cart_items.find(params[:id])
        @product = @item.product
        @item.destroy
        redirect_to carts_path, notice: "#{@product.title} Removed!"
    end
end
