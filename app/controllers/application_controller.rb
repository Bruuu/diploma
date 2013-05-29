class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  def home
  end
  #before_filter :set_locale

  #def set_locale
  #  I18n.locale = params[:locale] || I18n.default_locale
  #end
end
