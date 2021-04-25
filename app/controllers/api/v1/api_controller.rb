module Api 
    module V1
        class ApiController < ActionController::Base
            #Skip validation of crsf token
            skip_before_action :verify_authenticity_token
            before_action :configure_permitted_parameters, if: :devise_controller?

            protected
            def configure_permitted_parameters
                devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name])
            end

        end
    end
end


