class WelcomeController < ApplicationController
    before_action :authenticate_user!
    def index 
        flash[:notice] = "Hello!!"
    end
end
