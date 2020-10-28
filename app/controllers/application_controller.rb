class ApplicationController < ActionController::Base
    def admin_required
        if !current_user.is_admin
            redirect_to new_user_session_path
        end
    end
end
