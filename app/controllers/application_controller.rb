class ApplicationController < ActionController::Base
  private

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def require_signin
    unless current_user
      session[:intended_url] = request.url
      redirect_to articles_path, alert: "You do not have permission for it"
    end
  end

end
