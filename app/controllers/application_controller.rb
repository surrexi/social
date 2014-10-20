class ApplicationController < ActionController::Base
  include PublicActivity::StoreController

  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_locale

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  def set_locale
    I18n.locale = current_user ? current_user.locale : I18n.default_locale
  end
end
