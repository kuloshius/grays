module SessionsHelper

  def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def authenticate
    redirect_to(root_path) unless current_user
  end
  
end
