class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
  before_filter :set_locale

  def home
  end

  def set_locale
    if signed_in? && current_user.locale
      I18n.locale = current_user.locale
    else
      I18n.default_locale
    end
  end
end
