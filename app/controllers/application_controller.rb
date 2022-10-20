class ApplicationController < ActionController::Base

    def after_sign_up_path_for(ressource_or_scope)
        root_path
    end

end
