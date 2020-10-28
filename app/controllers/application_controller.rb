class ApplicationController < ActionController::Base
    def admin_required
        if !current_user.is_admin
            redirect_to new_user_session_path
        end
    end

    # For view
    helper_method :current_cart

    def current_cart
        @current_cart ||= find_cart
    end


    private

    def find_cart
        cart = Cart.find_by(id: session[:cart_id])
        if cart.blank?
            cart = Cart.create
        end
        session[:cart_id] = cart.id
        return cart
    end
end
