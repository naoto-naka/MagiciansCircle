class ApplicationController < ActionController::Base
  #before_action :authenticate_end_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if resource.is_a?(AdminUser)
      admin_dashboard_path
    else
  	  end_user_root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    end_user_root_path
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:user_name, :email, :password, :password_confirmation, :image ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
end
