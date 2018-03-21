class ApplicationController < ActionController::Base
  before_action :ransack

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  # protect_from_forgery :except => [:user]
  protected

  def after_sign_out_path_for(resource)
    root_path
  end

  def after_sign_in_path_for(resource)
  	case resource
  	when Admin
  		users_path
  	when User
  		user_path(current_user)
  	end
  end

  def ransack
    @q = Cd.ransack(params[:q])
  end

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :kanan_first_name, :kana_last_name, :zipcode, :tel, :prefecture_id, :address, :nickname])
  end
end
