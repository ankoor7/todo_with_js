class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert:"You can't access this page"
  end

  after_filter :set_access_control_headers

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = 'http://localhost:3000/'
    headers['Access-Control-Request-Method'] = '*'
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end


  def redirect_back_or_root
    redirect_to(session.delete(:return_to) || root_path)
  end

def stored_location
  session.delete(:return_to)
end



  private
  def authenticate
    unless logged_in?
      flash[:error] = "You must be logged in to access this section of the site"
      store_location
      redirect_to login_url
    end
  end

  def store_location
    session[:return_to] = request.fullpath if request.get? && controller_name != "user_sessions" && controller_name != "sessions"
  end

end
