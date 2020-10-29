class CartItemsController < ApplicationController
    def destroy 
        @cart = current_cart
        @item = @cart.cart_items.find(params[:id])
        @product = @item.product
        @item.destroy
        redirect_to carts_path, notice: "#{@product.title} Removed!"
    end

    def update 
        @cart_item = CartItem.find(params[:id])
        @cart_item.update(cart_item_params)
        redirect_to carts_path
    end

    private
    def cart_item_params 
        params.require(:cart_item).permit(:quantity)
    end
end
