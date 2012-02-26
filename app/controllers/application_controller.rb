class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :currentlinkedin_user, :currentfb_user

  private

  def currentlinkedin_user
    @currentlinkedin_user ||= User.find_by_linkedinuid(session[:user_id]) if session[:user_id]
  end
  
  def currentfb_user
    @currentfb_user ||= User.find_by_fbuid(session[:fbuser_id]) if session[:fbuser_id]
  end
end
