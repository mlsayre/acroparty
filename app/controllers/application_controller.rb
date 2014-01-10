class ApplicationController < ActionController::Base
  protect_from_forgery
  #around_filter :set_time_zone

  def after_sign_in_path_for(resource)
    foyer_path
  end

  # def set_time_zone
  #   old_time_zone = Time.zone
  #   Time.zone = current_user.time_zone if user_signed_in?
  #   yield
  # ensure
  #   Time.zone = old_time_zone
  # end
end
