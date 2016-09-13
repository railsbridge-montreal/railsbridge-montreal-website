class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_registration

  def set_registration
    @waitlisting = Edition.find(2).registrants.active.count >= 120
  end

  protected

  def default_url_options(options={})
    { locale: I18n.locale }
  end

end
