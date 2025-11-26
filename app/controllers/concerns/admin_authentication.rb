module AdminAuthentication
  extend ActiveSupport::Concern

  protected

  def authenticate_admin_user!
    unless current_user&.admin?
      redirect_to admin_login_path, alert: "You must be an admin to access this page."
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue ActiveRecord::RecordNotFound
    session[:user_id] = nil
    nil
  end
end
