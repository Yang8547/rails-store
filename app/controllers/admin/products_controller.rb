class Admin::ProductsController < ApplicationController
    before_action :authenticate_user!
    before_action :admin_required, only:[:new, :create, :edit, :update, :destroy]
    before_action :find_product, only: [:edit, :update, :destroy]

    def index 
        @products = Product.all
    end

    def show 
        @product = Product.find(params[:id])
    end

    def new 
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)
        if(@product.save)
            redirect_to admin_products_path, notice: "Create Success"
        else
            render 'new'
        end
    end

    def edit 

    end

    def update 
        if @product.update(product_params)
            # notice == Convenience accessor for flash[:notice]
            redirect_to admin_products_path, notice: "Update Success"
        else
            render 'edit'
        end
    end

    def destroy 
        @product.destroy
        redirect_to admin_products_path, alert: "Delete Success"
    end

    private
    def find_product
        @product = Product.find(params[:id])
    end

    def product_params
        params.require(:product).permit(:title, :description, :price, :quantity)
     end
end
