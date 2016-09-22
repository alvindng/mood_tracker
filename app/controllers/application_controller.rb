class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if current_user.user_profile
      user_profile_path(current_user.user_profile)
    else
      new_user_profile_path
    end
  end
end
