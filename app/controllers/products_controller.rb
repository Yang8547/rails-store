class ProductsController < ApplicationController
    def index 
        @products = Product.all
    end

    def show 
        @product = Product.find(params[:id])
    end

    def add_to_cart
        @product = Product.find(params[:id])
        if current_cart.products.include?(@product)
            redirect_to product_path(@product), alert: "You have added this item!"
        else
            current_cart.add_product_to_cart(@product)
            redirect_to product_path(@product), notice: "ADD!!!!"
        end
    end
end
