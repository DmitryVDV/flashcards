class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  layout :layout_by_resource

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end

  private

  def layout_by_resource
    if devise_controller? && action = "new"
      "new_session_for_devise"
    else
      "application"
    end
  end

end
