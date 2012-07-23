require 'settingslogic'
class ApplicationController < ActionController::Base
  before_filter :prepend_view_paths

  protect_from_forgery

  private

  def current_user
    
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def prepend_view_paths # Set theme
    Settings.reload! # Reload settings to refresh theme.

  	theme_path = "public/themes/"+Settings.theme_path 
    prepend_view_path theme_path

  end

  helper_method :current_user

end

class Settings < Settingslogic
  source Rails.root.join('config', 'config.yml')
  namespace Rails.env
end
