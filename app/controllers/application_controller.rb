class ApplicationController < ActionController::Base

    #protected_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?


    def check_is_admin
    if current_user.is_admin
        return true
     else 
        redirect_to products_path,notice:"page you are looking for not available"
    end

  end

  private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
   # binding.pry
    new_user_session_path

  end
    
def after_sign_in_path_for(resource_or_scope)
   if current_user.is_admin
    dashboard_index_path
   else
    root_path
   end
  end


  
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username,:gender, :mobile])
    end




end
