module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :set_current_user
    helper_method :current_user
    helper_method :user_signed_in?
    helper_method :user_super_admin?
  end

  def login(user)
    reset_session
    session[:current_user_id] = user.id
  end

  def logout
    reset_session
  end

  def redirect_if_authenticated
    redirect_to root_path, alert: "You are already logged in." if user_signed_in?
  end

  def user_signed_in?
    Current.user && Current.user.present?
  end

  def user_super_admin?
    user_signed_in? && Current.user.role == 'super_admin'
  end

  def current_user
    Current.user
  end

  private

  def set_current_user
    Current.user ||= session[:current_user_id] && User.find_by(id: session[:current_user_id])
  end

end
